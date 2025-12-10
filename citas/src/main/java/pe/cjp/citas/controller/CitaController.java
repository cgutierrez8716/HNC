package pe.cjp.citas.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import pe.cjp.citas.DTO.CitaCancelarDTO;
import pe.cjp.citas.DTO.CitaDTO;
import pe.cjp.citas.model.Cita;
import pe.cjp.citas.service.CitaService;

@RestController
@RequestMapping("/api/citas")
@Tag(name = "Cita", description = "API para la gestión de citas")
public class CitaController {
    private final CitaService citaService;

    public CitaController(CitaService citaService) {
      this.citaService = citaService;
    }

    @Operation(summary = "Obtener citas por IdPaciente")
    @GetMapping("/{idPaciente}")
    public ResponseEntity<List<CitaDTO>> obtenerCitasPorPaciente(@PathVariable int idPaciente) {
        List<CitaDTO> citas = citaService.obtenerCitasPorPaciente(idPaciente);
        return citas.isEmpty() ? ResponseEntity.noContent().build() : ResponseEntity.ok(citas);
    }

    @Operation(summary = "Registrar una cita")
    @PostMapping
    public ResponseEntity<String> registrarCita(@RequestBody Cita cita) {
      String respuesta = citaService.registrarCita(cita);
      return ResponseEntity.ok(respuesta);
    }

    @Operation(summary = "Verificar disponibilidad por idDisponibilidad")
    @GetMapping("/verificar/{idDisponibilidad}")
    public ResponseEntity<Boolean> verificarDisponibilidad(@PathVariable int idDisponibilidad) {
      boolean disponible = citaService.verificarDisponibilidad(idDisponibilidad);
      return ResponseEntity.ok(disponible);
    }

    @Operation(summary = "Cancelar una cita")
    @PutMapping("/cancelar")
    public ResponseEntity<String> cancelarCita(@RequestBody CitaCancelarDTO citaCancelarDTO) {
      String respuesta = citaService.cancelarCita(citaCancelarDTO.getIdCita(),
          citaCancelarDTO.getUsuarioModificacion());
      return ResponseEntity.ok(respuesta);
    }
}
