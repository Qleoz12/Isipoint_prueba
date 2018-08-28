
package controlador;

import Database.EstudianteDAO;

import Modelo.EstudianteBean;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class doRegistrarAlumno extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        EstudianteDAO dao= new EstudianteDAO();
        //de registracion empleado del empleado
        int Id = dao.getLastID();
        String Nombres = request.getParameter("txtNombres");
        String Apellidos = request.getParameter("txtapellidos");
        String id_universidad= request.getParameter("txtuniversidad");
        String id_semestre= request.getParameter("txtsemestre");
        String id_area= request.getParameter("txtarea");
        String id_internet= request.getParameter("txtinternet");
        String GastosMatricula= request.getParameter("txtpagos");        
                
        EstudianteBean stdnt = new EstudianteBean();
        stdnt.setId(Id);
        stdnt.setNombres(Nombres);
        stdnt.setApellidos(Apellidos);
        stdnt.setId_universidad(Integer.parseInt(id_universidad));
        stdnt.setSemestre(Integer.parseInt(id_semestre));
        stdnt.setId_area(Integer.parseInt(id_area));
        stdnt.setId_internet(Integer.parseInt(id_internet));
        stdnt.setCostosPagoMatricula(Integer.parseInt(GastosMatricula));
        
        stdnt.setApellidos(Apellidos);
        stdnt.setApellidos(Apellidos);
        
        
        System.out.println(""+stdnt.toString()); 
        System.out.println("validacion"+"---"+stdnt.Validar());
        
       if (stdnt.Validar())
       {
            
            Boolean Exito = dao.AgregarEncuestado(stdnt);
            System.out.println("exito"+"---"+Exito);
            if (Exito) 
            {
               stdnt.LimpiarErrores();
               request.getRequestDispatcher("listaEncuestados.jsp").forward(request, response);
                
            }
             //request.getRequestDispatcher("Error.jsp").forward(request, response);
        }else
       {
         request.setAttribute("alumno", stdnt);
         request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
