package pe.cjp.citas.repository;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import pe.cjp.citas.model.DisponibilidadMedico;

@Repository
public class DisponibilidadMedicoRepository {
    private final JdbcTemplate jdbcTemplate;

    public DisponibilidadMedicoRepository(JdbcTemplate jdbcTemplate) {
      this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<DisponibilidadMedico> rowMapper = (rs, rowNum) -> {
        DisponibilidadMedico d = new DisponibilidadMedico();
        d.setIdDisponibilidad(rs.getInt("idDisponibilidad"));
        d.setIdMedico(rs.getInt("idMedico"));
        d.setDiaSemana(rs.getString("diaSemana"));
        d.setHoraInicio(rs.getTime("horaInicio").toLocalTime());
        d.setHoraFin(rs.getTime("horaFin").toLocalTime());
        d.setHoraInicioBloque(rs.getTime("horaInicioBloque").toLocalTime());
        d.setHoraFinBloque(rs.getTime("horaFinBloque").toLocalTime());
        d.setEstado(rs.getInt("estado"));
        d.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
        d.setFechaModificacion(rs.getTimestamp("fechaModificacion"));
        d.setUsuarioModificacion(rs.getString("usuarioModificacion"));
        return d;
    };

    public List<DisponibilidadMedico> obtenerDisponibilidadPorMedico(int idMedico) {
        String sql = "SELECT disponibilidad_medico.* FROM disponibilidad_medico " +
                 "LEFT JOIN citas ON citas.idDisponibilidad = disponibilidad_medico.idDisponibilidad " +
                 "WHERE disponibilidad_medico.idMedico = ? AND (citas.idDisponibilidad IS NULL OR citas.estado != 2)";
        return jdbcTemplate.query(sql, rowMapper, idMedico);
    }

    public void registrarDisponibilidad(int idMedico, String diaSemana, LocalTime horaInicio, LocalTime horaFin,
        int estado, String usuarioModificacion) {
      List<Object[]> batchArgs = new ArrayList<>();
      LocalTime actual = horaInicio;
      
      while (actual.isBefore(horaFin)) {
        LocalTime siguiente = actual.plusMinutes(30);

        batchArgs.add(
            new Object[] { idMedico, diaSemana, horaInicio, horaFin, actual, siguiente, estado, usuarioModificacion });
        actual = siguiente;
      }

      String sql = "INSERT INTO disponibilidad_medico (idMedico, diaSemana, horaInicio, horaFin, horaInicioBloque, horaFinBloque, estado, usuarioModificacion) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
      jdbcTemplate.batchUpdate(sql, batchArgs);
    }
    
        public DisponibilidadMedico obtenerDisponibilidadPorId(int idDisponibilidad) {
        String sql = "SELECT disponibilidad_medico.* FROM disponibilidad_medico " +
                 "WHERE disponibilidad_medico.idDisponibilidad = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(DisponibilidadMedico.class), idDisponibilidad);
    }

        public List<DisponibilidadMedico> listarTodasDisponibilidades() {
          String sql = "SELECT disponibilidad_medico.* FROM disponibilidad_medico";
          return jdbcTemplate.query(sql, rowMapper);
        }

        public int eliminarDisponibilidadPorId(int idDisponibilidad) {
          String sql = "DELETE FROM disponibilidad_medico WHERE idDisponibilidad = ?";
          return jdbcTemplate.update(sql, idDisponibilidad);
        }
}
