/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import Modelo.EstudianteBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LLancheros
 */
public class EstudianteDAO 
{
    Conexion_DB con;
    private Connection Conexion; 
    Statement st;
    
    public EstudianteDAO() 
    {
        con= new Conexion_DB();
        Conexion = con.getConexion();
        try {
            st = Conexion.createStatement();
            
        } catch (SQLException ex) {
            Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<EstudianteBean> getListaEncuestados() throws ClassNotFoundException 
    {
       ArrayList<EstudianteBean> lista = new ArrayList<>();
       
        EstudianteBean emple;
        try {
            Statement st = Conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT    AlumnosEncuesta.id,\n" +
"		  AlumnosEncuesta.nombres, \n" +
"		  AlumnosEncuesta.apellidos,\n" +
"		  universidades.universidad,\n" +
"		  AlumnosEncuesta.id_semestre, \n" +
"		  Areas.descripcion, \n" +
"		  internet.descripcion AS Expr1,\n" +
"		  AlumnosEncuesta.GastosMatricula\n" +
"		  FROM         AlumnosEncuesta \n" +
"		  inner  JOIN internet ON AlumnosEncuesta.id_internet = internet.id \n" +
"		  inner  JOIN Areas ON AlumnosEncuesta.id_area = Areas.id \n" +
"		  inner  JOIN universidades ON AlumnosEncuesta.id_universidad = universidades.id");
            while (rs.next()) 
            {
                emple = new EstudianteBean();
                emple.setId(rs.getInt(1));
                emple.setNombres(rs.getString(2));
                emple.setApellidos(rs.getString(3));
                emple.setUniversidad(rs.getString(4));
                emple.setSemestre(rs.getInt(5));
                emple.setArea(rs.getString(6));
                emple.setInternet(rs.getString(7));
                emple.setCostosPagoMatricula(rs.getInt(8));
                
                lista.add(emple);
            }
            con.Desconectar();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return lista;
    } 
    
    public boolean AgregarEncuestado(EstudianteBean us) 
    {
        boolean Error = true;
        try 
        {
            st = Conexion.createStatement();
            System.out.println("mmmm"+getLastID());
            int id=getLastID();
            st.executeUpdate("insert into AlumnosEncuesta values('" + id + "','"
                                                                    + us.getNombres() + "','"
                                                                    + us.getApellidos()+ "','"
                                                                    + us.getId_universidad()+ "','"
                                                                    + us.getSemestre()+ "','"
                                                                    + us.getId_area()+ "','"
                                                                    + us.getId_internet()+ "','"
                                                                    + us.getCostosPagoMatricula()
                                                                    + "' )");
            con.Desconectar();
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }

        return Error;
    }
    
    
     public int getLastID() 
     {
        int i=-9;
        try 
        {
            ResultSet rs=st.executeQuery("select * from AlumnosEncuesta order by id desc");
            rs.next();
            i=rs.getInt(1);
            System.out.println("rs"+rs.toString()+"--"+rs.getInt(1));
            rs.close();
        } catch (SQLException ex) {
            return -1;
        }

        return i+1;
    }

    
    
}
