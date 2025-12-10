package pe.cjp.citas.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import pe.cjp.citas.model.Medico;
import pe.cjp.citas.service.MedicoService;

@RestController
@RequestMapping("/api/medicos")
@Tag(name = "Médico", description = "API para la gestión Médica")
public class MedicoController {

  private final MedicoService medicoService;

  public MedicoController(MedicoService medicoService) {
    this.medicoService = medicoService;
  }

    @Operation(summary = "Obtener todos los médicos")
    @GetMapping
    public List<Medico> listarMedicos() {
      return medicoService.listarMedicos();
    }

  @Operation(summary = "Obtener lista de médicos por el idEspecialidad.")
  @GetMapping("/especialidad/{idEspecialidad}")
  public ResponseEntity<List<Medico>> obtenerMedicosPorEspecialidad(@PathVariable int idEspecialidad) {
    List<Medico> medicos = medicoService.obtenerMedicosPorEspecialidad(idEspecialidad);
    return ResponseEntity.ok(medicos);
  }

    @Operation(summary = "Obtener médico por el idMédico.")
  @GetMapping("/medico/{idMedico}")
  public ResponseEntity<List<Medico>> obtenerMedicoPorIdMedico(@PathVariable int idMedico) {
    List<Medico> medicos = medicoService.obtenerMedicoPorIdMedico(idMedico);
    return ResponseEntity.ok(medicos);
  }
}