package pe.cjp.citas.model;

public class Paciente {
    private int idPaciente;
    private String tipoDocumento;
    private String numeroDocumento;
    private String apellidos;
    private String nombres;
    private String sexo;
    private String direccion;
    private String correo;
    private String celular;
    private int usuarioWeb; // 1 = Registrado, 2 = No registrado
    private int estado;

    // Constructor vacío
    public Paciente() {}

    // Constructor con parámetros   
    public Paciente(int idPaciente, String tipoDocumento, String numeroDocumento, String apellidos, String nombres,
        String sexo, String direccion, String correo, String celular, int usuarioWeb, int estado) {
      this.idPaciente = idPaciente;
      this.tipoDocumento = tipoDocumento;
      this.numeroDocumento = numeroDocumento;
      this.apellidos = apellidos;
      this.nombres = nombres;
      this.sexo = sexo;
      this.direccion = direccion;
      this.correo = correo;
      this.celular = celular;
      this.usuarioWeb = usuarioWeb;
      this.estado = estado;
    }

    public int getIdPaciente() {
      return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
      this.idPaciente = idPaciente;
    }

    public String getTipoDocumento() {
      return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
      this.tipoDocumento = tipoDocumento;
    }

    public String getNumeroDocumento() {
      return numeroDocumento;
    }

    public void setNumeroDocumento(String numeroDocumento) {
      this.numeroDocumento = numeroDocumento;
    }

    public String getApellidos() {
      return apellidos;
    }

    public void setApellidos(String apellidos) {
      this.apellidos = apellidos;
    }

    public String getNombres() {
      return nombres;
    }

    public void setNombres(String nombres) {
      this.nombres = nombres;
    }

    public String getSexo() {
      return sexo;
    }

    public void setSexo(String sexo) {
      this.sexo = sexo;
    }

    public String getDireccion() {
      return direccion;
    }

    public void setDireccion(String direccion) {
      this.direccion = direccion;
    }

    public String getCorreo() {
      return correo;
    }

    public void setCorreo(String correo) {
      this.correo = correo;
    }

    public String getCelular() {
      return celular;
    }

    public void setCelular(String celular) {
      this.celular = celular;
    }

    public int getUsuarioWeb() {
      return usuarioWeb;
    }

    public void setUsuarioWeb(int usuarioWeb) {
      this.usuarioWeb = usuarioWeb;
    }

    public int getEstado() {
      return estado;
    }

    public void setEstado(int estado) {
      this.estado = estado;
    }

    // Getters y Setters

}
