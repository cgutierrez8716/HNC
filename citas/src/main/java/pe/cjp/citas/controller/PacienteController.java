package pe.cjp.citas.controller;

import pe.cjp.citas.model.Paciente;
import pe.cjp.citas.service.PacienteService;
import org.springframework.web.bind.annotation.*;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

import java.util.List;

@RestController
@RequestMapping("/api/pacientes")
@Tag(name = "Pacientes", description = "API para la gestión de pacientes")
public class PacienteController {
    private final PacienteService pacienteService;

    public PacienteController(PacienteService pacienteService) {
      this.pacienteService = pacienteService;
    }

    @Operation(summary = "Obtener todos los pacientes")
    @GetMapping
    public List<Paciente> listarPacientes() {
      return pacienteService.listarPacientes();
    }

    @Operation(summary = "Obtener paciente por IdPaciente")
    @GetMapping("id/{id}")
    public Paciente obtenerPacientePorId(@PathVariable int id) {
      return pacienteService.obtenerPorId(id);
    }
    
    @Operation(summary = "Obtener paciente por Numero de Documento")
    @GetMapping("documento/{numeroDocumento}")
    public Paciente obtenerPacientePorNumeroDocumento(@PathVariable String numeroDocumento) {
      return pacienteService.obtenerPorNumeroDocumento(numeroDocumento);
    }

    @Operation(summary = "Registrar paciente")
    @PostMapping
    public String registrarPaciente(@RequestBody Paciente paciente) {
      pacienteService.registrarPaciente(paciente);
      return "Paciente registrado exitosamente";
    }

    @Operation(summary = "Actualizar paciente")
    @PutMapping
    public String actualizarPaciente(@RequestBody Paciente paciente) {
      pacienteService.actualizarPaciente(paciente);
      return "Paciente actualizado exitosamente";
    }

    @Operation(summary = "Eliminar paciente por IdPaciente")
    @DeleteMapping("deletePaciente/{id}")
    public String eliminarPaciente(@PathVariable int id) {
        pacienteService.eliminarPaciente(id);
        return "Paciente eliminado exitosamente";
    }
}