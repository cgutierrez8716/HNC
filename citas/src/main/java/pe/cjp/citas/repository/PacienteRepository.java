package pe.cjp.citas.repository;

import pe.cjp.citas.model.Paciente;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PacienteRepository {
    private final JdbcTemplate jdbcTemplate;

    public PacienteRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Paciente> rowMapper = (rs, rowNum) -> {
        Paciente paciente = new Paciente();
        paciente.setIdPaciente(rs.getInt("idPaciente"));
        paciente.setTipoDocumento(rs.getString("tipoDocumento"));
        paciente.setNumeroDocumento(rs.getString("numeroDocumento"));
        paciente.setApellidos(rs.getString("apellidos"));
        paciente.setNombres(rs.getString("nombres"));
        paciente.setSexo(rs.getString("sexo"));
        paciente.setDireccion(rs.getString("direccion"));
        paciente.setCorreo(rs.getString("correo"));
        paciente.setCelular(rs.getString("celular"));
        paciente.setUsuarioWeb(rs.getInt("usuarioWeb"));
        paciente.setEstado(rs.getInt("estado"));
        return paciente;
    };

    public List<Paciente> listarPacientes() {
        return jdbcTemplate.query("SELECT * FROM Paciente", rowMapper);
    }

    public Paciente obtenerPorId(int id) {
      return jdbcTemplate.queryForObject("SELECT * FROM Paciente WHERE idPaciente = ?", rowMapper, id);
    }
    
    public Paciente obtenerPorNumeroDocumento(String numeroDocumento) {
      return jdbcTemplate.queryForObject("SELECT * FROM Paciente WHERE numeroDocumento = ?", rowMapper, numeroDocumento);
    }

    public int registrarPaciente(Paciente paciente) {
        return jdbcTemplate.update("INSERT INTO Paciente (tipoDocumento, numeroDocumento, apellidos, nombres, sexo, direccion, correo, celular, usuarioWeb, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            paciente.getTipoDocumento(), paciente.getNumeroDocumento(), paciente.getApellidos(), paciente.getNombres(), paciente.getSexo(), paciente.getDireccion(), paciente.getCorreo(), paciente.getCelular(), paciente.getUsuarioWeb(), paciente.getEstado());
    }

    public int actualizarPaciente(Paciente paciente) {
        return jdbcTemplate.update("UPDATE Paciente SET tipoDocumento=?, numeroDocumento=?, apellidos=?, nombres=?, sexo=?, direccion=?, correo=?, celular=?, usuarioWeb=?, estado=? WHERE idPaciente=?",
            paciente.getTipoDocumento(), paciente.getNumeroDocumento(), paciente.getApellidos(), paciente.getNombres(), paciente.getSexo(), paciente.getDireccion(), paciente.getCorreo(), paciente.getCelular(), paciente.getUsuarioWeb(), paciente.getEstado(), paciente.getIdPaciente());
    }

    public int eliminarPaciente(int id) {
        return jdbcTemplate.update("DELETE FROM Paciente WHERE idPaciente = ?", id);
    }
}
