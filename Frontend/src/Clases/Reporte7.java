/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.Time;

/**
 *
 * @author Carlos
 */
public class Reporte7 {
    
    
     private String anho;
       private   String nombre_piloto;
       private   String nombre2;
        private   String apellido;
        private   String apellido2;
        private   String nacionalidad;
        private String edad;
        
        
        private int numero_participaciones;
        
    
        
 public Reporte7() {
    }

    public Reporte7(String nombre_piloto, String nombre2, String apellido, String apellido2, String nacionalidad, String edad) {
        this.nombre_piloto = nombre_piloto;
        this.nombre2 = nombre2;
        this.apellido = apellido;
        this.apellido2 = apellido2;
        this.nacionalidad = nacionalidad;
        this.edad = edad;
    }

    public Reporte7(String nombre_piloto, String nombre2, String apellido, String apellido2, String nacionalidad) {
        this.nombre_piloto = nombre_piloto;
        this.nombre2 = nombre2;
        this.apellido = apellido;
        this.apellido2 = apellido2;
        this.nacionalidad = nacionalidad;
    }

    public Reporte7(String nombre_piloto, String nombre2, String apellido, String apellido2, String nacionalidad, int numero_participaciones) {
        this.nombre_piloto = nombre_piloto;
        this.nombre2 = nombre2;
        this.apellido = apellido;
        this.apellido2 = apellido2;
        this.nacionalidad = nacionalidad;
        this.numero_participaciones = numero_participaciones;
    }

    public Reporte7(String nombre_piloto, String apellido, String nacionalidad, int numero_participaciones) {
        this.nombre_piloto = nombre_piloto;
        this.apellido = apellido;
        this.nacionalidad = nacionalidad;
        this.numero_participaciones = numero_participaciones;
    }

    public Reporte7(String anho, String nombre_piloto, String apellido, String nacionalidad) {
        this.anho = anho;
        this.nombre_piloto = nombre_piloto;
        this.apellido = apellido;
        this.nacionalidad = nacionalidad;
    }

    
    
    
    
    
    public String getAnho() {
        return anho;
    }

    public void setAnho(String anho) {
        this.anho = anho;
    }

    
    
    
    
    public int getNumero_participaciones() {
        return numero_participaciones;
    }

    public void setNumero_participaciones(int numero_participaciones) {
        this.numero_participaciones = numero_participaciones;
    }
    
    

    public String getNombre_piloto() {
        return nombre_piloto;
    }

    public void setNombre_piloto(String nombre_piloto) {
        this.nombre_piloto = nombre_piloto;
    }

    public String getNombre2() {
        return nombre2;
    }

    public void setNombre2(String nombre2) {
        this.nombre2 = nombre2;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getEdad() {
        return edad;
    }

    public void setEdad(String edad) {
        this.edad = edad;
    }

  
    
    
}
