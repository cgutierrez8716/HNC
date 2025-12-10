package pe.cjp.citas.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.cjp.citas.model.Usuario;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {
    Optional<Usuario> findByNombreCompletoAndClave(String nombreCompleto, String clave);

    boolean existsByIdUsuario(int idPaciente);
}

