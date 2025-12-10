<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Staff Médico - Hospital Nacional de Cardiología</title>
    <link rel="stylesheet" href="css/clinica-estilos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
        <a href="StaffMedico.jsp" class="active"><i class="fas fa-user-md"></i> Staff médico</a>
        <a href="UsuarioReservaCita.jsp"><i class="fas fa-calendar-plus"></i> Reserva de citas</a>
    </nav>
</div>
<div class="main-content">
    <h2>Staff médico</h2>
    <table class="table-clinica">
        <thead>
        <tr>
            <th>Nombre</th>
            <th>Especialidad</th>
            <th>Horario</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Dr. Smith</td>
            <td>Medicina general</td>
            <td>08:00 - 16:00</td>
            <td>
                <a href="UsuarioReservaCita.jsp" class="btn-clinica btn-primario"><i class="fas fa-calendar-plus"></i> Reservar cita</a>
            </td>
        </tr>
        <!-- Más filas dinámicas aquí -->
        </tbody>
    </table>
</div>
</body>
</html>
<script>
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