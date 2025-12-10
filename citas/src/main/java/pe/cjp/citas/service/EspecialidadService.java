package pe.cjp.citas.service;

import pe.cjp.citas.model.Especialidad;
import java.util.List;
import java.util.Optional;

public interface EspecialidadService {
  List<Especialidad> obtenerEspecialidades();
    Optional<Especialidad> obtenerEspecialidadPorId(int idEspecialidad);  // Método para obtener por ID
}