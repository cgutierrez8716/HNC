package pe.cjp.citas.service;

import java.util.List;

import org.springframework.stereotype.Service;

import pe.cjp.citas.model.DisponibilidadMedico;
import pe.cjp.citas.repository.DisponibilidadMedicoRepository;

@Service
public class DisponibilidadMedicoService {
    private final DisponibilidadMedicoRepository disponibilidadMedicoRepository;

    public DisponibilidadMedicoService(DisponibilidadMedicoRepository disponibilidadMedicoRepository) {
        this.disponibilidadMedicoRepository = disponibilidadMedicoRepository;
    }

    public List<DisponibilidadMedico> obtenerDisponibilidad(int idMedico) {
      return disponibilidadMedicoRepository.obtenerDisponibilidadPorMedico(idMedico);
    }

    public DisponibilidadMedico obtenerDisponibilidadPorId(int idDisponibilidad) {
      return disponibilidadMedicoRepository.obtenerDisponibilidadPorId(idDisponibilidad);
    }

    public String registrarDisponibilidad(DisponibilidadMedico disponibilidad) {
        disponibilidadMedicoRepository.registrarDisponibilidad(
            disponibilidad.getIdMedico(),
            disponibilidad.getDiaSemana(),
            disponibilidad.getHoraInicio(),
            disponibilidad.getHoraFin(),
            disponibilidad.getEstado(),
            disponibilidad.getUsuarioModificacion()
        );
        return "Disponibilidad registrada correctamente en bloques de 30 minutos.";
    }

    public List<DisponibilidadMedico> listarTodasDisponibilidades() {
      return disponibilidadMedicoRepository.listarTodasDisponibilidades();
    }

    public int eliminarDisponibilidadPorId(int idDisponibilidad) {
      return disponibilidadMedicoRepository.eliminarDisponibilidadPorId(idDisponibilidad);
    }
}
