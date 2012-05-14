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
public class Salon {

    private String clave;
    
    private Horario horario;
    
    public String getClave()
    {
        return this.clave;
    }
    
    public Horario getHorario()
    {
        return this.horario;
    }
    
    public void setClave(String clave)
    {
        this.clave = clave;
    }
    
    public void setHorario(Horario horario)
    {
        this.horario = horario;
    }
}
