<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hospital Nacional de Cardiología - Iniciar sesión</title>
    <link rel="stylesheet" href="css/loginStyles.css?v=1.1"> <!-- Actualizado -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <img src="imagenes/logo.png" alt="Logo Hospital Nacional de Cardiología" class="logo"> <!-- Asegúrate de tener el logo -->
            <h2>Iniciar sesión</h2>
            <p>Accede a tu cuenta para agendar citas y gestionar tu salud.</p>
        </div>
        
        <form action="UsuarioCitas.jsp" method="post" class="login-form">
            <div class="form-group">
                <label for="correo">Correo electrónico</label>
                <input type="email" id="correo" name="correo" placeholder="ejemplo@clinica.com" required>
            </div>
            
            <div class="form-group">
                <label for="contrasena">Contraseña</label>
                <input type="password" id="contrasena" name="contrasena" placeholder="••••••••" required>
                <a href="#" class="forgot-password">¿Olvidaste tu contraseña?</a>
            </div>
            
            <button type="submit" class="btn-login">Iniciar sesión</button>
        </form>
        
        <div class="login-footer">
            <p>¿No tienes una cuenta? <a href="FormularioUsuario.jsp" class="register-link">Regístrate aquí</a></p>
            <a href="/index.jsp" class="back-home">← Volver a la página principal</a>
        </div>
    </div>
</body>
</html>