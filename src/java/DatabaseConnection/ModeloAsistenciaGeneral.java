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
import java.sql.Time;

public class ModeloAsistenciaGeneral {
    private int id_asistencia;
    private int id_miembro;
    private Date fecha_asistencia;
    private Time hora_entrada;
    private Time hora_salida;
    
    // Constructor vacío
    public ModeloAsistenciaGeneral() {
    }
    
    // Constructor con parámetros
    public ModeloAsistenciaGeneral(int id_asistencia, int id_miembro, Date fecha_asistencia, Time hora_entrada, Time hora_salida) {
        this.id_asistencia = id_asistencia;
        this.id_miembro = id_miembro;
        this.fecha_asistencia = fecha_asistencia;
        this.hora_entrada = hora_entrada;
        this.hora_salida = hora_salida;
    }
    
    // Getters y Setters
    public int getId_asistencia() {
        return id_asistencia;
    }

    public void setId_asistencia(int id_asistencia) {
        this.id_asistencia = id_asistencia;
    }

    public int getId_miembro() {
        return id_miembro;
    }

    public void setId_miembro(int id_miembro) {
        this.id_miembro = id_miembro;
    }

    public Date getFecha_asistencia() {
        return fecha_asistencia;
    }

    public void setFecha_asistencia(Date fecha_asistencia) {
        this.fecha_asistencia = fecha_asistencia;
    }

    public Time getHora_entrada() {
        return hora_entrada;
    }

    public void setHora_entrada(Time hora_entrada) {
        this.hora_entrada = hora_entrada;
    }

    public Time getHora_salida() {
        return hora_salida;
    }

    public void setHora_salida(Time hora_salida) {
        this.hora_salida = hora_salida;
    }
    
    @Override
    public String toString() {
        return "ModeloAsistenciaGeneral{" + 
               "id_asistencia=" + id_asistencia + 
               ", id_miembro=" + id_miembro + 
               ", fecha_asistencia=" + fecha_asistencia + 
               ", hora_entrada=" + hora_entrada + 
               ", hora_salida=" + hora_salida + 
               '}';
    }
}