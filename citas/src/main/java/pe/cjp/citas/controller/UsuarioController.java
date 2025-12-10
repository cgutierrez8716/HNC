package pe.cjp.citas.controller;

import org.springframework.web.bind.annotation.*;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

import org.springframework.http.ResponseEntity;

import pe.cjp.citas.DTO.LoginRequest;
import pe.cjp.citas.model.Usuario;
import pe.cjp.citas.service.UsuarioService;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("api/usuarios")
@Tag(name = "Usuario", description = "API para la gestión de Usuarios.")
public class UsuarioController {
  private final UsuarioService usuarioService;

        public UsuarioController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    // Servicio de listar usuarios
    @Operation(summary = "Obtener todos los usuarios.")
    @GetMapping
    public List<Usuario> listarUsuarios() {
        return usuarioService.listarUsuarios();
    }

    // Servicio de Login
    @Operation(summary = "Validar el login de un usuario.")
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest request) {
        Optional<Usuario> usuario = usuarioService.autenticar(request.getNombreCompleto(), request.getClave());
        
        if (usuario.isPresent()) {
            return ResponseEntity.ok("Login exitoso");
        } else {
            return ResponseEntity.status(401).body("Credenciales incorrectas.");
        }
    }

    // Servicio para registrar un usuario
    @Operation(summary = "Registrar el login de un usuario.")
    @PostMapping
    public ResponseEntity<?> registrar(@RequestBody Usuario usuario) {
        usuarioService.registrarUsuario(usuario);
        return ResponseEntity.ok("Usuario registrado exitosamente.");
    }
}