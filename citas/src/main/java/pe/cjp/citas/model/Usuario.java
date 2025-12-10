package pe.cjp.citas.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "usuarios")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Esto genera un valor automáticamente
    private int idUsuario;
    
    private int idPaciente;
    private String nombreCompleto;
    private String clave;
    private int estado;
    private String fechaCreacion;
    private String fechaModificacion;
    private String usuarioModificacion;

    // Constructor vacío
    public Usuario() {}

    // Constructor con parámetros
    public Usuario(int idUsuario, int idPaciente, String nombreCompleto, String clave, int estado, String fechaCreacion, String fechaModificacion, String usuarioModificacion) {
        this.idUsuario = idUsuario;
        this.idPaciente = idPaciente;
        this.nombreCompleto = nombreCompleto;
        this.clave = clave;
        this.estado = estado;
        this.fechaCreacion = fechaCreacion;
        this.fechaModificacion = fechaModificacion;
        this.usuarioModificacion = usuarioModificacion;
    }

    // Getters y Setters
    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }

    public int getIdPaciente() { return idPaciente; }
    public void setIdPaciente(int idPaciente) {this.idPaciente = idPaciente;}

    public String getNombreCompleto() { return nombreCompleto; }
    public void setNombreCompleto(String nombreCompleto) { this.nombreCompleto = nombreCompleto; }

    public String getClave() { return clave; }
    public void setClave(String clave) { this.clave = clave; }

    public int getEstado() { return estado; }
    public void setEstado(int estado) { this.estado = estado; }

    public String getFechaCreacion() { return fechaCreacion; }
    public void setFechaCreacion(String fechaCreacion) { this.fechaCreacion = fechaCreacion; }

    public String getFechaModificacion() { return fechaModificacion; }
    public void setFechaModificacion(String fechaModificacion) { this.fechaModificacion = fechaModificacion; }

    public String getUsuarioModificacion() { return usuarioModificacion; }
    public void setUsuarioModificacion(String usuarioModificacion) { this.usuarioModificacion = usuarioModificacion; }
}