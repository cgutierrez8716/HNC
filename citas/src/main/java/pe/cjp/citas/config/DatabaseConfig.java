package pe.cjp.citas.config;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;

@Component
public class DatabaseConfig {
  private final JdbcTemplate jdbcTemplate;

  public DatabaseConfig(DataSource dataSource) {
    this.jdbcTemplate = new JdbcTemplate(dataSource);
    verificarConexion();
  }

   private void verificarConexion() {
        try {
            int resultado = jdbcTemplate.queryForObject("SELECT 1", Integer.class);
            System.out.println("Conexión exitosa a SQL Server: " + (resultado == 1));
        } catch (Exception e) {
            System.err.println("Error al conectar a SQL Server: " + e.getMessage());
        }
    }
}
