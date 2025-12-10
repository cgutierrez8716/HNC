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
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <style>
        :root {
            --primary-color: #2c5aa0;
            --secondary-color: #1e3a5f;
            --accent-color: #4CAF50;
            --light-blue: #e8f4f8;
            --success-color: #28a745;
            --danger-color: #dc3545;
            --warning-color: #ffc107;
            --light-gray: #f8f9fa;
            --dark-gray: #6c757d;
            --gradient-primary: linear-gradient(135deg, #2c5aa0 0%, #1e3a5f 100%);
            --gradient-accent: linear-gradient(135deg, #4CAF50 0%, #45a049 100%);
            --shadow-light: 0 2px 10px rgba(0,0,0,0.1);
            --shadow-medium: 0 4px 20px rgba(0,0,0,0.15);
            --shadow-heavy: 0 8px 30px rgba(0,0,0,0.2);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            color: #333;
        }

        /* Header Styles */
        .header {
            background: var(--gradient-primary);
            padding: 1rem 0;
            box-shadow: var(--shadow-medium);
            position: relative;
            overflow: hidden;
        }

        .header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" fill="rgba(255,255,255,0.1)"><polygon points="0,0 1000,0 1000,100 0,50"/></svg>');
            background-size: cover;
        }

        .header .container {
            position: relative;
            z-index: 2;
        }

        .clinic-logo {
            color: white;
            font-size: 1.8rem;
            font-weight: 700;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .clinic-logo i {
            font-size: 2rem;
            color: #4CAF50;
        }

        .clinic-subtitle {
            color: rgba(255,255,255,0.9);
            font-size: 0.9rem;
            margin-top: 0.2rem;
        }

        /* Main Content */
        .main-content {
            padding: 2rem 0;
            min-height: calc(100vh - 200px);
        }

        .page-title {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
        }

        .page-title h1 {
            color: var(--primary-color);
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .page-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: var(--gradient-accent);
            border-radius: 2px;
        }

        .page-subtitle {
            color: var(--dark-gray);
            font-size: 1.1rem;
            margin-top: 1rem;
        }

        /* Form Container */
        .form-container {
            background: white;
            border-radius: 20px;
            box-shadow: var(--shadow-heavy);
            padding: 2.5rem;
            margin-top: 2rem;
            position: relative;
            overflow: hidden;
        }

        .form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: var(--gradient-primary);
        }

        .form-section {
            margin-bottom: 2rem;
        }

        .form-section-title {
            color: var(--primary-color);
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-section-title i {
            color: var(--accent-color);
        }

        /* Form Controls */
        .form-label {
            font-weight: 500;
            color: var(--secondary-color);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-control, .form-select {
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: #fff;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.2rem rgba(76, 175, 80, 0.25);
            outline: none;
        }

        .form-control:hover, .form-select:hover {
            border-color: var(--primary-color);
        }

        /* Input Groups */
        .input-group-custom {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--dark-gray);
            z-index: 2;
        }

        .form-control.with-icon {
            padding-left: 45px;
        }

        /* Buttons */
        .btn-custom {
            padding: 0.75rem 2rem;
            border-radius: 50px;
            font-weight: 500;
            font-size: 1rem;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            min-width: 140px;
            justify-content: center;
        }

        .btn-success-custom {
            background: var(--gradient-accent);
            color: white;
            box-shadow: var(--shadow-light);
        }

        .btn-success-custom:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-medium);
            filter: brightness(110%);
        }

        .btn-danger-custom {
            background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
            color: white;
            box-shadow: var(--shadow-light);
        }

        .btn-danger-custom:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-medium);
            filter: brightness(110%);
            text-decoration: none;
            color: white;
        }

        .button-group {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
            flex-wrap: wrap;
        }

        /* Info Cards */
        .info-card {
            background: var(--light-blue);
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            border-left: 5px solid var(--accent-color);
        }

        .info-card h5 {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .info-card p {
            color: var(--dark-gray);
            margin: 0;
        }

        /* Footer */
        .footer {
            background: var(--gradient-primary);
            color: white;
            padding: 2rem 0;
            text-align: center;
            margin-top: auto;
        }

        .footer-content {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .footer-icon {
            color: var(--accent-color);
            font-size: 1.2rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .page-title h1 {
                font-size: 2rem;
            }
            
            .form-container {
                padding: 1.5rem;
                margin: 1rem;
            }
            
            .button-group {
                flex-direction: column;
                align-items: center;
            }
            
            .btn-custom {
                width: 100%;
                max-width: 200px;
            }
        }

        /* Loading Animation */
        .loading {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.9);
            z-index: 9999;
            justify-content: center;
            align-items: center;
        }

        .spinner {
            width: 50px;
            height: 50px;
            border: 4px solid #f3f3f3;
            border-top: 4px solid var(--accent-color);
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Hover Effects */
        .form-container:hover {
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }

        .input-group-custom:hover .form-control,
        .input-group-custom:hover .form-select {
            border-color: var(--accent-color);
        }
    </style>
</head>

<body>
    <!-- Loading Animation -->
    <div class="loading" id="loading">
        <div class="spinner"></div>
    </div>

    <!-- HEADER -->
    <header class="header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12">
                    <a href="#" class="clinic-logo">
                        <i class="fas fa-heartbeat"></i>
                        <div>
                            <div>Hospital Nacional de Cardiología</div>
                            <div class="clinic-subtitle">Tu salud es nuestra prioridad</div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </header>

    <!-- CONTENIDO PRINCIPAL -->
    <main class="main-content">
        <div class="container">
            <!-- Page Title -->
            <div class="page-title">
                <h1><i class="fas fa-calendar-check"></i> Reserva de Cita Médica</h1>
                <p class="page-subtitle">Programa tu cita con nuestros especialistas de manera rápida y segura</p>
            </div>

            <!-- Info Card -->
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="info-card">
                        <h5><i class="fas fa-info-circle"></i> Información Importante</h5>
                        <p>Para una mejor atención, te recomendamos llegar 15 minutos antes de tu cita programada. 
                           En caso de necesitar cancelar, hazlo con al menos 24 horas de anticipación.</p>
                    </div>
                </div>
            </div>

            <!-- Form Container -->
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="form-container">
                        <form id="form-reserva">
                            <input type="hidden" id="paciente-id" value="<%=idPaciente%>" />
                            <!-- Sección de Especialidad y Médico -->
                            <div class="form-section">
                                <h3 class="form-section-title">
                                    <i class="fas fa-user-md"></i>
                                    Selección de Especialista
                                </h3>
                                
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input-group-custom">
                                            <label class="form-label" for="especialidad-select">
                                                <i class="fas fa-stethoscope"></i>
                                                Especialidad Médica
                                            </label>
                                            <select class="form-select" id="especialidad-select" name="especialidad" required>
                                                <option value="">Seleccionar especialidad</option>
                                                <option value="cardiologia">Cardiología</option>
                                                <option value="dermatologia">Dermatología</option>
                                                <option value="gastroenterologia">Gastroenterología</option>
                                                <option value="neurologia">Neurología</option>
                                                <option value="pediatria">Pediatría</option>
                                                <option value="traumatologia">Traumatología</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <div class="input-group-custom">
                                            <label class="form-label" for="medico-select">
                                                <i class="fas fa-user-md"></i>
                                                Médico Especialista
                                            </label>
                                            <select class="form-select" id="medico-select" name="medico" required>
                                                <option value="">Seleccionar médico</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Sección de Fecha y Hora -->
                            <div class="form-section">
                                <h3 class="form-section-title">
                                    <i class="fas fa-calendar-alt"></i>
                                    Fecha y Horario
                                </h3>
                                
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input-group-custom">
                                            <label class="form-label" for="fecha-cita">
                                                <i class="fas fa-calendar"></i>
                                                Fecha de la Cita
                                            </label>
                                            <input class="form-control with-icon" type="date" id="fecha-cita" name="fecha" required>
                                            <i class="fas fa-calendar input-icon"></i>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <div class="input-group-custom">
                                            <label class="form-label" for="hora-cita">
                                                <i class="fas fa-clock"></i>
                                                Hora de la Cita
                                            </label>
                                            <select class="form-select" id="hora-cita" name="hora" required>
                                                <option value="">Seleccionar hora</option>
                                                <option value="08:00">08:00 AM</option>
                                                <option value="09:00">09:00 AM</option>
                                                <option value="10:00">10:00 AM</option>
                                                <option value="11:00">11:00 AM</option>
                                                <option value="14:00">02:00 PM</option>
                                                <option value="15:00">03:00 PM</option>
                                                <option value="16:00">04:00 PM</option>
                                                <option value="17:00">05:00 PM</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Botones de Acción -->
                            <div class="button-group">
                                <button class="btn btn-custom btn-success-custom" type="submit">
                                    <i class="fas fa-check"></i>
                                    Confirmar Cita
                                </button>
                                <a href="UsuarioCitas.jsp" class="btn btn-custom btn-danger-custom">
                                    <i class="fas fa-times"></i>
                                    Cancelar
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- FOOTER -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <i class="fas fa-heartbeat footer-icon"></i>
                <p>&copy; 2025 Hospital Nacional de Cardiología - Sistema de Reserva de Citas. Todos los derechos reservados.</p>
                <i class="fas fa-shield-alt footer-icon"></i>
            </div>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/reservaCita.js"></script>

    <script>
        // Configurar fecha mínima (hoy si es antes de las 6 PM, mañana si es después)
        document.addEventListener('DOMContentLoaded', function() {
            const fechaCita = document.getElementById('fecha-cita');
            const today = new Date();
            const currentHour = today.getHours();
            
            let minDate;
            if (currentHour >= 18) {
                // Si es 6 PM o después, la fecha mínima es mañana
                let tomorrow = new Date(today);
                tomorrow.setDate(tomorrow.getDate() + 1);
                minDate = tomorrow.toISOString().split('T')[0];
            } else {
                // Si es antes de las 6 PM, la fecha mínima es hoy
                minDate = today.toISOString().split('T')[0];
            }
            
            if (fechaCita) {
                fechaCita.min = minDate;
            }
        });
    </script>
</body>

</html>