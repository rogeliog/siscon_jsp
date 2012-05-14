/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package calendar.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author guillermopunzet
 */
public class MateriaDB {
    
    public static ArrayList<Materia> seleccionaMateria(String atributo, String valor)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String query = "";
        
        if ( ! atributo.contains(","))
        {
            query = "SELECT * FROM VplanesCarrera WHERE " + atributo + "='" + valor + "'";
        }
        else
        {
            String atributos[] = atributo.split(",");
            String atributo1 = atributos[0];
            String atributo2 = atributos[1];
            
            String valores[] = valor.split(",");
            String valor1 = valores[0];
            String valor2 = valores[1];
            
            query = "SELECT * FROM VplanesCarrera WHERE " + atributo1 + "='" + valor1 + "'"
                            + "AND " + atributo2 + "='" + valor2 + "'";
        }
        
        try
        {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Materia> materias = new ArrayList<Materia>();
            
            while (rs.next())
            {
                Materia materia = new Materia();
                materia.setCurso(rs.getInt("curso"));
                materia.setMateria(rs.getString("materia"));
                materia.setNombreMateria(rs.getString("nombreMateria"));
                materia.setGrupos(MateriaDB.getGrupos(materia.getMateria(), materia.getCurso()));
                materias.add(materia);
            }
            
            return materias;
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
    
    public static ArrayList<Grupo> getGrupos(String materia, int curso)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String query = "SELECT * FROM VhorariosProfesores WHERE materia='" + materia + "' AND curso='" + curso + "'";
        
        try
        {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Grupo> grupos = new ArrayList<Grupo>();
            
            while (rs.next())
            {
                Grupo g = new Grupo();
                g.setCrn(rs.getInt("CRN"));
                g.setMateria(rs.getString("materia"));
                g.setCurso(rs.getInt("curso"));
                g.setIdDepartamento(rs.getInt("idDepartamento"));
                g.setIndexUsuario(rs.getInt("indexUsuario"));
                g.setAlumnosInscritos(rs.getInt("alumnosInscritos"));
                g.setHorasLaboratorio(rs.getInt("horasLaboratorio"));
                g.setIdPeriodo(rs.getInt("idPeriodo"));
                g.setNumeroProfesores(rs.getInt("numeroProfesores"));
            }
            
            return grupos;
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
