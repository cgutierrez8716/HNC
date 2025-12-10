package pe.cjp.citas.DTO;

import java.util.Date;

public class CitaDTO {
    private int idCita;
    private String especialidad;
    private String medico;
    private String diaSemana;
    private String horario;
    private Date fechaCreacion;
    private int estado;

    public CitaDTO(int idCita, String especialidad, String medico, String diaSemana, String horario, Date fechaCreacion,
        int estado) {
      this.idCita = idCita;
      this.especialidad = especialidad;
      this.medico = medico;
      this.diaSemana = diaSemana;
      this.horario = horario;
      this.fechaCreacion = fechaCreacion;
      this.estado = estado;
    }

    public int getIdCita() {
      return idCita;
    }

    public void setIdCita(int idCita) {
      this.idCita = idCita;
    }

    public String getEspecialidad() {
      return especialidad;
    }

    public void setEspecialidad(String especialidad) {
      this.especialidad = especialidad;
    }

    public String getMedico() {
      return medico;
    }

    public void setMedico(String medico) {
      this.medico = medico;
    }

    public String getDiaSemana() {
      return diaSemana;
    }

    public void setDiaSemana(String diaSemana) {
      this.diaSemana = diaSemana;
    }

    public String getHorario() {
      return horario;
    }

    public void setHorario(String horario) {
      this.horario = horario;
    }

    public Date getFechaCreacion() {
      return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
      this.fechaCreacion = fechaCreacion;
    }

    public int getEstado() {
      return estado;
    }

    public void setEstado(int estado) {
      this.estado = estado;
    }

    
    
}
