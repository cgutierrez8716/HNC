document.addEventListener("DOMContentLoaded", function () {
  cargarEspecialidades();

  const especialidadSelect = document.getElementById("especialidad-select");
  if (especialidadSelect) {
    especialidadSelect.addEventListener("change", function () {
      let idEspecialidad = this.value;
      cargarMedicos(idEspecialidad);
    });
  }

  const medicoSelect = document.getElementById("medico-select");
  if (medicoSelect) {
    medicoSelect.addEventListener("change", function () {
      let idMedico = this.value;
      let fechaSeleccionadaElem = document.getElementById("fecha-cita");
      let fechaSeleccionada = fechaSeleccionadaElem ? fechaSeleccionadaElem.value : null;
      if (fechaSeleccionada) {
        cargarHorariosDisponibles(idMedico, fechaSeleccionada);
      }
    });
  }

  const fechaElem = document.getElementById("fecha-cita");
  if (fechaElem) {
    fechaElem.addEventListener("change", function () {
      let idMedico = medicoSelect ? medicoSelect.value : null;
      let fechaSeleccionada = this.value;
      if (idMedico) {
        cargarHorariosDisponibles(idMedico, fechaSeleccionada);
      }
    });
  }

  const formReserva = document.getElementById("form-reserva");
  if (formReserva) {
    formReserva.addEventListener("submit", function (event) {
      event.preventDefault();
      reservarCita();
    });
  }
});

function cargarEspecialidades() {
  fetch("http://localhost:8080/api/especialidades",
  // ****************************************************
            {headers: { "X-API-KEY": "123456" }} // API KEY OBLIGATORIA
  // ****************************************************
  )
    .then(response => response.json())
    .then(data => {
      let select = document.getElementById("especialidad-select");
      if (!select) return;
      select.innerHTML = "<option value=\"\" selected disabled>Seleccionar especialidad</option>";
      data.forEach(especialidad => {
        select.innerHTML += `<option value="${especialidad.idEspecialidad}">${especialidad.nombre}</option>`;
      });
    })
    .catch(error => console.error("Error cargando especialidades:", error));
}

function cargarMedicos(idEspecialidad) {
  fetch(`http://localhost:8080/api/medicos/especialidad/${idEspecialidad}`,
  // ****************************************************
            {headers: { "X-API-KEY": "123456" }} // API KEY OBLIGATORIA
  // ****************************************************
  )
    .then(response => response.json())
    .then(data => {
      let select = document.getElementById("medico-select");
      if (!select) return;
      select.innerHTML = "<option value=\"\" selected disabled>Seleccionar médico</option>";
      data.forEach(medico => {
        select.innerHTML += `<option value="${medico.idMedico}">${medico.nombres} ${medico.apellidos}</option>`;
      });
    })
    .catch(error => console.error("Error cargando médicos:", error));
}

function cargarHorariosDisponibles(idMedico, fechaSeleccionada) {
  fetch(`http://localhost:8080/api/disponibilidad/medico/${idMedico}`,
  // ****************************************************
            {headers: { "X-API-KEY": "123456" }} // API KEY OBLIGATORIA
  // ****************************************************
  )
    .then(response => response.json())
    .then(data => {
      let select = document.getElementById("hora-cita");
      if (!select) return;
      select.innerHTML = "<option value=\"\" selected disabled>Seleccionar hora de la cita</option>";

      if (!Array.isArray(data) || data.length === 0) {
        console.warn("No hay horarios disponibles para este médico.");
        return;
      }

      // Obtener la hora actual
      const ahora = new Date();
      const horaActual = ahora.getHours() * 100 + ahora.getMinutes(); // formato HHMM (ej: 1830 para 18:30)
      
      // Obtener la fecha de hoy en formato YYYY-MM-DD
      const hoy = new Date();
      const hoyString = hoy.toISOString().split('T')[0];
      const esHoy = fechaSeleccionada === hoyString;

      // Construimos un mapa hora -> idDisponibilidad y añadimos opciones con el id (requerido por backend)
      const horaToId = new Map();

      data.forEach(horario => {
        let horaInicio = new Date(`1970-01-01T${horario.horaInicioBloque}`);
        let horaFin = new Date(`1970-01-01T${horario.horaFinBloque}`);

        while (horaInicio < horaFin) {
          let horaStr = horaInicio.toTimeString().substring(0, 5);
          
          // Filtrar horarios que ya han pasado si la fecha es hoy
          let horarioEnNumero = horaInicio.getHours() * 100 + horaInicio.getMinutes();
          if (esHoy && horarioEnNumero <= horaActual) {
            // Saltar este horario porque ya pasó
            horaInicio.setMinutes(horaInicio.getMinutes() + 30);
            continue;
          }
          
          // Si aún no tenemos una entrada para esta hora, guardamos el idDisponibilidad
          if (!horaToId.has(horaStr) && horario.idDisponibilidad !== undefined) {
            horaToId.set(horaStr, horario.idDisponibilidad);
          }
          horaInicio.setMinutes(horaInicio.getMinutes() + 30);
        }
      });

      // Verificar si hay horarios disponibles después del filtrado
      if (horaToId.size === 0) {
        let noHorariosMsg = esHoy 
          ? "No hay horarios disponibles para hoy a partir de la hora actual."
          : "No hay horarios disponibles para esta fecha.";
        let option = document.createElement("option");
        option.value = "";
        option.textContent = noHorariosMsg;
        option.disabled = true;
        select.appendChild(option);
        console.warn(noHorariosMsg);
        return;
      }

      // Añadimos las opciones usando siempre el idDisponibilidad como value
      horaToId.forEach((id, hora) => {
        let option = document.createElement("option");
        option.value = id;
        option.textContent = hora;
        select.appendChild(option);
      });

      // Al cambiar la selección de hora, verificamos con el backend si ese idDisponibilidad sigue libre
      select.addEventListener('change', function () {
        const selectedVal = this.value;
        const submitBtn = document.querySelector('#form-reserva button[type="submit"]');
        if (!selectedVal) return;
        fetch(`http://localhost:8080/api/citas/verificar/${selectedVal}`, {
          headers: { "X-API-KEY": "123456" }
          })
          .then(resp => resp.json())
          .then(disponible => {
            if (!disponible) {
              if (window.Swal) {
                Swal.fire({ icon: 'warning', title: 'No puede ser procesado', text: 'El horario seleccionado ya se encuentra ocupado.', confirmButtonColor: '#dc3545' });
              } else {
                alert('No puede ser procesado: El horario seleccionado ya se encuentra ocupado.');
              }
              if (submitBtn) submitBtn.disabled = true;
            } else {
              if (submitBtn) submitBtn.disabled = false;
            }
          })
          .catch(err => {
            console.error('Error verificando disponibilidad:', err);
          });
      });
    })
    .catch(error => console.error("Error cargando horarios:", error));
}

