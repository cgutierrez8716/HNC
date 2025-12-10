package pe.cjp.citas.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import pe.cjp.citas.model.DisponibilidadMedico;
import pe.cjp.citas.service.DisponibilidadMedicoService;

@RestController
@RequestMapping("/api/disponibilidad")
@Tag(name = "DisponibilidadMedica", description = "API para la gestión de disponibilidad médica.")
public class DisponibilidadMedicoController {

    private final DisponibilidadMedicoService disponibilidadMedicoService;

    public DisponibilidadMedicoController(DisponibilidadMedicoService disponibilidadMedicoService) {
      this.disponibilidadMedicoService = disponibilidadMedicoService;
    }

    @Operation(summary = "Obtener disponibilidad médica por idMédico.")
    @GetMapping("medico/{idMedico}")
    public ResponseEntity<List<DisponibilidadMedico>> obtenerDisponibilidad(@PathVariable int idMedico) {
      List<DisponibilidadMedico> disponibilidad = disponibilidadMedicoService.obtenerDisponibilidad(idMedico);
      return disponibilidad.isEmpty() ? ResponseEntity.noContent().build() : ResponseEntity.ok(disponibilidad);
    }

    @Operation(summary = "Registrar la disponibilidad médica.")
    @PostMapping
    public ResponseEntity<String> registrarDisponibilidad(@RequestBody DisponibilidadMedico disponibilidad) {
      String respuesta = disponibilidadMedicoService.registrarDisponibilidad(disponibilidad);
      return ResponseEntity.ok(respuesta);
    }
    
    @Operation(summary = "Obtener disponibilidad por idDisponibilidad")
    @GetMapping("disponibilidad/{idDisponibilidad}")
    public ResponseEntity<DisponibilidadMedico> obtenerDisponibilidadPorId(@PathVariable int idDisponibilidad) {
        DisponibilidadMedico disponibilidad = disponibilidadMedicoService.obtenerDisponibilidadPorId(idDisponibilidad);
    return (disponibilidad != null) ? ResponseEntity.ok(disponibilidad) : ResponseEntity.noContent().build();
    }

    @Operation(summary = "Migrar disponibilidades grandes a slots de 30 minutos")
    @PostMapping("migrate-to-slots")
    public ResponseEntity<String> migrarDisponibilidadesA30min() {
      List<DisponibilidadMedico> todas = disponibilidadMedicoService.listarTodasDisponibilidades();
      int convertidas = 0;
      for (DisponibilidadMedico d : todas) {
        try {
          java.time.Duration dur = java.time.Duration.between(d.getHoraInicioBloque(), d.getHoraFinBloque());
          long minutos = dur.toMinutes();
          if (minutos > 30) {
            // Eliminar el registro "padre" que representa un bloque grande
            disponibilidadMedicoService.eliminarDisponibilidadPorId(d.getIdDisponibilidad());
            // Crear slots entre horaInicioBloque y horaFinBloque usando el servicio
            DisponibilidadMedico temp = new DisponibilidadMedico();
            temp.setIdMedico(d.getIdMedico());
            temp.setDiaSemana(d.getDiaSemana());
            temp.setHoraInicio(d.getHoraInicioBloque());
            temp.setHoraFin(d.getHoraFinBloque());
            temp.setEstado(d.getEstado());
            temp.setUsuarioModificacion("migration");
            disponibilidadMedicoService.registrarDisponibilidad(temp);
            convertidas++;
          }
        } catch (Exception ex) {
          // continuar con siguiente
        }
      }
      return ResponseEntity.ok("Migración completada. Bloques convertidos: " + convertidas);
    }

    @Operation(summary = "Dry-run: listar bloques mayores a 30 minutos que serían convertidos")
    @GetMapping("migrate-to-slots/dry-run")
    public ResponseEntity<List<Object>> dryRunMigracion() {
      List<DisponibilidadMedico> todas = disponibilidadMedicoService.listarTodasDisponibilidades();
      List<Object> bloques = new java.util.ArrayList<>();
      for (DisponibilidadMedico d : todas) {
        try {
          java.time.Duration dur = java.time.Duration.between(d.getHoraInicioBloque(), d.getHoraFinBloque());
          long minutos = dur.toMinutes();
          if (minutos > 30) {
            java.util.Map<String,Object> m = new java.util.HashMap<>();
            m.put("idDisponibilidad", d.getIdDisponibilidad());
            m.put("idMedico", d.getIdMedico());
            m.put("horaInicioBloque", d.getHoraInicioBloque().toString());
            m.put("horaFinBloque", d.getHoraFinBloque().toString());
            m.put("minutos", minutos);
            bloques.add(m);
          }
        } catch (Exception ex) {
          // ignorar errores por registro
        }
      }
      return ResponseEntity.ok(bloques);
    }

}
