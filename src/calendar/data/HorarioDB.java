package calendar.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author guillermopunzet
 */
public class HorarioDB
{ 
    private static enum Dia
    {
        Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo;
    }
    
    private static int getDia(String dia)
    {
        switch (Dia.valueOf(dia))
        {
            case Domingo:
                return 1;
            case Lunes:
                return 2;
            case Martes:
                return 3;
            case Miercoles:
                return 4;
            case Jueves:
                return 5;
            case Viernes:
                return 6;
            case Sabado:
                return 7;
        }
        
        return 0;
    }
    public static Horario getHorarioProfesor(String idUsuario)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String query = "SELECT * FROM VhorariosProfesores WHERE idUsuario='" + idUsuario + "'";
        
        try
        {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            
            // genera Horario vacio
            Horario horario = new Horario();
            
            while (rs.next())
            {
                Actividad actividad = new Actividad();
                actividad.setMateria(rs.getString("materia"));
                actividad.setCurso(rs.getInt("curso"));
                actividad.setNombreMateria(rs.getString("nombreMateria"));
                
                Calendar cal = Calendar.getInstance();
                cal.set(Calendar.DAY_OF_WEEK, getDia(rs.getString("diaSemana")));
                int mes = cal.get(Calendar.MONTH) + 1;
                int dia = cal.get(Calendar.DATE);
                String date = 2012 + "/" + mes + "/" + dia;
                Date utilDate = null;

                try {
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
                    utilDate = formatter.parse(date);
                } catch (ParseException e) {
                    System.out.println(e.toString());
                    e.printStackTrace();
                }
                
                String horaInicio = rs.getString("horaInicio");
                String temp[] = horaInicio.split(":");
                
                int horaDeInicio = Integer.parseInt(temp[0]) - 1;
                int minutoDeInicio = Integer.parseInt(temp[1]);
                
                cal.setTime(utilDate);
                cal.set(Calendar.HOUR_OF_DAY, horaDeInicio);
                cal.set(Calendar.MINUTE, minutoDeInicio);
                cal.set(Calendar.SECOND, 0);
                cal.set(Calendar.MILLISECOND, 0);
                
                
                utilDate = cal.getTime();
                long iniciomillis = utilDate.getTime();
                
                String horaFin = rs.getString("horaFin");
                String tempFin[] = horaFin.split(":");
                
                int horaDeFin = Integer.parseInt(temp[0]);
                int minutoDeFin = Integer.parseInt(temp[1]);
                
                int millisfin = ((horaDeFin - horaDeInicio) * 60 * 60 * 1000) + (30 * 60 * 1000);
                
                actividad.setFechaInicio(iniciomillis);
                actividad.setFechaFin(iniciomillis + millisfin);
                actividad.setSalon(rs.getString("salon"));
                actividad.setNombreUsuario(rs.getString("nombreUsuario"));
                actividad.setApellidoUsuario(rs.getString("apellidoUsuario"));
                
                horario.agregaActividad(actividad);
            }
            
            query = "SELECT * FROM VactividadesProfesores WHERE idUsuario='" + idUsuario + "'";
            
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next())
            {
                Actividad actividad = new Actividad();
                actividad.setMateria("HDW");
                actividad.setCurso(0);
                actividad.setNombreMateria(rs.getString("actividad"));
                
                Calendar cal = Calendar.getInstance();
                cal.set(Calendar.DAY_OF_WEEK, getDia(rs.getString("diaSemana")));
                int mes = cal.get(Calendar.MONTH) + 1;
                int dia = cal.get(Calendar.DATE);
                String date = 2012 + "/" + mes + "/" + dia;
                Date utilDate = null;

                try {
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
                    utilDate = formatter.parse(date);
                } catch (ParseException e) {
                    System.out.println(e.toString());
                }
                
                String horaInicio = rs.getString("horaInicio");
                String temp[] = horaInicio.split(":");
                
                int horaDeInicio = Integer.parseInt(temp[0]) - 1;
                int minutoDeInicio = Integer.parseInt(temp[1]);
                
                cal.setTime(utilDate);
                cal.set(Calendar.HOUR_OF_DAY, horaDeInicio);
                cal.set(Calendar.MINUTE, minutoDeInicio);
                cal.set(Calendar.SECOND, 0);
                cal.set(Calendar.MILLISECOND, 0);
                
                
                utilDate = cal.getTime();
                long iniciomillis = utilDate.getTime();
                
                String horaFin = rs.getString("horaFin");
                String tempFin[] = horaFin.split(":");
                
                int horaDeFin = Integer.parseInt(temp[0]);
                int minutoDeFin = Integer.parseInt(temp[1]);
                
                int millisfin = horaDeInicio + rs.getInt("duracion") * 60 * 60 * 1000;
                
                actividad.setFechaInicio(iniciomillis);
                actividad.setFechaFin(iniciomillis + millisfin);
                actividad.setSalon("");
                actividad.setNombreUsuario("");
                actividad.setApellidoUsuario("");
                
                horario.agregaActividad(actividad);
            }
            
            return horario;
        }
        catch (SQLException e)
        {
            return null;
        }
        finally
        {
            pool.freeConnection(connection);
        }
    }
}
