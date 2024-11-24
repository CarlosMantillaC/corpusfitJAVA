/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DatabaseConnection;

/**
 *
 * @author Pc
 */
import java.sql.Date;

public class ModeloAsistenciaActividad {

    private int id_asistencia;
    private int id_miembro;
    private int id_sesion;
    private Date fecha_asistencia;
    private boolean presente;

    // Constructor vacío
    public ModeloAsistenciaActividad() {
    }

    // Constructor con parámetros
    public ModeloAsistenciaActividad(int id_asistencia, int id_miembro, int id_sesion, Date fecha_asistencia, boolean presente) {
        this.id_asistencia = id_asistencia;
        this.id_miembro = id_miembro;
        this.id_sesion = id_sesion;
        this.fecha_asistencia = fecha_asistencia;
        this.presente = presente;
    }

    // Getters y Setters
    public int getIdAsistencia() {
        return id_asistencia;
    }

    public void setIdAsistencia(int id_asistencia) {
        this.id_asistencia = id_asistencia;
    }

    public int getIdMiembro() {
        return id_miembro;
    }

    public void setIdMiembro(int id_miembro) {
        this.id_miembro = id_miembro;
    }

    public int getIdSesion() {
        return id_sesion;
    }

    public void setIdSesion(int id_sesion) {
        this.id_sesion = id_sesion;
    }

    public Date getFechaAsistencia() {
        return fecha_asistencia;
    }

    public void setFechaAsistencia(Date fecha_asistencia) {
        this.fecha_asistencia = fecha_asistencia;
    }

    public boolean isPresente() {
        return presente;
    }

    public void setPresente(boolean presente) {
        this.presente = presente;
    }

    @Override
    public String toString() {
        return "ModeloAsistenciaActividad{"
                + "id_asistencia=" + id_asistencia
                + ", id_miembro=" + id_miembro
                + ", id_sesion=" + id_sesion
                + ", fecha_asistencia=" + fecha_asistencia
                + ", presente=" + presente
                + '}';
    }
}
