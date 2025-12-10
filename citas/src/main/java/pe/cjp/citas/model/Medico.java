package pe.cjp.citas.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "medicos")
public class Medico {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Esto genera un valor automáticamente
    private int idMedico;
    
    private String tipoDocumento;
    private String numeroDocumento;
    private String apellidos;
    private String nombres;
    private int idEspecialidad;
    private String sexo;
    private String direccion;
    private String celular;
    private byte estado;
    
    public Medico() {
    }

    public Medico(int idMedico, String tipoDocumento, String numeroDocumento, String apellidos, String nombres,
        int idEspecialidad, String sexo, String direccion, String celular, byte estado) {
      this.idMedico = idMedico;
      this.tipoDocumento = tipoDocumento;
      this.numeroDocumento = numeroDocumento;
      this.apellidos = apellidos;
      this.nombres = nombres;
      this.idEspecialidad = idEspecialidad;
      this.sexo = sexo;
      this.direccion = direccion;
      this.celular = celular;
      this.estado = estado;
    }

    public int getIdMedico() {
      return idMedico;
    }

    public void setIdMedico(int idMedico) {
      this.idMedico = idMedico;
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

    public int getIdEspecialidad() {
      return idEspecialidad;
    }

    public void setIdEspecialidad(int idEspecialidad) {
      this.idEspecialidad = idEspecialidad;
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

    public String getCelular() {
      return celular;
    }

    public void setCelular(String celular) {
      this.celular = celular;
    }

    public byte getEstado() {
      return estado;
    }

    public void setEstado(byte estado) {
      this.estado = estado;
    }
    
}
