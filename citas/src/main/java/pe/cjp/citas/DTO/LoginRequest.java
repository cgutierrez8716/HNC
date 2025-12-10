package pe.cjp.citas.DTO;

public class LoginRequest {
    private String nombreCompleto;
    private String clave;
    
    public String getNombreCompleto() {
      return nombreCompleto;
    }
    public void setNombreCompleto(String nombreCompleto) {
      this.nombreCompleto = nombreCompleto;
    }
    public String getClave() {
      return clave;
    }
    public void setClave(String clave) {
      this.clave = clave;
    }

    
}
