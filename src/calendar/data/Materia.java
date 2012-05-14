/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package calendar.data;

import java.util.ArrayList;

/**
 *
 * @author guillermopunzet
 */
public class Materia {
    
    private String materia;
    
    private int curso;
    
    private String nombreMateria;
    
    private ArrayList<Grupo> grupos = new ArrayList<Grupo>();
    
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
    
    public ArrayList<Grupo> getGrupos()
    {
        return this.grupos;
    }
    
    public void setMateria(String m)
    {
        this.materia = m;
    }
    
    public void setCurso(int curso)
    {
        this.curso = curso;
    }
    
    public void setNombreMateria(String n)
    {
        this.nombreMateria = n;
    }
    
    public void setGrupos(ArrayList<Grupo> g)
    {
        this.grupos = g;
    }
}
