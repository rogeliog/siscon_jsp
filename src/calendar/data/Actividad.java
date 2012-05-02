/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package calendar.data;

import java.util.Date;

/**
 *
 * @author guillermopunzet
 */
public class Actividad {
    
    private String materia;
    
    private int curso;
    
    private String nombreMateria;
    
    private String nombreUsuario;
    
    private String apellidoUsuario;
    
    private long fechaInicio;
    
    private long fechaFin;
    
    private String salon;
    
    private String periodo;
    
    private int anio;
    
    public String getMateria()
    {
        return this.materia;
    }
    
    public int getCurso()
    {
        return this.curso;
    }
    
    public String getNombreMateria()
    {
        return this.nombreMateria;
    }
    
    public String getNombreUsuario()
    {
        return this.nombreUsuario;
    }
    
    public String getApellidoUsuario()
    {
        return this.apellidoUsuario;
    }
    
    public long getFechaInicio()
    {
        return this.fechaInicio;
    }
    
    public long getFechaFin()
    {
        return this.fechaFin;
    }
    
    public String getSalon()
    {
        return this.salon;
    }
    
    public String getPeriodo()
    {
        return this.periodo;
    }
    
    public int getAnio()
    {
        return this.anio;
    }
    
    public void setMateria(String materia)
    {
        this.materia = materia;
    }
    
    public void setCurso(int curso)
    {
        this.curso = curso;
    }
    
    public void setNombreMateria(String nombre)
    {
        this.nombreMateria = nombre;
    }
    
    public void setNombreUsuario(String nombre)
    {
        this.nombreUsuario = nombre;
    }
    
    public void setApellidoUsuario(String apellido)
    {
        this.apellidoUsuario = apellido;
    }
    
    public void setFechaInicio(long fecha)
    {
        this.fechaInicio = fecha;
    }
    
    public void setFechaFin(long fecha)
    {
        this.fechaFin = fecha;
    }
    
    public void setSalon(String salon)
    {
        this.salon = salon;
    }
    
    public void setPeriodo(String periodo)
    {
        this.setPeriodo(periodo);
    }
    
    public void setAnio(int a)
    {
        this.anio = a;
    }
    
}
