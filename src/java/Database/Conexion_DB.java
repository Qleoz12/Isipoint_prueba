
package Database;


import Modelo.EstudianteBean;
import java.sql.*;
import java.util.*;


public class Conexion_DB {

    private Connection Conexion;
   

    public Connection getConexion() 
    {
        Connection mi_Conexion = null;
        try 
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            mi_Conexion = DriverManager.getConnection("jdbc:sqlserver://SOPORTE4\\SQLEXPRESS:1433;databaseName=Isipoint", "sa", "superu");
        }
        catch (ClassNotFoundException | SQLException ex) 
        {
            System.out.println(ex.getMessage());
        }
        return mi_Conexion;
    }

    

    public void Desconectar() {
        Conexion = null;
    }

    

    
    
    public ArrayList<EstudianteBean> getLista_Encuestados() 
    {
        ArrayList<EstudianteBean> lista = new ArrayList<EstudianteBean>();
        Conexion = getConexion();
        EstudianteBean emple;
        try {
            Statement st = Conexion.createStatement();
            ResultSet rs = st.executeQuery("select * from AlumnosEncuesta");
            while (rs.next()) 
            {
                emple = new EstudianteBean();
                emple.setId(rs.getInt(1));
                emple.setNombres(rs.getString(2));
                emple.setApellidos(rs.getString(3));
                emple.setId_universidad(rs.getInt(4));
                emple.setSemestre(rs.getInt(5));
                emple.setId_area(rs.getInt(6));
                emple.setId_internet(rs.getInt(7));
                emple.setCostosPagoMatricula(rs.getInt(8));
                
                lista.add(emple);
            }
            Desconectar();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return lista;
    }
   
}
