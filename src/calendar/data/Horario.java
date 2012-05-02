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
public class Horario {
    
    private ArrayList<Actividad> actividades = new ArrayList<Actividad>();

    public ArrayList<Actividad> getActividades()
    {
        return this.actividades;
    }
    
    public void agregaActividad(Actividad a)
    {
        this.actividades.add(a);
    }
}
