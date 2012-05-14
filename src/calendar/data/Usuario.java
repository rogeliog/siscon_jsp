/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package calendar.data;

/**
 *
 * @author guillermopunzet
 */
public class Usuario {
    private int indexUsuario;
    
    private int idDepartamento;
    
    private String idUsuario;
    
    private String nombreUsuario;
    
    private String apellidoUsuario;
    
    private int administrador;
    
    private String email;
    
    private int alta;
    
    private String password;
    
    private Horario horario;
    
    public int getIndexUsuario()
    {
        return this.indexUsuario;
    }
    
    public int getIdDepartamento()
    {
        return this.idDepartamento;
    }
    
    public String getIdUsuario()
    {
        return this.idUsuario;
    }
    
    public String getNombreUsuario()
    {
        return this.nombreUsuario;
    }
    
    public String getApellidoUsuario()
    {
        return this.apellidoUsuario;
    }
    
    public int getAdministrador()
    {
        return this.administrador;
    }
    
    public String getEmail()
    {
        return this.email;
    }
    
    public int getAlta()
    {
        return this.alta;
    }
    
    public String getPassword()
    {
        return this.password;
    } 
    
    public Horario getHorario()
    {
        return this.horario;
    }
    
    public void setIndexUsuario(int indexUsuario)
    {
        this.indexUsuario = indexUsuario;
    }
    
    public void setIdDepartamento(int idDepartamento)
    {
        this.idDepartamento = idDepartamento;
    }
    
    public void setIdUsuario(String idUsuario)
    {
        this.idUsuario = idUsuario;
    }
    
    public void setNombreUsuario(String nombreUsuario)
    {
        this.nombreUsuario = nombreUsuario;
    }
    
    public void setApellidoUsuario(String apellidoUsuario)
    {
        this.apellidoUsuario = apellidoUsuario;
    }
    
    public void setAdministrador(int administrador)
    {
        this.administrador = administrador;
    }
    
    public void setEmail(String email)
    {
        this.email = email;
    }
    
    public void setAlta(int alta)
    {
        this.alta = alta;
    }
    
    public void setPassword(String password)
    {
        this.password = password;
    }
    
    public void setHorario(Horario horario)
    {
        this.horario = horario;
    }
}
