$(document).ready(function () {
  let idPaciente = 4; // tu variable de prueba; en producción úsalo desde la sesión

  if (idPaciente === null) {
    alert("No se encontró información del paciente. Por favor, inicie sesión nuevamente.");
    return;
  }

  // ⚠️ Obtén la instancia YA inicializada (no la reinicialices)
  let tabla = $('#tablaRegistros').DataTable();

  // Cargar datos vía AJAX y agregar filas dinámicamente
  $.ajax({
    url: `http://localhost:8080/api/citas/${idPaciente}`,
    type: "GET",
    dataType: "json",
    // ****************************************************
    headers: {
      "X-API-KEY": "123456"   // API KEY OBLIGATORIA
    },
    // ****************************************************
    success: function (citas) {
      if (citas.length === 0) {
        alert("No tienes citas registradas.");
      } else {
        citas.forEach(cita => {
          let estadoTexto = obtenerEstadoCita(cita.estado);

          // 🔥 Construye texto limpio en las columnas para que el filtro funcione
          let textoIdCita = cita.idCita.toString();
          let textoHorario = cita.horario || '';
          let textoFecha = new Date(cita.fechaCreacion).toLocaleDateString("es-ES");
          let textoEspecialidad = cita.especialidad || '';
          let textoMedico = `${cita.medico || ''}, ${cita.medico?.nombres || ''}`.trim();
          let textoEstado = estadoTexto;

          let botonCancelar = `<button class="btn-danger-outline" onclick="cancelarCita(${cita.idCita})">
                                 Cancelar
                               </button>`;

          // 🔥 Asegúrate que las columnas de texto solo tengan texto plano o mínimas etiquetas
          tabla.row.add([
            textoIdCita,
            textoHorario,
            textoFecha,
            textoEspecialidad,
            textoMedico,
            textoEstado,
            `<div>${botonCancelar}</div>` // Solo el botón "Cancelar" aquí
          ]);
        });

        tabla.draw(false); // 🔥 Actualiza el DataTable con las nuevas filas

        // 🔥 Reasociar el buscador personalizado tras cargar dinámicamente
        $('#busquedaCitas').off('keyup').on('keyup', function () {
          console.log("Buscador presionado, valor actual:", this.value); // DEBUG
          tabla.search(this.value).draw();
        });

        // 🔥 Reasociar el selector personalizado tras cargar dinámicamente
        $('#cantidadRegistros').off('change').on('change', function () {
          tabla.page.len(parseInt(this.value)).draw();
        });
      }
    },
    error: function () {
      alert("Error al obtener las citas. Intenta nuevamente.");
    }
  });
});

// Función para traducir estados
function obtenerEstadoCita(estado) {
  switch (estado) {
    case 1: return "Activa";
    case 2: return "Cancelada";
    case 3: return "Reprogramada";
    default: return "Desconocido";
  }
}

// Cancelar cita
function cancelarCita(idCita) {
  Swal.fire({
    title: '¿Está seguro que desea cancelar esta cita?',
    text: 'Esta acción no se puede deshacer.',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Sí, cancelar',
    cancelButtonText: 'No, mantener',
    confirmButtonColor: '#d33',
    cancelButtonColor: '#3085d6'
  }).then((result) => {
    if (result.isConfirmed) {
      // Llamada AJAX real
      $.ajax({
        url: "http://localhost:8080/api/citas/cancelar",
        type: "PUT",
        // ****************************************************
        headers: {
          "X-API-KEY": "123456"   // API KEY OBLIGATORIA
        },
        // ****************************************************
        contentType: "application/json",
        data: JSON.stringify({ idCita: idCita, usuarioModificacion: "UsuarioWeb" }),
        success: function () {
          Swal.fire({
            icon: 'success',
            title: 'Cita cancelada',
            text: 'La cita fue cancelada correctamente.',
            confirmButtonText: 'Aceptar',
            confirmButtonColor: '#3085d6'
          }).then(() => {
            location.reload();
          });
        },
        error: function () {
          Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'No se pudo cancelar la cita. Intente nuevamente.',
            confirmButtonText: 'Aceptar',
            confirmButtonColor: '#d33'
          });
        }
      });
    }
  });
}