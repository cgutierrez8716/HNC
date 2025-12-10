package pe.cjp.citas.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class CorreoService {

    @Autowired
    private JavaMailSender emailSender;

    /**
     * Este método enviará el correo al usuario con el contenido especificado.
     * @param nombre El nombre del usuario.
     * @param correo El correo del usuario.
     * @param especialidad La especialidad que ha elegido el usuario.
     * @param telefono El teléfono del usuario.
     * @param mensaje El mensaje adicional del usuario.
     */
    public void enviarCorreo(String nombre, String correo, String especialidad, String telefono, String mensaje) {
        // Crear el mensaje de correo
        SimpleMailMessage message = new SimpleMailMessage();
        
        // Establecer la dirección de correo a la que se enviará
        message.setTo(correo);
        
        // Establecer el asunto del correo
        message.setSubject("¡Gracias por contactarnos!");
        
        // Establecer el cuerpo del correo
        StringBuilder body = new StringBuilder();
        body.append("Hola ").append(nombre).append(",\n\n");
        body.append("¡Gracias por contactarnos!\n\n");
        body.append("Hemos recibido tu solicitud de contacto con los siguientes datos:\n\n");
        body.append("Nombre: ").append(nombre).append("\n");
        body.append("Correo: ").append(correo).append("\n");
        body.append("Teléfono: ").append(telefono != null ? telefono : "No proporcionado").append("\n");
        body.append("Especialidad: ").append(especialidad).append("\n");
        if (mensaje != null && !mensaje.isEmpty()) {
            body.append("Mensaje: ").append(mensaje).append("\n");
        }
        body.append("\nNos pondremos en contacto contigo a la brevedad.\n\n");
        body.append("Atentamente,\nHospital Nacional de Cardiología");
        
        message.setText(body.toString());

        // Enviar el mensaje
        emailSender.send(message);
    }
}
