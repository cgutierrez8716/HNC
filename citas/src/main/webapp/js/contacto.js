/* 
 * Manejador del formulario de contacto
 * Envía los datos al backend para procesar el envío de correo
 */

document.addEventListener("DOMContentLoaded", function () {
    const contactForm = document.querySelector(".contacto-form");

    if (contactForm) {
        contactForm.addEventListener("submit", function (event) {
            event.preventDefault();

            const nombre = contactForm.querySelector("#nombre").value;
            const telefono = contactForm.querySelector("#telefono").value;
            const correo = contactForm.querySelector("#correo").value;
            const especialidad = contactForm.querySelector("#especialidad").value;
            const mensaje = contactForm.querySelector("#mensaje").value;

            // Prepare data to send
            const formData = {
                nombre: nombre,
                telefono: telefono,
                correo: correo,
                especialidad: especialidad,
                mensaje: mensaje
            };

            // Send data to backend
            fetch('/api/contacto', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Error en la respuesta del servidor');
                }
                return response.json();
            })
            .then(data => {
                console.log('Correo enviado:', data);
                Swal.fire({
                    icon: 'success',
                    title: 'Mensaje enviado con éxito',
                    text: 'Nos contactaremos con usted a la brevedad',
                    confirmButtonText: 'Entendido',
                    confirmButtonColor: '#1976d2'
                }).then((result) => {
                    if (result.isConfirmed) {
                        contactForm.reset();
                    }
                });
            })
            .catch((error) => {
                console.error('Error al enviar el correo:', error);
                Swal.fire({
                    icon: 'error',
                    title: 'Error al enviar',
                    text: 'Ocurrió un error al enviar el mensaje. Por favor, intente nuevamente.',
                    confirmButtonText: 'Aceptar',
                    confirmButtonColor: '#1976d2'
                });
            });
        });
    }
});



