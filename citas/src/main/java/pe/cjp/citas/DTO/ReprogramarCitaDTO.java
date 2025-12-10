package pe.cjp.citas.DTO;

public class ReprogramarCitaDTO {
    private int idCita;
    private int nuevaDisponibilidad;
    private String usuarioModificacion;

    // Getters y setters
    public int getIdCita() {
        return idCita;
    }

    public void setIdCita(int idCita) {
        this.idCita = idCita;
    }

    public int getNuevaDisponibilidad() {
        return nuevaDisponibilidad;
    }

    public void setNuevaDisponibilidad(int nuevaDisponibilidad) {
        this.nuevaDisponibilidad = nuevaDisponibilidad;
    }

    public String getUsuarioModificacion() {
        return usuarioModificacion;
    }

    public void setUsuarioModificacion(String usuarioModificacion) {
        this.usuarioModificacion = usuarioModificacion;
    }
}