function reservarCita() {
  // Intentamos obtener idPaciente desde un input oculto `paciente-id` o fallback a 4 (temporal)
  let pacienteElem = document.getElementById("paciente-id");
  let idPaciente = pacienteElem ? parseInt(pacienteElem.value) : 4;

  let idEspecialidad = parseInt(document.getElementById("especialidad-select").value) || null;
  let idMedico = parseInt(document.getElementById("medico-select").value) || null;

  let idDisponibilidadVal = document.getElementById("hora-cita").value;
  let idDisponibilidad = parseInt(idDisponibilidadVal);
  if (isNaN(idDisponibilidad)) {
    alert("Seleccione un horario válido (debe corresponder a un bloque disponible).");
    return;
  }

  // Obtener la fecha seleccionada en el formulario y la hora (texto) de la opción seleccionada
  const fechaElem = document.getElementById('fecha-cita');
  const fechaSeleccionada = fechaElem ? fechaElem.value : null; // formato yyyy-MM-dd
  const horaSelect = document.getElementById('hora-cita');
  const selectedOption = horaSelect ? horaSelect.selectedOptions[0] : null;
  const horaText = selectedOption ? selectedOption.textContent : null; // formato HH:mm
  if (!fechaSeleccionada || !horaText) {
    alert('Seleccione una fecha y hora válidas para la cita.');
    return;
  }

  let usuarioModificacion = "admin";

  // Payload según modelo Cita (backend espera idDisponibilidad)
  let cita = {
    idPaciente,
    idDisponibilidad,
    idEspecialidad,
    idMedico,
    // fecha y hora de la cita en formato ISO (Jackson lo parseará en el servidor)
    fechaCita: fechaSeleccionada + 'T' + horaText + ':00',
    estado: 1,
    usuarioModificacion
  };
  
  const loadingElem = document.getElementById('loading');
  const submitBtn = document.querySelector('#form-reserva button[type="submit"]');

  if (loadingElem) loadingElem.style.display = 'flex';
  if (submitBtn) submitBtn.disabled = true;

fetch("http://localhost:8080/api/citas", {
    method: "POST",
    headers: { 
      "Content-Type": "application/json",
      // ****************************************************
       "X-API-KEY": "123456" // API KEY OBLIGATORIA
      // ****************************************************
    },
    body: JSON.stringify(cita)
  })
    .then(response => response.text())
    .then(text => {
      if (loadingElem) loadingElem.style.display = 'none';
      if (submitBtn) submitBtn.disabled = false;

      const msg = (text || '').toString();
      if (msg.toLowerCase().includes('ocupado') || msg.toLowerCase().includes('error')) {
        if (window.Swal) {
          Swal.fire({ icon: 'warning', title: 'No puede ser procesado', text: msg, confirmButtonColor: '#dc3545' });
        } else {
          alert('No puede ser procesado: ' + msg);
        }
        return;
      }

      // Éxito
      if (window.Swal) {
        Swal.fire({ icon: 'success', title: 'Cita reservada', text: msg || 'Tu cita ha sido registrada correctamente.', confirmButtonColor: '#4CAF50' }).then(() => { window.location.href = 'UsuarioCitas.jsp'; });
      } else {
        alert(msg || 'Cita reservada con éxito.');
        window.location.href = 'UsuarioCitas.jsp';
      }
    })
    .catch(error => {
      console.error("Error reservando cita:", error);
      if (loadingElem) loadingElem.style.display = 'none';
      if (submitBtn) submitBtn.disabled = false;
      if (window.Swal) {
        Swal.fire({ icon: 'error', title: 'Error', text: 'No se pudo reservar la cita: ' + (error.message || error), confirmButtonColor: '#dc3545' });
      } else {
        alert('No se pudo reservar la cita: ' + (error.message || error));
      }
    });
}
