package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class bd
 */
@WebServlet("/bd")
public class bd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nombre = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/SISCON";
            Connection con = (Connection) DriverManager.getConnection(url,"root", "");
            Statement myStmt = (Statement) con.createStatement();
            ResultSet res = (ResultSet) myStmt.executeQuery("SELECT NombreUsuario FROM Usuario where idUsuario='L00215087'");
            while(res.next()){
            	nombre = res.getString(1);
            }

	    }
	    catch(Exception e){
	           System.out.println("Error en la base de datos");
	           System.out.println(e);
	    }
         
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String title = "Prueba parametros";
		String doctype = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\n";
		out.println(doctype + 
				"<HTML>\n" +
                "<HEAD><TITLE>" + title + "</TITLE></HEAD>\n" +
                "<BODY BGCOLOR=\"#FDF5E6\">\n" +
                "<H1 ALIGN=\"CENTER\">" + title + "</H1>\n" +
                "<UL>\n" +
                "  <LI><B>User</B>: "
                + request.getParameter("usuario") + "\n" +
                "  <LI><B>Password</B>: "
                + request.getParameter("pswd") + "\n" +
                "  <LI><B>Nombre</B>: "
                + nombre + "\n" +
                "</UL>\n" +
                "</BODY></HTML>");
	}

}
