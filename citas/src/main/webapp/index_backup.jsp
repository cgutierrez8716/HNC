<%-- 
    Document   : index
    Created on : 01 Octubre. 2025, 2:30:01 p. m.
    Author     : Carlos Gutierrez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/principal.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <title>Hospital Nacional de Cardiología</title>
        <!-- SweetAlert2 CSS y JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="js/contacto.js"></script>
        <script src="js/carousel.js"></script>
    </head>
    <body>
        <header>
            <div class="logo">
                <img src="imagenes/logo.png" alt="Logo del Hospital Nacional de Cardiología">
            </div>
            <div class="menu-container">
                <nav>
                    <ul class="menu">
                        <li><a href="#inicio">Inicio</a></li>
                        <li><a href="#nosotros">Nosotros</a></li>
                        <li><a href="#servicios">Servicios</a></li>
                        <li><a href="#testimonios">Testimonios</a></li>
                        <li><a href="#contacto">Contacto</a></li>
                    </ul>
                </nav>
            </div>
            <a class="reservar-btn" href="login.jsp" target="_blank">Reservar CITA</a>
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

                <!-- Botones de navegación -->
                <button class="carousel-nav-button prev" onclick="previousSlide()">
                    <i class="fas fa-chevron-left"></i>
                </button>
                <button class="carousel-nav-button next" onclick="nextSlide()">
                    <i class="fas fa-chevron-right"></i>
                </button>

                <!-- Indicadores -->
                <div class="carousel-indicators">
                    <span class="indicator active" onclick="currentSlide(0)"></span>
                    <span class="indicator" onclick="currentSlide(1)"></span>
                    <span class="indicator" onclick="currentSlide(2)"></span>
                    <span class="indicator" onclick="currentSlide(3)"></span>
                    <span class="indicator" onclick="currentSlide(4)"></span>
                </div>
            </div>
        </section>

        <section id="nosotros">
            <div class="nosotros2">
                <h2>NOSOTROS</h2>
                <div class="nosotros-content">
                    <div class="nosotros-text">
                        <p>El Hospital Nacional de Cardiología es la institución de referencia nacional en el tratamiento y prevención de enfermedades cardiovasculares. 
                           Fundado en 1985, nos hemos consolidado como el centro líder en cardiología, contando con tecnología de vanguardia y un equipo médico 
                           altamente especializado. Nuestra trayectoria está avalada por más de 35 años de excelencia en el cuidado cardíaco, siendo pioneros 
                           en procedimientos de intervención cardiovascular en el país.</p>
                    </div>
                    <div class="nosotros-image">
                        <img src="imagenes/nosotros.jpg" alt="Instalaciones del Hospital Nacional de Cardiología">
                    </div>
                </div>
                <div class="nosotros-mission-vision">
                    <div class="mission">
                        <h4>MISIÓN</h4>
                        <p>
                            Brindar atención cardiológica especializada de alta complejidad con estándares de calidad internacional, mediante un equipo médico multidisciplinario 
                            comprometido con el cuidado integral del paciente. Nos dedicamos a la prevención, diagnóstico, tratamiento y rehabilitación de enfermedades 
                            cardiovasculares, combinando tecnología de vanguardia con calidez humana, educación continua e investigación innovadora.
                        </p>
                    </div>
                    <div class="vision">
                        <h4>VISIÓN</h4>
                        <p>
                        Nuestra visión es ser el centro de referencia nacional líder en cardiología, reconocido por la excelencia en la atención cardiovascular integral, 
                        la innovación en investigación cardíaca y la formación de profesionales altamente especializados. Aspiramos a ser pioneros en el desarrollo 
                        de tratamientos revolucionarios que transformen la vida de pacientes con enfermedades del corazón.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <section id="servicios">
            <h2 align="center">NUESTRAS ESPECIALIDADES</h2>
            <div class="especialidades">
                <div class="especialidad">
                    <h4>CARDIOLOGÍA CLÍNICA</h4>
                    <p>Diagnóstico y tratamiento integral de enfermedades cardíacas mediante consulta especializada, 
                       seguimiento continuo y manejo personalizado de cada paciente.</p>
                    <img src="imagenes/cardiologia_clinica.jpg" alt="Cardiología Clínica">
                </div>
                <div class="especialidad">
                    <h4>CIRUGÍA CARDÍACA</h4>
                    <p>Realizamos procedimientos quirúrgicos de alta complejidad como bypass coronario, 
                       reemplazo valvular y corrección de cardiopatías congénitas.</p>
                    <img src="imagenes/cirugia_cardiaca.jpg" alt="Cirugía Cardíaca">
                </div>
                <div class="especialidad">
                    <h4>HEMODINAMIA</h4>
                    <p>Unidad de hemodinamia equipada con tecnología de punta para cateterismos cardíacos, 
                       angioplastias y colocación de stents coronarios.</p>
                    <img src="imagenes/hemodinamia.jpg" alt="Hemodinamia">
                </div>
                <div class="especialidad">
                    <h4>REHABILITACIÓN CARDÍACA</h4>
                    <p>Programas personalizados de rehabilitación cardiovascular para recuperación 
                       después de eventos cardíacos y mejora de la calidad de vida.</p>
                    <img src="imagenes/rehabilitacion_cardiaca.jpg" alt="Rehabilitación Cardíaca">
                </div>
            </div>
        </section>


        <section id="testimonios" class="testimonios-section">
            <h2 align="center">TESTIMONIOS DE NUESTROS PACIENTES</h2>
            <div class="testimonios-container">
                <div class="testimonio">
                    <h3>Juan Pérez</h3>
                    <p>"El equipo del Hospital Nacional de Cardiología salvó mi vida con una cirugía de bypass. 
                       La atención fue excepcional y el seguimiento postoperatorio me ayudó a recuperarme completamente."</p>
                </div>
                <div class="testimonio">
                    <h3>María González</h3>
                    <p>"Excelente atención en mi procedimiento de angioplastia. Los doctores explicaron todo el proceso 
                       y me hicieron sentir segura en todo momento. ¡Recomiendo totalmente este hospital!"</p>
                </div>
                <div class="testimonio">
                    <h3>Carlos Rodríguez</h3>
                    <p>"Después de mi infarto, el programa de rehabilitación cardíaca me devolvió la confianza 
                       y me enseñó a cuidar mejor de mi corazón. Agradecido con todo el personal médico."</p>
                </div>
            </div>
        </section>

        <section id="contacto">
            <h2>CONTÁCTENOS</h2>
            <div class="contacto-container">
                <div class="contacto-content">
                    <img src="imagenes/contactenos.jpg" alt="Contacto - Hospital Nacional de Cardiología" class="contacto-image">
                    <form class="contacto-form" id="formContacto">
                        <h3>Formulario de Contacto</h3>
                        <br>
                        <div class="form-group">
                            <label for="nombre">Nombre:</label>
                            <input type="text" id="nombre" name="nombre" required>
                        </div>
                        <div class="form-group">
                            <label for="direccion">Dirección:</label>
                            <input type="text" id="direccion" name="direccion">
                        </div>
                        <div class="form-group">
                            <label for="telefono">Teléfono:</label>
                            <input type="tel" id="telefono" name="telefono">
                        </div>
                        <div class="form-group">
                            <label for="correo">Correo:</label>
                            <input type="email" id="correo" name="correo" required>
                        </div>
                        <div class="form-group">
                            <label for="especialidad">Especialidad:</label>
                            <select id="especialidad" name="especialidad">
                                <option value="cardiologia-clinica">Cardiología Clínica</option>
                                <option value="cirugia-cardiaca">Cirugía Cardíaca</option>
                                <option value="hemodinamia">Hemodinamia</option>
                                <option value="rehabilitacion-cardiaca">Rehabilitación Cardíaca</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="fecha">Fecha:</label>
                            <input type="date" id="fecha" name="fecha">
                        </div>
                        <div class="form-group">
                            <button type="submit">Enviar</button>
                        </div>
                    </form>
                </div>
            </div>
        </section>

        <footer>
            <div class="copyright">
                <h2>Hospital Nacional de Cardiología © 2025</h2>
            </div>
        </footer>

        <script>
            // Manejo del envío del formulario de contacto
            document.getElementById('formContacto').addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Simulación de envío exitoso (reemplazar con tu lógica real)
                setTimeout(() => {
                    Swal.fire({
                        icon: 'success',
                        title: 'Mensaje enviado con éxito',
                        text: 'Nos contactaremos con usted a la brevedad',
                        confirmButtonText: 'Entendido',
                        confirmButtonColor: '#3085d6',
                        customClass: {
                            popup: 'animated bounceIn'
                        }
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // Resetear el formulario después de aceptar
                            document.getElementById('formContacto').reset();
                        }
                    });
                }, 1000);
            });
        </script>
    </body>
</html>