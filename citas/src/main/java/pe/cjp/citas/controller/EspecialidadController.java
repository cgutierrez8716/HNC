package pe.cjp.citas.controller;

import pe.cjp.citas.model.Especialidad;
import pe.cjp.citas.service.EspecialidadService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.tags.Tag;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/especialidades")
@Tag(name = "Especialidad", description = "API para la gestión de Especialidades.")
public class EspecialidadController {

    @Autowired
    private EspecialidadService especialidadService;

    // Endpoint para listar todas las especialidades
    @GetMapping
    public List<Especialidad> listarEspecialidades() {
        return especialidadService.obtenerEspecialidades();
    }

    // Endpoint para obtener una especialidad por su ID
    @GetMapping("/{idEspecialidad}")
    public Optional<Especialidad> obtenerEspecialidadPorId(@PathVariable int idEspecialidad) {
        return especialidadService.obtenerEspecialidadPorId(idEspecialidad);
    }
}