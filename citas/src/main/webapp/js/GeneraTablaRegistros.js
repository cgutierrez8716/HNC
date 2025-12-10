
var tabla; // <- OJO: declarada global

$(document).ready(function () {
  if (!$.fn.DataTable.isDataTable('#tablaRegistros')) {
    tabla = $('#tablaRegistros').DataTable({
      responsive: true,
      language: {
        url: 'https://cdn.datatables.net/plug-ins/2.0.8/i18n/es-ES.json'
      },
      dom: 'tp', // tabla + paginación
      pageLength: 10,
      lengthChange: false,
      searching: true
    });

    // Conectar buscador personalizado
    $('#busquedaCitas').on('keyup', function () {
      tabla.search(this.value).draw();
    });

    // Conectar selector personalizado
    $('#cantidadRegistros').on('change', function () {
      tabla.page.len(parseInt(this.value)).draw();
    });
  }
});