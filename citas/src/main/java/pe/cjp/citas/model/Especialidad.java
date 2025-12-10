package pe.cjp.citas.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "especialidades")
public class Especialidad {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Esto genera un valor 
    private int idEspecialidad;

    private String nombre;
    private String descripcion;
    private int estado;
    
    
    public int getIdEspecialidad() 
    {
      return idEspecialidad;
    }
    public void setIdEspecialidad(int idEspecialidad) {
      this.idEspecialidad = idEspecialidad;
    }
    public String getNombre() {
      return nombre;
    }
    public void setNombre(String nombre) {
      this.nombre = nombre;
    }
    public String getDescripcion() {
      return descripcion;
    }
    public void setDescripcion(String descripcion) {
      this.descripcion = descripcion;
    }
    public int getEstado() {
      return estado;
    }
    public void setEstado(int estado) {
      this.estado = estado;
    }

    
}
