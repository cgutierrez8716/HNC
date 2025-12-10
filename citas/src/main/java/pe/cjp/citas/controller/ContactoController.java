package pe.cjp.citas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import pe.cjp.citas.service.CorreoService;
import pe.cjp.citas.model.ContactoRequest;


@RestController
@RequestMapping("/api")
public class ContactoController {

    @Autowired
    private CorreoService correoService;

    /**
     * Este endpoint maneja la solicitud de contacto y envía un correo al usuario.
     * @param contactoRequest Los datos del formulario de contacto.
     * @return Un mensaje de confirmación.
     */
    @PostMapping("/contacto")
    public java.util.Map<String, String> enviarCorreo(@RequestBody ContactoRequest contactoRequest) {
        try {
            // Llamamos al servicio para enviar el correo
            correoService.enviarCorreo(contactoRequest.getNombre(), contactoRequest.getCorreo(), 
                    contactoRequest.getEspecialidad(), contactoRequest.getTelefono(), 
                    contactoRequest.getMensaje());
            
            java.util.Map<String, String> response = new java.util.HashMap<>();
            response.put("mensaje", "Correo enviado exitosamente");
            response.put("estado", "exito");
            return response;
        } catch (Exception e) {
            java.util.Map<String, String> response = new java.util.HashMap<>();
            response.put("mensaje", "Error al enviar el correo: " + e.getMessage());
            response.put("estado", "error");
            return response;
        }
    }
}
