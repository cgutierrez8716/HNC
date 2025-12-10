<%-- 
    Document   : citas
    Created on : 1 Oct. 2025, 10:35:06 p. m.
    Author     : cgutierrez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/citas-styles.css" />
    <title>Reserva de Citas Médicas</title>
  </head>
      <body>
    <header>
      <nav>
        <ul>
          <li><a href="#">Inicio</a></li>
          <li><a href="#">Mis Citas</a></li>
          <li><a href="#">Nueva Cita</a></li>
          <li><a href="#">Perfil</a></li>
          <li><a href="index.jsp">Cerrar Sesión</a></li>
        </ul>
      </nav>
    </header>

    <div class="main-container">
      <div class="nueva-cita-container">
        <h1>Nueva Cita</h1>
        <form class="cita-form">
          <div class="input-container">
            <label for="especialidad">Selecciona la Especialidad: </label>
            <select
              id="especialidad"
              name="especialidad"
              onchange="cargarDatosRelacionados(this.value)"
            ></select>
          </div>

          <div class="input-container">
            <label for="medico">Selecciona el Medico Especialista</label>
            <select id="medico" name="medico"></select>
          </div>

          <div class="input-container">
            <label for="fecha">Fecha de la Cita</label>
            <input type="date" id="fecha" name="fecha" required />
          </div>

          <div class="input-container">
            <label for="hora">Hora de la Cita</label>
            <input type="time" id="hora" name="hora" required />
          </div>

          <br />
          <button id="agendar-cita" class="button">Agendar Cita</button>
        </form>
      </div>

      <div class="citas-container">
        <h1>Mis Citas</h1>
      </div>
    </div>

  </body>
</html>
