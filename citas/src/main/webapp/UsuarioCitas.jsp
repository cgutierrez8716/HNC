<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% HttpSession sesion=request.getSession(false); %>
<% int idPaciente=4; %>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Hospital Nacional de Cardiología</title>
  <link rel="stylesheet" href="css/style.css"/>
  <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.css"/>
  <style>
    /* Ocultar todo el bloque de controles originales */
    div.dataTables_wrapper .dataTables_filter,
    div.dataTables_wrapper .dataTables_length {
      display: none !important;
    }
  </style>


</head>


<body>


  <!-- Encabezado superior -->
  <div class="encabezadogeneral">
    <img src="imagenes/logo.png" alt="Logo" />

    <div class="usuario-logueado">
      <svg class="icono-usuario" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="white" viewBox="0 0 24 24">
        <path d="M12 12c2.7 0 5-2.3 5-5s-2.3-5-5-5-5 2.3-5 5 2.3 5 5 5zm0 2c-3.3 0-10 1.7-10 5v3h20v-3c0-3.3-6.7-5-10-5z"/>
      </svg>
      <span class="nombre-usuario">Carlos Gutierrez</span>
    </div>
  </div>

  <div class="contenidopantalla">
    <!-- Sidebar lateral -->
    <div class="sidebarcontainer">
      <div class="content-sidebar" onclick="window.location.href='index.jsp'">
        <svg width="24" height="24" ...></svg>
        <span>Panel principal</span>
      </div>
      <div class="content-sidebar" onclick="window.location.href='UsuarioCitas.jsp'">
        <svg width="24" height="24" ...></svg>
        <span>Mis citas</span>
      </div>
      <div class="content-sidebar" onclick="window.location.href='StaffMedico.jsp'">
        <svg width="24" height="24" ...></svg>
        <span>Staff médico</span>
      </div>
      <div class="content-sidebar" onclick="window.location.href='UsuarioReservaCita.jsp'">
        <svg width="24" height="24" ...></svg>
        <span>Reserva de citas</span>
      </div>
    </div>

    <!-- Contenido principal -->
    <div class="content-main">
      <div class="header">
        <span>Lista de Citas</span>
      </div>

      <!-- Filtros personalizados que reemplazan a los de DataTables -->
      <div class="filtros-listado">
        <input type="text" id="busquedaCitas" placeholder="Buscar">
        <select id="cantidadRegistros">
          <option value="10">Mostrar 10</option>
          <option value="15">Mostrar 15</option>
          <option value="20">Mostrar 20</option>
          <option value="50">Mostrar 50</option>
        </select>
        <button class="btn-primary" onclick="window.location.href='UsuarioReservaCita.jsp'">
          <svg width="12" ...></svg>
          Reservar cita
        </button>
      </div>

      <table id="tablaRegistros">
        <thead>
          <tr>
            <th>ID Cita</th>
            <th>Hora Cita</th>
            <th>Fecha</th>
            <th>Especialidad</th>
            <th>Médico</th>
            <th>Estado</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          <!-- Tus scripts JSP/JS llenan las filas dinámicamente -->
        </tbody>
      </table>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>






  <script src="js/GeneraTablaRegistros.js"></script>
  <script src="js/obtieneCita.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>

