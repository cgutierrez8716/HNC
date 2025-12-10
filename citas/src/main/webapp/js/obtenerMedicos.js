$(document).ready(function () {
  $.ajax({
    url: "http://localhost:8080/api/medicos",
    type: "GET",
    dataType: "json",
    // ****************************************************
    headers: {
      "X-API-KEY": "123456"   // API KEY OBLIGATORIA
    },
    // ****************************************************
    
    success: function (medicos) {
      if (medicos.length === 0) {
        alert("No hay médicos registrados.");
      } else {
        let tabla = $('#tablaRegistros').DataTable();

        // Crear un array de promesas para obtener las especialidades
        let promesas = medicos.map(medico => {
          return fetch(`http://localhost:8080/api/especialidades/${medico.idEspecialidad}`,
             // ****************************************************
            {headers: { "X-API-KEY": "123456" }} // API KEY OBLIGATORIA
             // ****************************************************
          )
            .then(response => response.json())
            .then(especialidad => ({
              ...medico,
              nombreEspecialidad: especialidad.nombre // Agregar el nombre de la especialidad al objeto médico
            }))
            .catch(error => {
              console.error(`Error obteniendo especialidad para médico ${medico.idMedico}:`, error);
              return { ...medico, nombreEspecialidad: "Desconocida" }; // En caso de error, asigna "Desconocida"
            });
        });

        // Ejecutar todas las promesas y luego llenar la tabla
        Promise.all(promesas).then(medicosConEspecialidad => {
          medicosConEspecialidad.forEach(medico => {
            let estadoTexto = medico.estado === 1 ? "Activo" : "Inactivo";

            tabla.row.add([
              medico.idMedico,
              `${medico.apellidos}, ${medico.nombres}`,
              medico.nombreEspecialidad, // Se usa el nombre de la especialidad
              medico.celular
            ]).draw(false);
          });
        });
      }
    },
    error: function () {
      alert("Error al obtener la lista de médicos. Intenta nuevamente.");
    }
  });
});
