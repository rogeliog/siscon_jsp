/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package calendar.data;

/**
 *
 * @author guillermopunzet
 */
public class Grupo {
    
    private int crn;
    
    private String materia;
    
    private int curso;
    
    private int idDepartamento;
    
    private int indexUsuario;
    
    private String nombreUsuario;
    
    private int idPeriodo;
    
    private String atributos;
    
    private int horasLaboratorio;
    
    private int unidades;
    
    private String porcentajeClase;
    
    private int numeroProfesores;
    
    private int claseExclusiva;
    
    private int alumnosInscritos;
    
    private String salon;
    
    private long fechaInicio;
    
    private long fechaFin;
    
    private String horario;
    
    public int getCrn()
    {
        return this.crn;
    }
    
    public String getMateria()
    {
        return this.materia;
    }
    
    public int getCurso()
    {
        return this.curso;
    }
    
    public int getIdDepartamento()
    {
        return this.idDepartamento;
    }
    
    public int getIndexUsuario()
    {
        return this.indexUsuario;
    }
    
    public int getIdPeriodo()
    {
        return this.idPeriodo;
    }
    
    public String getAtributos()
    {
        return this.atributos;
    }
    
    public int getHorasLaboratorio()
    {
        return this.horasLaboratorio;
    }
    
    public int getUnidades()
    {
        return this.unidades;
    }
    
    public String getPorcentajeClase()
    {
        return this.porcentajeClase;
    }
    
    public int getNumeroProfesores()
    {
        return this.numeroProfesores;
    }
    
    public int getClaseExclusiva()
    {
        return this.claseExclusiva;
    }
    
    public int getAlumnosInscritos()
    {
        return this.alumnosInscritos;
    }
    
    public String getNombreUsuario()
    {
        return this.nombreUsuario;
    }
    
    public String getSalon()
    {
        return this.salon;
    }
    
    public String getHorario()
    {
        return this.horario;
    }
    
    public void setCrn(int crn)
    {
        this.crn = crn;
    }
    
    public void setMateria(String materia)
    {
        this.materia = materia;
    }
    
    public void setCurso(int curso)
    {
        this.curso = curso;
    }
    
    public void setIdDepartamento(int idDepartamento)
    {
        this.idDepartamento = idDepartamento;
    }
    
    public void setIndexUsuario(int indexUsuario)
    {
        this.indexUsuario = indexUsuario;
    }
    
    public void setIdPeriodo(int idPeriodo)
    {
        this.idPeriodo = idPeriodo;
    }
    
    public void setAtributos(String atributos)
    {
        this.atributos = atributos;
    }
    
    public void setHorasLaboratorio(int horas)
    {
        this.horasLaboratorio = horas;
    }
    
    public void setUnidades(int unidades)
    {
        this.unidades = unidades;
    }
    
    public void setPorcentajeClase(String porcentaje)
    {
        this.porcentajeClase = porcentaje;
    }
    
    public void setNumeroProfesores(int profesores)
    {
        this.numeroProfesores = profesores;
    }
    
    public void setClaseExclusiva(int exclusiva)
    {
        this.claseExclusiva = exclusiva;
    }
    
    public void setAlumnosInscritos(int inscritos)
    {
        this.alumnosInscritos = inscritos;
    }
    
    public void setNombreUsuario(String nombre)
    {
        this.nombreUsuario = nombre;
    }
    
    public void setSalon(String salon)
    {
        this.salon = salon;
    }
    
    public void setHorario(String horario)
    {
        this.horario = horario;
    }
    
}
