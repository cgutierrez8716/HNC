package pe.cjp.citas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.cjp.citas.model.Medico;
import pe.cjp.citas.repository.MedicoRepository;

@Service
public class MedicoService {
  
    @Autowired
    private MedicoRepository medicoRepository;

    public List<Medico> obtenerMedicosPorEspecialidad(int idEspecialidad) {
      return medicoRepository.findByIdEspecialidad(idEspecialidad);
    }

    public List<Medico> obtenerMedicoPorIdMedico(int idMedico) {
      return medicoRepository.findByIdMedico(idMedico);
    }

    public List<Medico> listarMedicos() {
      return medicoRepository.findAll();
    }
    
    
}
