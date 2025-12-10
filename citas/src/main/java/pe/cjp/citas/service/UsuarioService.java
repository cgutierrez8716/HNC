package pe.cjp.citas.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.cjp.citas.model.Usuario;
import pe.cjp.citas.repository.UsuarioRepository;

@Service
public class UsuarioService {
    @Autowired
    private UsuarioRepository usuarioRepository;
    
    public Optional<Usuario> autenticar(String nombreCompleto, String clave) {
        return usuarioRepository.findByNombreCompletoAndClave(nombreCompleto, clave);
    }
    
    public boolean existsByIdPaciente(int idPaciente) {
      return usuarioRepository.existsByIdUsuario(idPaciente);
    }
    
    // Registrar un usuario
    public void registrarUsuario(Usuario usuario) {
      usuarioRepository.save(usuario);
    }
    
    // Listar todos los usuarios
    public List<Usuario> listarUsuarios() {
        return usuarioRepository.findAll();
    }
}
