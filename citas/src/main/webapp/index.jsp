<%-- 
    Document   : index
    Created on : 01 Octubre. 2025, 2:30:01 p. m.
    Author     : Carlos Gutierrez
    Versión Mejorada : Diciembre 2025
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Hospital Nacional de Cardiología - Especialista en salud cardiovascular con 35 años de excelencia">
        <meta name="keywords" content="cardiólogo, cirugía cardíaca, hemodinamia, cardiología clínica">
        <link rel="stylesheet" href="css/principal.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <title>Hospital Nacional de Cardiología - Centro Especializado en Salud del Corazón</title>
        <!-- SweetAlert2 CSS y JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="js/contacto.js"></script>
        <script src="js/carousel.js"></script>
    </head>
    <body>
        <!-- Header Principal -->
        <header>
            <div class="logo-section">
                <img src="imagenes/logo.png" alt="Logo Hospital" class="logo">
                <div class="logo-info">
                    <h1>Hospital Nacional de Cardiología</h1>
                    <p>Excelencia en Salud Cardiovascular</p>
                </div>
            </div>
            <nav class="nav-menu">
                <ul class="menu">
                    <li><a href="#inicio"><i class="fas fa-home"></i> Inicio</a></li>
                    <li><a href="#nosotros"><i class="fas fa-hospital"></i> Nosotros</a></li>
                    <li><a href="#estadisticas"><i class="fas fa-chart-line"></i> Logros</a></li>
                    <li><a href="#servicios"><i class="fas fa-stethoscope"></i> Servicios</a></li>
                    <li><a href="#equipo"><i class="fas fa-user-md"></i> Equipo</a></li>
                    <li><a href="#testimonios"><i class="fas fa-comments"></i> Testimonios</a></li>
                    <li><a href="#contacto"><i class="fas fa-phone-alt"></i> Contacto</a></li>
                </ul>
            </nav>
            <a class="reservar-btn-header" href="login.jsp" target="_blank">
                <i class="fas fa-calendar-alt"></i> AGENDAR CITA
            </a>
        </header>

        <!-- Carrusel de Imágenes -->
        <section id="inicio" class="carousel-container">
            <div class="carousel" id="carousel">
                <div class="carousel-slide active">
                    <img src="imagenes/principal.png" alt="Hospital Nacional de Cardiología">
                    <div class="carousel-caption">
                        <h4>¿Cuidar tu corazón?</h4>
                        <h3>Hospital Nacional<br>de Cardiología</h3>
                        <p>Comienza con una consulta especializada</p>
                        <a href="login.jsp" class="carousel-caption-button">Reservar Cita</a>
                    </div>
                </div>
                <div class="carousel-slide">
                    <img src="imagenes/cardiologia_clinica.jpg" alt="Cardiología Clínica">
                    <div class="carousel-caption">
                        <h4>Especialidad Principal</h4>
                        <h3>Cardiología<br>Clínica</h3>
                        <p>Diagnóstico y tratamiento especializado de enfermedades del corazón</p>
                        <a href="login.jsp" class="carousel-caption-button">Reservar Cita</a>
                    </div>
                </div>
                <div class="carousel-slide">
                    <img src="imagenes/cirugia_cardiaca.jpg" alt="Cirugía Cardíaca">
                    <div class="carousel-caption">
                        <h4>Procedimiento Quirúrgico</h4>
                        <h3>Cirugía<br>Cardíaca</h3>
                        <p>Procedimientos de alta complejidad realizados por expertos</p>
                        <a href="login.jsp" class="carousel-caption-button">Reservar Cita</a>
                    </div>
                </div>
                <div class="carousel-slide">
                    <img src="imagenes/hemodinamia.jpg" alt="Hemodinamia">
                    <div class="carousel-caption">
                        <h4>Tecnología Avanzada</h4>
                        <h3>Hemodinamia</h3>
                        <p>Intervenciones minimamente invasivas con tecnología de punta</p>
                        <a href="login.jsp" class="carousel-caption-button">Reservar Cita</a>
                    </div>
                </div>
                <div class="carousel-slide">
                    <img src="imagenes/rehabilitacion_cardiaca.jpg" alt="Rehabilitación Cardíaca">
                    <div class="carousel-caption">
                        <h4>Recuperación Integral</h4>
                        <h3>Rehabilitación<br>Cardíaca</h3>
                        <p>Programas personalizados para tu recuperación y bienestar</p>
                        <a href="login.jsp" class="carousel-caption-button">Reservar Cita</a>
                    </div>
                </div>

                <button class="carousel-nav-button prev" onclick="previousSlide()">
                    <i class="fas fa-chevron-left"></i>
                </button>
                <button class="carousel-nav-button next" onclick="nextSlide()">
                    <i class="fas fa-chevron-right"></i>
                </button>

                <div class="carousel-indicators">
                    <span class="indicator active" onclick="currentSlide(0)"></span>
                    <span class="indicator" onclick="currentSlide(1)"></span>
                    <span class="indicator" onclick="currentSlide(2)"></span>
                    <span class="indicator" onclick="currentSlide(3)"></span>
                    <span class="indicator" onclick="currentSlide(4)"></span>
                </div>
            </div>
        </section>

        <!-- Sección de Estadísticas -->
        <section id="estadisticas" class="estadisticas-section">
            <div class="estadisticas-container">
                <div class="estadistica-item">
                    <div class="stat-icon">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                    <h3>35+ Años</h3>
                    <p>De excelencia en cardiología</p>
                </div>
                <div class="estadistica-item">
                    <div class="stat-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3>50,000+</h3>
                    <p>Pacientes atendidos anualmente</p>
                </div>
                <div class="estadistica-item">
                    <div class="stat-icon">
                        <i class="fas fa-user-md"></i>
                    </div>
                    <h3>120+</h3>
                    <p>Colaboradores para atención</p>
                </div>
                <div class="estadistica-item">
                    <div class="stat-icon">
                        <i class="fas fa-heartbeat"></i>
                    </div>
                    <h3>98%</h3>
                    <p>Tasa de satisfacción pacientes</p>
                </div>
            </div>
        </section>

        <!-- Sección Nosotros Mejorada -->
        <section id="nosotros" class="nosotros-section">
            <div class="section-header">
                <h2>Sobre Nuestro Hospital</h2>
                <p>Más de 35 años siendo referencia nacional en excelencia cardiológica</p>
            </div>
            
            <!-- Grid Principal: Contenido + Imagen -->
            <div class="nosotros-main-grid">
                <div class="nosotros-content">
                    <div class="nosotros-intro">
                        <p class="intro-text">El <strong>Hospital Nacional de Cardiología</strong> es la institución de referencia nacional en el tratamiento, diagnóstico y prevención de enfermedades cardiovasculares. Desde su fundación en 1985, hemos consolidado nuestra posición como el principal centro cardiológico del país.</p>
                    </div>

                    <!-- Valores Principales -->
                    <div class="valores-grid">
                        <div class="valor-item">
                            <div class="valor-icon">
                                <i class="fas fa-medal"></i>
                            </div>
                            <h4>Excelencia</h4>
                            <p>Estándares de calidad internacional en cada procedimiento</p>
                        </div>
                        <div class="valor-item">
                            <div class="valor-icon">
                                <i class="fas fa-lightbulb"></i>
                            </div>
                            <h4>Innovación</h4>
                            <p>Tecnología de punta y procedimientos minimamente invasivos</p>
                        </div>
                        <div class="valor-item">
                            <div class="valor-icon">
                                <i class="fas fa-heart"></i>
                            </div>
                            <h4>Humanismo</h4>
                            <p>Atención personalizada y cuidado integral del paciente</p>
                        </div>
                    </div>

                    <!-- Highlights -->
                    <div class="nosotros-highlights">
                        <div class="highlight">
                            <i class="fas fa-check-circle"></i>
                            <p><strong>Equipo multidisciplinario</strong> de 120+ especialistas cardiólogos altamente capacitados</p>
                        </div>
                        <div class="highlight">
                            <i class="fas fa-check-circle"></i>
                            <p><strong>Tecnología avanzada:</strong> Cateterismos, ecocardiogramas 3D, cirugía robótica y laboratorio hemodinámico</p>
                        </div>
                        <div class="highlight">
                            <i class="fas fa-check-circle"></i>
                            <p><strong>Tasa de satisfacción:</strong> 98% de pacientes satisfechos con nuestro servicio</p>
                        </div>
                        <div class="highlight">
                            <i class="fas fa-check-circle"></i>
                            <p><strong>Disponibilidad 24/7:</strong> Urgencias cardíacas atendidas sin demora</p>
                        </div>
                    </div>
                </div>

                <div class="nosotros-image-section">
                    <img src="imagenes/nosotros.jpg" alt="Equipo médico del Hospital Nacional de Cardiología">
                </div>
            </div>

            <!-- Misión, Visión y Valores -->
            <div class="mision-vision-values">
                <div class="mision-box">
                    <div class="box-header">
                        <i class="fas fa-bullseye"></i>
                        <h3>Misión</h3>
                    </div>
                    <p>Brindar atención cardiológica especializada de <strong>alta complejidad</strong> con estándares de calidad internacional, mediante un equipo médico multidisciplinario comprometido con el cuidado integral y humanizado del paciente.</p>
                </div>
                <div class="vision-box">
                    <div class="box-header">
                        <i class="fas fa-telescope"></i>
                        <h3>Visión</h3>
                    </div>
                    <p>Ser el <strong>centro de referencia nacional</strong> líder en cardiología, reconocido internacionalmente por la excelencia en atención cardiovascular integral, la innovación en investigación cardíaca y la formación de nuevas generaciones de especialistas.</p>
                </div>
                <div class="valores-box">
                    <div class="box-header">
                        <i class="fas fa-star"></i>
                        <h3>Valores</h3>
                    </div>
                    <ul class="valores-list">
                        <li><strong>Integridad:</strong> Actuamos con ética en cada decisión</li>
                        <li><strong>Calidad:</strong> Excelencia en atención médica</li>
                        <li><strong>Solidaridad:</strong> Compromiso con todos nuestros pacientes</li>
                        <li><strong>Responsabilidad:</strong> Cuidado continuo y confiable</li>
                    </ul>
                </div>
            </div>
        </section>

        <!-- Sección de Servicios Mejorada -->
        <section id="servicios" class="servicios-section">
            <div class="section-header">
                <h2>Nuestros Servicios Especializados</h2>
                <p>Contamos con departamentos de alta especialidad equipados con tecnología moderna</p>
            </div>
            <div class="servicios-grid">
                <div class="servicio-card">
                    <div class="servicio-icon">
                        <i class="fas fa-stethoscope"></i>
                    </div>
                    <h3>Cardiología Clínica</h3>
                    <p>Diagnóstico y tratamiento integral de enfermedades cardíacas mediante consulta especializada, seguimiento continuo y manejo personalizado.</p>
                    <a href="login.jsp" class="servicio-btn">Agendar Cita</a>
                </div>
                <div class="servicio-card">
                    <div class="servicio-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <h3>Cirugía Cardíaca</h3>
                    <p>Procedimientos quirúrgicos de alta complejidad como bypass coronario, reemplazo valvular y corrección de cardiopatías congénitas.</p>
                    <a href="login.jsp" class="servicio-btn">Agendar Cita</a>
                </div>
                <div class="servicio-card">
                    <div class="servicio-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <h3>Hemodinamia</h3>
                    <p>Intervenciones minimamente invasivas con tecnología de punta para cateterismos cardíacos, angioplastias y colocación de stents.</p>
                    <a href="login.jsp" class="servicio-btn">Agendar Cita</a>
                </div>
                <div class="servicio-card">
                    <div class="servicio-icon">
                        <i class="fas fa-spa"></i>
                    </div>
                    <h3>Rehabilitación Cardíaca</h3>
                    <p>Programas personalizados de rehabilitación cardiovascular para recuperación integral después de eventos cardíacos.</p>
                    <a href="login.jsp" class="servicio-btn">Agendar Cita</a>
                </div>
            </div>
        </section>

        <!-- Sección de Equipo Médico -->
        <section id="equipo" class="equipo-section">
            <div class="section-header">
                <h2>Nuestro Equipo Médico</h2>
                <p>Profesionales altamente calificados con amplia experiencia en cardiología</p>
            </div>
            <div class="equipo-grid">
                <div class="equipo-card">
                    <div class="equipo-image">
                        <i class="fas fa-user-md"></i>
                    </div>
                    <h3>Dr. Carlos Mendoza</h3>
                    <p>Cardiólogo Interventista</p>
                    <p class="especialidad">20 años de experiencia</p>
                </div>
                <div class="equipo-card">
                    <div class="equipo-image">
                        <i class="fas fa-user-md"></i>
                    </div>
                    <h3>Dra. María Santos</h3>
                    <p>Cirujana Cardíaca</p>
                    <p class="especialidad">18 años de experiencia</p>
                </div>
                <div class="equipo-card">
                    <div class="equipo-image">
                        <i class="fas fa-user-md"></i>
                    </div>
                    <h3>Dr. Roberto Vega</h3>
                    <p>Ecocardiografista</p>
                    <p class="especialidad">15 años de experiencia</p>
                </div>
                <div class="equipo-card">
                    <div class="equipo-image">
                        <i class="fas fa-user-md"></i>
                    </div>
                    <h3>Dra. Ana López</h3>
                    <p>Rehabilitadora Cardíaca</p>
                    <p class="especialidad">12 años de experiencia</p>
                </div>
            </div>
        </section>

        <!-- Sección de Testimonios Mejorada -->
        <section id="testimonios" class="testimonios-section">
            <div class="section-header">
                <h2>Testimonios</h2>
                <p>Miles de vidas transformadas por nuestro equipo médico</p>
            </div>
            <div class="testimonios-grid">
                <div class="testimonio-card">
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <p class="testimonio-texto">"El equipo del Hospital Nacional de Cardiología salvó mi vida con una cirugía de bypass. La atención fue excepcional y el seguimiento postoperatorio me ayudó a recuperarme completamente."</p>
                    <h3>Juan Pérez</h3>
                    <p class="testimonio-procedimiento">Cirugía de Bypass</p>
                </div>
                <div class="testimonio-card">
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <p class="testimonio-texto">"Excelente atención en mi procedimiento de angioplastia. Los doctores explicaron todo el proceso y me hicieron sentir segura en todo momento."</p>
                    <h3>María González</h3>
                    <p class="testimonio-procedimiento">Angioplastia Coronaria</p>
                </div>
                <div class="testimonio-card">
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <p class="testimonio-texto">"Después de mi infarto, el programa de rehabilitación cardíaca me devolvió la confianza y me enseñó a cuidar mejor de mi corazón."</p>
                    <h3>Carlos Rodríguez</h3>
                    <p class="testimonio-procedimiento">Rehabilitación Cardíaca</p>
                </div>
                <div class="testimonio-card">
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <p class="testimonio-texto">"Recomiendo totalmente este hospital. El personal fue muy profesional y atento. Mi cirugía fue un éxito completo."</p>
                    <h3>Patricia Guzmán</h3>
                    <p class="testimonio-procedimiento">Valvuloplastia</p>
                </div>
            </div>
        </section>

        <!-- Sección de Certificaciones -->
        <section id="certificaciones" class="certificaciones-section">
            <div class="section-header">
                <h2>Certificaciones y Acreditaciones</h2>
                <p>Cumplimos con los más altos estándares internacionales de calidad</p>
            </div>
            <div class="certificaciones-grid">
                <div class="certificacion-item">
                    <i class="fas fa-certificate"></i>
                    <h3>ISO 9001:2015</h3>
                    <p>Certificación de Calidad</p>
                </div>
                <div class="certificacion-item">
                    <i class="fas fa-certificate"></i>
                    <h3>JCI Acreditado</h3>
                    <p>Estándares Internacionales</p>
                </div>
                <div class="certificacion-item">
                    <i class="fas fa-certificate"></i>
                    <h3>MINSA Autorizado</h3>
                    <p>Ministerio de Salud</p>
                </div>
                <div class="certificacion-item">
                    <i class="fas fa-certificate"></i>
                    <h3>Miembro de SOLACI</h3>
                    <p>Sociedad Latinoamericana de Cardiología</p>
                </div>
            </div>
        </section>

        <!-- Sección de Contacto -->
        <section id="contacto" class="contacto-section">
            <div class="section-header">
                <h2>Contáctenos</h2>
                <p>Estamos disponibles para atender tus consultas</p>
            </div>
            <div class="contacto-grid">
                <div class="contacto-info">
                    <div class="contacto-item">
                        <i class="fas fa-phone"></i>
                        <h3>Teléfono</h3>
                        <p>+1 (555) 123-4567</p>
                        <p>Emergencias: +1 (555) 999-9999</p>
                    </div>
                    <div class="contacto-item">
                        <i class="fas fa-envelope"></i>
                        <h3>Email</h3>
                        <p>info@cardiologia.pe</p>
                        <p>emergencias@cardiologia.pe</p>
                    </div>
                    <div class="contacto-item">
                        <i class="fas fa-map-marker-alt"></i>
                        <h3>Ubicación</h3>
                        <p>Av. Principal 123</p>
                        <p>Lima, Perú</p>
                    </div>
                    <div class="contacto-item">
                        <i class="fas fa-clock"></i>
                        <h3>Horarios</h3>
                        <p>Lunes a Viernes: 8:00 - 18:00</p>
                        <p>Sábados: 8:00 - 14:00</p>
                    </div>
                </div>
                <div class="contacto-form-wrapper">
                    <form class="contacto-form" id="formContacto">
                        <h3>Formulario de Contacto</h3>
                        <div class="form-group">
                            <input type="text" id="nombre" name="nombre" placeholder="Nombre completo" required>
                        </div>
                        <div class="form-group">
                            <input type="email" id="correo" name="correo" placeholder="Correo electrónico" required>
                        </div>
                        <div class="form-group">
                            <input type="tel" id="telefono" name="telefono" placeholder="Teléfono">
                        </div>
                        <div class="form-group">
                            <select id="especialidad" name="especialidad" required>
                                <option value="">Seleccionar especialidad</option>
                                <option value="cardiologia-clinica">Cardiología Clínica</option>
                                <option value="cirugia-cardiaca">Cirugía Cardíaca</option>
                                <option value="hemodinamia">Hemodinamia</option>
                                <option value="rehabilitacion-cardiaca">Rehabilitación Cardíaca</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <textarea id="mensaje" name="mensaje" placeholder="Mensaje (opcional)" rows="4"></textarea>
                        </div>
                        <button type="submit" class="btn-submit"><i class="fas fa-paper-plane"></i> Enviar</button>
                    </form>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="footer">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>Hospital Nacional de Cardiología</h3>
                    <p>Centro especializado en salud cardiovascular con 35 años de excelencia.</p>
                </div>
                <div class="footer-section">
                    <h4>Enlaces Rápidos</h4>
                    <ul>
                        <li><a href="#inicio">Inicio</a></li>
                        <li><a href="#servicios">Servicios</a></li>
                        <li><a href="#equipo">Equipo Médico</a></li>
                        <li><a href="#contacto">Contacto</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h4>Servicios</h4>
                    <ul>
                        <li><a href="#servicios">Cardiología Clínica</a></li>
                        <li><a href="#servicios">Cirugía Cardíaca</a></li>
                        <li><a href="#servicios">Hemodinamia</a></li>
                        <li><a href="#servicios">Rehabilitación</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h4>Síguenos</h4>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 Hospital Nacional de Cardiología. Todos los derechos reservados.</p>
            </div>
        </footer>

        <script>
            // Event listener removed - handled by contacto.js
        </script>
    </body>
</html>
