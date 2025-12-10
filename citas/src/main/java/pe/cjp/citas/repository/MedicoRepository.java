package pe.cjp.citas.repository;

import pe.cjp.citas.model.Medico;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface MedicoRepository extends JpaRepository<Medico, Integer> {
  List<Medico> findByIdEspecialidad(int idEspecialidad);
    
  List<Medico> findByIdMedico(int idMedico);
}

