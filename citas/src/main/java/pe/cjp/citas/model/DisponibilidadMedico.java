package pe.cjp.citas.model;

import java.time.LocalTime;
import java.util.Date;

public class DisponibilidadMedico {
    private int idDisponibilidad;
    private int idMedico;
    private String diaSemana;
    private LocalTime horaInicio;
    private LocalTime horaFin;
    private LocalTime horaInicioBloque;
    private LocalTime horaFinBloque;    
    private int estado;
    private Date fechaCreacion;
    private Date fechaModificacion;
    private String usuarioModificacion;
    
    public int getIdDisponibilidad() {
      return idDisponibilidad;
    }
    public void setIdDisponibilidad(int idDisponibilidad) {
      this.idDisponibilidad = idDisponibilidad;
    }
    public int getIdMedico() {
      return idMedico;
    }
    public void setIdMedico(int idMedico) {
      this.idMedico = idMedico;
    }
    public String getDiaSemana() {
      return diaSemana;
    }
    public void setDiaSemana(String diaSemana) {
      this.diaSemana = diaSemana;
    }
    public LocalTime getHoraInicio() {
      return horaInicio;
    }
    public void setHoraInicio(LocalTime horaInicio) {
      this.horaInicio = horaInicio;
    }
    public LocalTime getHoraFin() {
      return horaFin;
    }
    public void setHoraFin(LocalTime horaFin) {
      this.horaFin = horaFin;
    }
    public LocalTime getHoraInicioBloque() {
      return horaInicioBloque;
    }
    public void setHoraInicioBloque(LocalTime horaInicioBloque) {
      this.horaInicioBloque = horaInicioBloque;
    }
    public LocalTime getHoraFinBloque() {
      return horaFinBloque;
    }
    public void setHoraFinBloque(LocalTime horaFinBloque) {
      this.horaFinBloque = horaFinBloque;
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
