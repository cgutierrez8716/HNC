package pe.cjp.citas.repository;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import pe.cjp.citas.model.Cita;

@Repository
public class CitaRepository {
    private final JdbcTemplate jdbcTemplate;

    public CitaRepository(JdbcTemplate jdbcTemplate) {
      this.jdbcTemplate = jdbcTemplate;
    }
    
    private final RowMapper<Cita> rowMapper = (rs, rowNum) -> {
        Cita c = new Cita();
        c.setIdCita(rs.getInt("idCita"));
        c.setIdPaciente(rs.getInt("idPaciente"));
        c.setIdDisponibilidad(rs.getInt("idDisponibilidad"));
        c.setIdEspecialidad(rs.getInt("idEspecialidad"));
        c.setIdMedico(rs.getInt("idMedico"));
        c.setEstado(rs.getInt("estado"));
        c.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
        try {
            c.setFechaCita(rs.getTimestamp("fechaCita"));
        } catch (Exception e) {
            // columna fechaCita puede no existir en algunas bases; ignorar si no está presente
        }
        c.setFechaModificacion(rs.getTimestamp("fechaModificacion"));
        c.setUsuarioModificacion(rs.getString("usuarioModificacion"));
        return c;
    };

    public List<Cita> obtenerCitasPorPaciente(int idPaciente) {
        String sql = "SELECT * FROM citas WHERE idPaciente = ? ORDER BY fechaCreacion ASC";
        return jdbcTemplate.query(sql, rowMapper, idPaciente);
    }

    public int registrarCita(Cita cita) {
        if (cita.getFechaCita() != null) {
            String sql = "INSERT INTO citas (idPaciente, idDisponibilidad, idEspecialidad, idMedico, estado, usuarioModificacion, fechaCita) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try {
                return jdbcTemplate.update(sql, cita.getIdPaciente(), cita.getIdDisponibilidad(), cita.getIdEspecialidad(), cita.getIdMedico(), cita.getEstado(), cita.getUsuarioModificacion(), new java.sql.Timestamp(cita.getFechaCita().getTime()));
            } catch (org.springframework.dao.DataAccessException ex) {
                // Si la columna fechaCita no existe en la tabla, reintentar sin ella (compatibilidad hacia atrás)
                String fallback = "INSERT INTO citas (idPaciente, idDisponibilidad, idEspecialidad, idMedico, estado, usuarioModificacion) VALUES (?, ?, ?, ?, ?, ?)";
                return jdbcTemplate.update(fallback, cita.getIdPaciente(), cita.getIdDisponibilidad(), cita.getIdEspecialidad(), cita.getIdMedico(), cita.getEstado(), cita.getUsuarioModificacion());
            }
        } else {
            String sql = "INSERT INTO citas (idPaciente, idDisponibilidad, idEspecialidad, idMedico, estado, usuarioModificacion) VALUES (?, ?, ?, ?, ?, ?)";
            return jdbcTemplate.update(sql, cita.getIdPaciente(), cita.getIdDisponibilidad(), cita.getIdEspecialidad(), cita.getIdMedico(), cita.getEstado(), cita.getUsuarioModificacion());
        }
    }

    public int cancelarCita(int idCita, String usuarioModificacion) {
        String sql = "UPDATE citas SET estado = 2, fechaModificacion = GETDATE(), usuarioModificacion = ? WHERE idCita = ?";
        return jdbcTemplate.update(sql, usuarioModificacion, idCita);
    }
    
    public boolean verificarDisponibilidad(int idDisponibilidad) {
    // Corregir precedencia: verificar solo para el idDisponibilidad dado y estados 1 o 3
    String sql = "SELECT COUNT(*) FROM citas WHERE idDisponibilidad = ? AND (estado = 1 OR estado = 3)";
    Integer count = jdbcTemplate.queryForObject(sql, Integer.class, idDisponibilidad);
    return count != null && count == 0;
}

}
