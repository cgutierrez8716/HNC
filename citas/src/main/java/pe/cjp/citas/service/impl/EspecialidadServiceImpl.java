
package pe.cjp.citas.service.impl;

import pe.cjp.citas.model.Especialidad;
import pe.cjp.citas.repository.EspecialidadRepository;
import pe.cjp.citas.service.EspecialidadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EspecialidadServiceImpl implements EspecialidadService {

    @Autowired
    private EspecialidadRepository especialidadRepository;

    @Override
    public List<Especialidad> obtenerEspecialidades() {
        return especialidadRepository.findAll();
    }

    @Override
    public Optional<Especialidad> obtenerEspecialidadPorId(int idEspecialidad) {
        return especialidadRepository.findById(idEspecialidad);
    }
}
