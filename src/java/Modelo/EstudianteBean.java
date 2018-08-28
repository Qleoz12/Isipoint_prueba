/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.ArrayList;

/**
 *
 * @author LLancheros
 */
public class EstudianteBean 
{
    int id;
    String nombres;
    String apellidos;
    int id_universidad;
    String universidad;
    int semestre;
    int id_internet;
    String internet;
    int id_area;
    String area;
    int costosPagoMatricula;
    
     private ArrayList<String> Error;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public int getId_universidad() {
        return id_universidad;
    }

    public void setId_universidad(int id_universidad) {
        this.id_universidad = id_universidad;
    }

    public String getUniversidad() {
        return universidad;
    }

    public void setUniversidad(String universidad) {
        this.universidad = universidad;
    }

    public int getSemestre() {
        return semestre;
    }

    public void setSemestre(int semestre) {
        this.semestre = semestre;
    }

    public int getId_internet() {
        return id_internet;
    }

    public void setId_internet(int id_internet) {
        this.id_internet = id_internet;
    }

    public String getInternet() {
        return internet;
    }

    public void setInternet(String internet) {
        this.internet = internet;
    }

    public int getId_area() {
        return id_area;
    }

    public void setId_area(int id_area) {
        this.id_area = id_area;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public int getCostosPagoMatricula() {
        return costosPagoMatricula;
    }

    public void setCostosPagoMatricula(int costosPagoMatricula) {
        this.costosPagoMatricula = costosPagoMatricula;
    }

    public ArrayList<String> getError() {
        return Error;
    }

    public void setError(ArrayList<String> Error) {
        this.Error = Error;
    }

   
    
    public EstudianteBean()
    {
        Error= new ArrayList<String>();
        id_universidad=-1;
        semestre=-1;
        id_area=-1;
        id_internet=-1;
        costosPagoMatricula=-1;
    }
    
    
    public boolean Validar() {
        boolean Valido = true;
        if (id<0) {
            Valido = false;
            Error.add("El Id del empleado es oblidatorio");
        }
        if (nombres.isEmpty()) 
        {
            Valido = false;
            Error.add("no tiene nombres del empleado es oblidatorio");
        }
        if (id_universidad<0) 
        {
            Valido = false;
            Error.add("no tiene universidad asignada es oblidatorio");
        } else {
        }
        if (semestre<0) 
        {
            Valido = false;
            Error.add("no tiene semestre es oblidatorio");
        }
        if (id_area<0) 
        {
            Valido = false;
            Error.add("no tiene area asignada es oblidatorio");
        }
        if (id_internet<0) 
        {
            Valido = false;
            Error.add("no tiene tipo de internet asigano es obligatorio");
        }
       
        return Valido;
    }
    
    public void LimpiarErrores() {
        Error.clear();
    }
    public ArrayList<String> getErrores()
    {
    return Error;
    }

    @Override
    public String toString() {
        return "EstudianteBean{" + "id=" + id + ", nombres=" + nombres + ", apellidos=" + apellidos + ", id_universidad=" + id_universidad + ", semestre=" + semestre + ", id_internet=" + id_internet + ", id_area=" + id_area + ", costosPagoMatricula=" + costosPagoMatricula + ", Error=" + Error + '}';
    }
    
    
    
    
}
