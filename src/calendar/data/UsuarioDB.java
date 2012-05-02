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
public class UsuarioDB
{
    public static Usuario seleccionaUsuarioPorId(int indexUsuario)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String query = "SELECT * FROM Usuario WHERE indexUsuario='" +
                indexUsuario + "'";
        
        try
        {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            Usuario usuario = new Usuario();
            String idUsuario = "";
            
            while (rs.next())
            {
                usuario.setIndexUsuario(rs.getInt("indexUsuario"));
                usuario.setIdDepartamento(rs.getInt("idDepartamento"));
                usuario.setIdUsuario(rs.getString("idUsuario"));
                usuario.setNombreUsuario(rs.getString("nombreUsuario"));
                usuario.setEmail(rs.getString("email"));
                
                idUsuario = rs.getString("idUsuario");
                
            }
            
            return usuario;
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
    
    public static ArrayList<Usuario> seleccionaUsuario(String atributo, String valor)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String query = "SELECT * FROM Usuario WHERE " + atributo + " LIKE '%" + valor
                + "%'";
        
        try
        {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
            
            while (rs.next())
            {
                Usuario usuario = new Usuario();
                usuario.setIndexUsuario(rs.getInt("indexUsuario"));
                usuario.setIdDepartamento(rs.getInt("idDepartamento"));
                usuario.setIdUsuario(rs.getString("idUsuario"));
                usuario.setNombreUsuario(rs.getString("nombreUsuario"));
                usuario.setEmail(rs.getString("email"));
                usuarios.add(usuario);
            }
            
            return usuarios;
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
