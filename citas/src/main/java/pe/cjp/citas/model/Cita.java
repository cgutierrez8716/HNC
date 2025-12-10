package pe.cjp.citas.model;

import java.util.Date;

public class Cita {
    private int idCita;
    private int idPaciente;
    private int idDisponibilidad;
    private int idEspecialidad;
    private String descripcion;
    private int idMedico;
    private int estado; // 1 = Activa, 2 = Cancelada, 3 = Reprogramada
    private Date fechaCreacion;
    private Date fechaModificacion;
    private Date fechaCita;
    private String usuarioModificacion;

    public int getIdCita() {
      return idCita;
    }
    public void setIdCita(int idCita) {
      this.idCita = idCita;
    }
    public int getIdPaciente() {
      return idPaciente;
    }
    public void setIdPaciente(int idPaciente) {
      this.idPaciente = idPaciente;
    }
    public int getIdDisponibilidad() {
      return idDisponibilidad;
    }
    public void setIdDisponibilidad(int idDisponibilidad) {
      this.idDisponibilidad = idDisponibilidad;
    }
    public int getIdEspecialidad() {
      return idEspecialidad;
    }
    public void setIdEspecialidad(int idEspecialidad) {
      this.idEspecialidad = idEspecialidad;
    }
    public String getDescripcion() {
      return descripcion;
    }
    public void setDescripcion(String descripcion) {
      this.descripcion = descripcion;
    }
    public int getIdMedico() {
      return idMedico;
    }
    public void setIdMedico(int idMedico) {
      this.idMedico = idMedico;
    }
    public int getEstado() {
      return estado;
    }
    public void setEstado(int estado) {
      this.estado = estado;
    }
    public Date getFechaCreacion() {
      return fechaCreacion;
    }
    public void setFechaCreacion(Date fechaCreacion) {
      this.fechaCreacion = fechaCreacion;
    }
    public Date getFechaCita() {
      return fechaCita;
    }
    public void setFechaCita(Date fechaCita) {
      this.fechaCita = fechaCita;
    }
    public Date getFechaModificacion() {
      return fechaModificacion;
    }
    public void setFechaModificacion(Date fechaModificacion) {
      this.fechaModificacion = fechaModificacion;
    }
    public String getUsuarioModificacion() {
      return usuarioModificacion;
    }
    public void setUsuarioModificacion(String usuarioModificacion) {
      this.usuarioModificacion = usuarioModificacion;
    }
    

    
}
