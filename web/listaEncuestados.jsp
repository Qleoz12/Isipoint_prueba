<%-- 
    Document   : listaEncuestados
    Created on : 21/08/2018, 01:44:37 PM
    Author     : LLancheros
--%>

<%@page import="Modelo.EstudianteBean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width = device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <jsp:useBean id="ConexionDB" class="Database.Conexion_DB" scope="page"/>
        <jsp:useBean  id="EstudianteDAO" class="Database.EstudianteDAO" scope="page"/>
        <title>Sistema web</title>
    </head>
     <body >
        
        <div class="container">
           
           <div id="row"  >
               <h1>Lista Encuestados</h1>
                <table class="table">
                    <thead>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Universidad</th>
                        <th>Semestre</th>
                        <th>Area</th>
                        <th>Internet</th>
                        <th>Costo de pago de Matricula</th>
                </thead>
                    <%
                        ArrayList<EstudianteBean> lista = EstudianteDAO.getListaEncuestados();
                        for (EstudianteBean stdnt : lista) {
                            out.println("<tr>");
                            out.println("<td>" + stdnt.getNombres() + "</td>");
                            out.println("<td>" + stdnt.getApellidos()+ "</td>");
                            out.println("<td>" + stdnt.getUniversidad()+ "</td>");
                            out.println("<td>" + stdnt.getSemestre()+ "</td>");
                            out.println("<td>" + stdnt.getArea()+ "</td>");
                            out.println("<td>" + stdnt.getInternet()+ "</td>");
                            out.println("<td>" + stdnt.getCostosPagoMatricula()+ "</td>");
                            out.println("</tr>");
                        }
                    %>

                </table>

            </div>
              <button type="button" class="btn btn-primary btn-lg "><a href="index.jsp" class="text-light">volver</a></button>              
        </div>
       
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>               
    </body>
</html>
