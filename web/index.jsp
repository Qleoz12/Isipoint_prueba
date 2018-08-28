<%@page import="Modelo.InternetBean"%>
<%@page import="Modelo.AreasBean"%>
<%@page import="Modelo.UniversidadBean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
       <jsp:useBean  id="UniversidadDAO" class="Database.UniversidadDAO" scope="page"/>  
       <jsp:useBean  id="AreasDAO" class="Database.AreasDAO" scope="page"/>
       <jsp:useBean  id="InternetDAO" class="Database.InternetDAO" scope="page"/>
        <jsp:useBean id="alumno" class="Modelo.EstudianteBean" scope="request"/>
      <div class="container">
          
          <a href="listaEncuestados.jsp">listado</a>
          <h1>
              Encuesta para APP
          </h1>
           <%
                    if (!alumno.getErrores().isEmpty()) 
                    {
                        out.println("<center><h2 id=\"Advertencia\">----Atención---</h2></center>");
                        out.println("<ul>");
                        for (String str : alumno.getErrores()) {
                %>
            <li> <%= str%> </li>
                    <%
                            }
                            out.println("</ul>");
                        }
                    %>
          <form action="doRegistrarAlumno" method="post">
            <div class="form-row">
              <div class="form-group col-md-6">
                <label >Nombres</label>
                <input type="text" class="form-control" name="txtNombres" placeholder="Nombres">
              </div>
              <div class="form-group col-md-6">
                <label >Apelidos</label>
                <input type="text" class="form-control" name="txtapellidos"  placeholder="apellidos">
              </div>
            </div>
            <div class="form-group">
              <label >Universidad</label>
              <select class="form-control" name="txtuniversidad">
              <option selected>...</option>
               <%
                        ArrayList<UniversidadBean> lista = UniversidadDAO.getListaUniversidades();
                        for (UniversidadBean uni : lista) 
                        {
                            out.println("<option   value="+uni.getId()+">"+uni.getDescripcion()+"</option>");
                        }
                    %>
                </select>
            </div>
            
            <div class="form-group ">
            <label >Semestre</label>
            <select class="form-control" name="txtsemestre">
            <option selected>...</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
                <option>10</option>
            </select>
            </div>
                
             <div class="form-group ">
            <label >Area</label>
            <select class="form-control" name="txtarea">
            <option selected>...</option>
                <%
                        ArrayList<AreasBean> listaareas = AreasDAO.getListaAreas();
                        for (AreasBean uni : listaareas) 
                        {
                            out.println("<option value="+uni.getId()+">"+uni.getDescripcion()+"</tr>");
                        }
                    %>
                
            </select>
            </div>
                
            <div class="form-group ">
            <label >tiene Internet en su sitio de vivienda?</label>
            <select class="form-control" name="txtinternet">
            <option selected>...</option>
             <%
                        ArrayList<InternetBean> listainternet = InternetDAO.getListaInternet();
                        for (InternetBean inte : listainternet) 
                        {
                            out.println("<option value="+inte.getId()+">"+inte.getDescripcion()+"</tr>");
                        }
                    %>
            </select>
            </div>
                
            <div class="form-group">
              <label >Costos de trasporte al realizar pagos de la universidad</label>
              <input type="text" class="form-control"  placeholder="$" name="txtpagos">

            </div>    
            <button type="submit" class="btn btn-primary">Terminar encuesta</button>
          </form>
              
        
      </div>
             
      
        
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
