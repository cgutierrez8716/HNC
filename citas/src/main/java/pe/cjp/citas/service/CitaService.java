package pe.cjp.citas.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import pe.cjp.citas.DTO.CitaDTO;
import pe.cjp.citas.model.Cita;
import pe.cjp.citas.model.DisponibilidadMedico;
import pe.cjp.citas.model.Especialidad;
import pe.cjp.citas.model.Medico;
import pe.cjp.citas.repository.CitaRepository;
import pe.cjp.citas.repository.DisponibilidadMedicoRepository;
import pe.cjp.citas.repository.EspecialidadRepository;
import pe.cjp.citas.repository.MedicoRepository;

@Service
public class CitaService {

    private final CitaRepository citaRepository;
    private final EspecialidadRepository especialidadRepository;
    private final MedicoRepository medicoRepository;
    private final DisponibilidadMedicoRepository disponibilidadRepository;

    public CitaService(CitaRepository citaRepository, EspecialidadRepository especialidadRepository, MedicoRepository medicoRepository, DisponibilidadMedicoRepository disponibilidadRepository) {
      this.citaRepository = citaRepository;
      this.especialidadRepository = especialidadRepository;
      this.medicoRepository = medicoRepository;
      this.disponibilidadRepository = disponibilidadRepository;
    }

    public List<CitaDTO> obtenerCitasPorPaciente(int idPaciente) {
        List<Cita> citas = citaRepository.obtenerCitasPorPaciente(idPaciente);

        return citas.stream().map(cita -> {
            Especialidad especialidad = especialidadRepository.findById(cita.getIdEspecialidad()).orElse(null);
            Medico medico = medicoRepository.findById(cita.getIdMedico()).orElse(null);
            DisponibilidadMedico disponibilidad = disponibilidadRepository.obtenerDisponibilidadPorId(cita.getIdDisponibilidad());

            String nombreEspecialidad = (especialidad != null) ? especialidad.getNombre() : "Desconocido";
            String nombreMedico = (medico != null) ? medico.getApellidos() + ", " + medico.getNombres() : "No asignado";
            String diaSemana = (disponibilidad != null) ? disponibilidad.getDiaSemana() : "Sin horario";
            String horario = (disponibilidad != null) ? disponibilidad.getHoraInicioBloque() + " - " + disponibilidad.getHoraFinBloque() : "No disponible";

            return new CitaDTO(
                cita.getIdCita(),
                nombreEspecialidad,
                nombreMedico,
                diaSemana,
                horario,
                (cita.getFechaCita() != null) ? cita.getFechaCita() : cita.getFechaCreacion(),
                cita.getEstado()
            );
        }).collect(Collectors.toList());
    }

    public String registrarCita(Cita cita) {
        if (!citaRepository.verificarDisponibilidad(cita.getIdDisponibilidad())) {
            return "El horario seleccionado ya está ocupado.";
        }
        int filasAfectadas = citaRepository.registrarCita(cita);
        return filasAfectadas > 0 ? "Cita registrada correctamente" : "Error al registrar la cita";
    }


    public String cancelarCita(int idCita, String usuarioModificacion) {
        int filasAfectadas = citaRepository.cancelarCita(idCita, usuarioModificacion);
        return filasAfectadas > 0 ? "Cita cancelada correctamente" : "Error al cancelar la cita";
    }

    public boolean verificarDisponibilidad(int idDisponibilidad) {
        return citaRepository.verificarDisponibilidad(idDisponibilidad);
    }

}
