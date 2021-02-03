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
public class Reporte11 {
    
   
      private  String nombre_equipo;
      private int numero_equipo;
   private  String nacionalidad;
     
      
        
         private String fabricante;
        private String modelo; 
       
        private double velocidad_media;
       
        
 public Reporte11() {
    }

    public Reporte11(String nombre_equipo, int numero_equipo, String fabricante, String modelo, double velocidad_media) {
        this.nombre_equipo = nombre_equipo;
        this.numero_equipo = numero_equipo;
        this.fabricante = fabricante;
        this.modelo = modelo;
        this.velocidad_media = velocidad_media;
    }

    public Reporte11(String nombre_equipo, int numero_equipo, String nacionalidad, String fabricante, String modelo, double velocidad_media) {
        this.nombre_equipo = nombre_equipo;
        this.numero_equipo = numero_equipo;
        this.nacionalidad = nacionalidad;
        this.fabricante = fabricante;
        this.modelo = modelo;
        this.velocidad_media = velocidad_media;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

   

   

    public String getNombre_equipo() {
        return nombre_equipo;
    }

    public void setNombre_equipo(String nombre_equipo) {
        this.nombre_equipo = nombre_equipo;
    }

    public int getNumero_equipo() {
        return numero_equipo;
    }

    public void setNumero_equipo(int numero_equipo) {
        this.numero_equipo = numero_equipo;
    }

    public String getFabricante() {
        return fabricante;
    }

    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

   

    public double getVelocidad_media() {
        return velocidad_media;
    }

    public void setVelocidad_media(double velocidad_media) {
        this.velocidad_media = velocidad_media;
    }

   
    
    
    
    
}
