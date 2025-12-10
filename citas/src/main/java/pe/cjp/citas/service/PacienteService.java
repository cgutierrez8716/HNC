package pe.cjp.citas.service;

import pe.cjp.citas.model.Paciente;
import pe.cjp.citas.repository.PacienteRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PacienteService {
    private final PacienteRepository pacienteRepository;

    public PacienteService(PacienteRepository pacienteRepository) {
        this.pacienteRepository = pacienteRepository;
    }

    public List<Paciente> listarPacientes() {
        return pacienteRepository.listarPacientes();
    }

    public Paciente obtenerPorId(int id) {
      return pacienteRepository.obtenerPorId(id);
    }
    
    public Paciente obtenerPorNumeroDocumento(String numeroDocumento) {
      return pacienteRepository.obtenerPorNumeroDocumento(numeroDocumento);
    }    

    public int registrarPaciente(Paciente paciente) {
        return pacienteRepository.registrarPaciente(paciente);
    }

    public int actualizarPaciente(Paciente paciente) {
        return pacienteRepository.actualizarPaciente(paciente);
    }

    public int eliminarPaciente(int id) {
        return pacienteRepository.eliminarPaciente(id);
    }
}
