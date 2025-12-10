<%-- Document : index Created on : 1 jun. 2024, 12:06:42 a. m. Author : Herbert --%>

  <%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Hospital Nacional de Cardiología</title>
      <link rel="stylesheet" type="text/css" href="css/FormularioUsuarioStyles.css?v=1.0">
    </head>

    <body>
      <div class="register-form">
        <h2>Crear cuenta</h2>
        <form action="UsuarioCitas.jsp" method="post">
          <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>
            <span class="hint">Solo se permiten caracteres alfabéticos (letras) y el punto (.), seguidos de un
              espacio.</span>
          </div>
          <div class="form-group">
            <label for="correo">Correo electrónico:</label>
            <input type="email" id="correo" name="correo" required>
          </div>
          <div class="form-group">
            <label for="direccion">Dirección:</label>
            <input type="text" id="direccion" name="direccion" required>
          </div>
          <div class="form-group">
            <label for="contrasena">Contraseña:</label>
            <input type="password" id="contrasena" name="contrasena" required>
            <button type="button" class="toggle-password-button" onmousedown="showPassword()" onmouseup="hidePassword()"
              ontouchstart="showPassword()" ontouchend="hidePassword()">Mostrar Contraseña</button>
          </div>
          <div class="form-group">
            <label for="telefono">Teléfono:</label>
            <input type="text" id="telefono" name="telefono" required>
          </div>
          <div class="form-group">
            <input type="submit" value="Crear cuenta">
          </div>
        </form>
        <form action="login.jsp">
          <p>¿Ya tienes una cuenta? <a href="login.jsp">Inicia sesión en su lugar</a></p>
        </form>
      </div>
    </body>

    </html>