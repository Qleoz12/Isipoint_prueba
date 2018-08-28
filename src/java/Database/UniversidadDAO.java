/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import Modelo.EstudianteBean;
import Modelo.UniversidadBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author LLancheros
 */
public class UniversidadDAO 
{
    Conexion_DB con;
    private Connection Conexion; 
    Statement st=null;
    
    public UniversidadDAO() throws SQLException 
    {
        con= new Conexion_DB();
        Conexion = con.getConexion();
        st = Conexion.createStatement();
    }
    
    public ArrayList<UniversidadBean> getListaUniversidades() throws ClassNotFoundException 
    {
       ArrayList<UniversidadBean> lista = new ArrayList<UniversidadBean>();
       
        UniversidadBean u;
        try {
            Statement st = Conexion.createStatement();
            ResultSet rs = st.executeQuery("select * from universidades");
            while (rs.next()) 
            {
                u = new UniversidadBean();
                u.setId(rs.getInt(1));
                u.setDescripcion(rs.getString(2));
                u.setTipo(rs.getString(3));
                
                lista.add(u);
            }
            con.Desconectar();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return lista;
    } 
    
    
    

    
    
}
