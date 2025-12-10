<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    // Obtener la sesión del usuario autenticado
    HttpSession sesion = request.getSession(false);
    int idPaciente = 4;
%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Reserva de Citas - Hospital Nacional de Cardiología</title>
  <link rel="stylesheet" href="css/clinica-estilos.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <!-- Bootstrap y DataTables (si los necesitas para otros componentes) -->
  <link rel="stylesheet" href="css/bootstrap.min.css" />
  <link rel="stylesheet" href="css/bootstrap.css" />
  <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.css" />
  <link rel="stylesheet" href="css/AdminFooter.css">
  <!-- SweetAlert2 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<button class="menu-toggle" onclick="document.querySelector('.sidebar').classList.toggle('active')">
    <i class="fas fa-bars"></i>
</button>
<div class="sidebar">
    <img src="imagenes/logo.png" alt="Logo Hospital Nacional de Cardiología" class="logo">
    <nav>
        <a href="index.jsp"><i class="fas fa-home"></i> Panel principal</a>
        <a href="UsuarioCitas.jsp"><i class="fas fa-calendar-check"></i> Mis citas</a>
        <a href="StaffMedico.jsp"><i class="fas fa-user-md"></i> Staff médico</a>
        <a href="UsuarioReservaCita.jsp" class="active"><i class="fas fa-calendar-plus"></i> Reserva de citas</a>
    </nav>
</div>
<div class="main-content">
    <h2>Reserva de cita</h2>
    <hr class="border border-2">
    <div class="container border border-3 rounded-lg py-5 px-4 mt-4" style="background: #fff;">
      <form id="form-reserva">
        <div class="container">
          <div class="row">
            <div class="col">
              <div class="form-group row">
                <label class="col-sm-2 col-form-label mb-2" for="especialidad-select">Especialidad: </label>
                <div class="col-sm-4">
                  <select class="custom-select" id="especialidad-select" name="especialidad">
                    <option selected>Seleccionar especialidad</option>
                  </select>
                </div>
                <label class="col-sm-2 col-form-label mb-2" for="medico-select">Médico: </label>
                <div class="col-sm-4">
                  <select class="custom-select" id="medico-select" name="medico">
                    <option selected>Seleccionar médico</option>
                  </select>
                </div>
              </div>
              <div class="form-group row">
                <label class="col-sm-2 col-form-label mb-2" for="fecha-cita">Fecha Cita: </label>
                <div class="col-sm-4">
                  <input class="form-control" type="date" id="fecha-cita" name="fecha">
                </div>
                <label class="col-sm-2 col-form-label mb-2" for="hora-cita">Hora Cita: </label>
                <div class="col-sm-4">
                  <select class="custom-select" id="hora-cita" name="hora">
                    <option selected>Seleccionar hora de la cita</option>
                  </select>
                </div>
              </div>
              <div class="container">
                <div class="row">
                  <div class="col-sm-12 d-flex justify-content-around">
                    <button class="btn btn-success px-4" type="submit"><i class="fas fa-calendar-check"></i> Aceptar</button>
                    <a href="UsuarioCitas.jsp" class="btn btn-danger px-4"><i class="fas fa-times-circle"></i> Cancelar</a>                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
</div>
<!-- FOOTER -->
<footer class="bg-dark text-white p-2">
  <div class="container text-center">
    <p>
      &copy; 2025 Sistema de Reserva de Citas Web CJP. Todos los derechos reservados.
    </p>
  </div>
</footer>

<!-- Scripts -->
<script src="js/jquery-3.5.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
<script src="js/GeneraTablaRegistros.js"></script>
<script src="js/reservaCita.js"></script>

<script>
  // SweetAlert2 para mensaje de éxito
  document.getElementById('form-reserva').addEventListener('submit', function (e) {
    e.preventDefault(); // Previene el envío real del formulario

    // Mostrar mensaje con SweetAlert
    Swal.fire({
      icon: 'success',
      title: 'Cita registrada con éxito',
      showConfirmButton: false,
      timer: 2000
    });

    // Redirigir a la misma página después de 2 segundos
    setTimeout(() => {
      window.location.href = "UsuarioCitas.jsp";
    }, 2000);
  });

  // Script para menú lateral responsivo
  window.addEventListener('click', function(e) {
    const sidebar = document.querySelector('.sidebar');
    const toggle = document.querySelector('.menu-toggle');
    if (window.innerWidth <= 700 && sidebar.classList.contains('active')) {
      if (!sidebar.contains(e.target) && !toggle.contains(e.target)) {
        sidebar.classList.remove('active');
      }
    }
  });
</script>
</body>
</html> 