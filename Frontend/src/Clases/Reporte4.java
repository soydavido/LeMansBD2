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
public class Reporte4 {
    
    
    private String fecha_participacion;
    
    private int id_evento;
      private  String nombre_equipo;
      private int numero_equipo;
     private  String pais_equipo;
     
       private   String nombre_piloto;
       private   String nombre2;
        private   String apellido;
        private   String apellido2;
        private   String nacionalidad;
        
        
         private String fabricante;
        private String modelo; 
        private String caracteristicas_vehiculo;
         private String categoria_vehiculo;
        
        private String tipo_vehiculo;
         
          private int posicioncarrera;
          private Double kmcarrera;
           private int vueltascarrera;
        private double velocidad_media;
        private String vuelta_rapida_carrera;
        private double diferencia;
        
        
        private int cantidad_pilotos;
        
        
 public Reporte4() {
    }

    public Reporte4(int id_evento, String nombre_equipo, int numero_equipo, String nombre_piloto, String nombre2, String apellido, String apellido2, String nacionalidad, String fabricante, String modelo, String caracteristicas_vehiculo, String categoria_vehiculo, int posicioncarrera, Double kmcarrera, int vueltascarrera, double velocidad_media, String vuelta_rapida_carrera, double diferencia) {
        this.id_evento = id_evento;
        this.nombre_equipo = nombre_equipo;
        this.numero_equipo = numero_equipo;
        this.nombre_piloto = nombre_piloto;
        this.nombre2 = nombre2;
        this.apellido = apellido;
        this.apellido2 = apellido2;
        this.nacionalidad = nacionalidad;
        this.fabricante = fabricante;
        this.modelo = modelo;
        this.caracteristicas_vehiculo = caracteristicas_vehiculo;
        this.categoria_vehiculo = categoria_vehiculo;
        this.posicioncarrera = posicioncarrera;
        this.kmcarrera = kmcarrera;
        this.vueltascarrera = vueltascarrera;
        this.velocidad_media = velocidad_media;
        this.vuelta_rapida_carrera = vuelta_rapida_carrera;
        this.diferencia = diferencia;
    }

    public Reporte4(String fecha_participacion, String nombre_equipo, int numero_equipo, String nombre_piloto, String nombre2, String apellido, String apellido2, String nacionalidad, String fabricante, String modelo, String caracteristicas_vehiculo, String categoria_vehiculo) {
        this.fecha_participacion = fecha_participacion;
        this.nombre_equipo = nombre_equipo;
        this.numero_equipo = numero_equipo;
        this.nombre_piloto = nombre_piloto;
        this.nombre2 = nombre2;
        this.apellido = apellido;
        this.apellido2 = apellido2;
        this.nacionalidad = nacionalidad;
        this.fabricante = fabricante;
        this.modelo = modelo;
        this.caracteristicas_vehiculo = caracteristicas_vehiculo;
        this.categoria_vehiculo = categoria_vehiculo;
    }

    public Reporte4(int id_evento, String nombre_equipo, int numero_equipo, String pais_equipo, String nombre_piloto, String nombre2, String apellido, String apellido2, String nacionalidad, String fabricante, String modelo, String caracteristicas_vehiculo, String categoria_vehiculo, int posicioncarrera, Double kmcarrera, int vueltascarrera, double velocidad_media, String vuelta_rapida_carrera, double diferencia, int cantidad_pilotos) {
       
        this.id_evento = id_evento;
        this.nombre_equipo = nombre_equipo;
        this.numero_equipo = numero_equipo;
        this.pais_equipo = pais_equipo;
        this.nombre_piloto = nombre_piloto;
        this.nombre2 = nombre2;
        this.apellido = apellido;
        this.apellido2 = apellido2;
        this.nacionalidad = nacionalidad;
        this.fabricante = fabricante;
        this.modelo = modelo;
        this.caracteristicas_vehiculo = caracteristicas_vehiculo;
        this.categoria_vehiculo = categoria_vehiculo;
        this.posicioncarrera = posicioncarrera;
        this.kmcarrera = kmcarrera;
        this.vueltascarrera = vueltascarrera;
        this.velocidad_media = velocidad_media;
        this.vuelta_rapida_carrera = vuelta_rapida_carrera;
        this.diferencia = diferencia;
        this.cantidad_pilotos = cantidad_pilotos;
    }
    
    
    
    //REPORTE 12
    

    public Reporte4(String nombre_equipo, int numero_equipo, String pais_equipo, String nombre_piloto, String apellido, String nacionalidad, String fabricante, String modelo, String caracteristicas_vehiculo, String categoria_vehiculo, int posicioncarrera, Double kmcarrera, int vueltascarrera, double velocidad_media, String vuelta_rapida_carrera, double diferencia, int cantidad_pilotos) {
        this.nombre_equipo = nombre_equipo;
        this.numero_equipo = numero_equipo;
        this.pais_equipo = pais_equipo;
        this.nombre_piloto = nombre_piloto;
        this.apellido = apellido;
        this.nacionalidad = nacionalidad;
        this.fabricante = fabricante;
        this.modelo = modelo;
        this.caracteristicas_vehiculo = caracteristicas_vehiculo;
        this.categoria_vehiculo = categoria_vehiculo;
        this.posicioncarrera = posicioncarrera;
        this.kmcarrera = kmcarrera;
        this.vueltascarrera = vueltascarrera;
        this.velocidad_media = velocidad_media;
        this.vuelta_rapida_carrera = vuelta_rapida_carrera;
        this.diferencia = diferencia;
        this.cantidad_pilotos = cantidad_pilotos;
    }

    public Reporte4(String fecha_participacion, String nombre_equipo, int numero_equipo, String pais_equipo, String fabricante, String modelo, String caracteristicas_vehiculo, String categoria_vehiculo, String tipo_vehiculo, double velocidad_media) {
        this.fecha_participacion = fecha_participacion;
        this.nombre_equipo = nombre_equipo;
        this.numero_equipo = numero_equipo;
        this.pais_equipo = pais_equipo;
        this.fabricante = fabricante;
        this.modelo = modelo;
        this.caracteristicas_vehiculo = caracteristicas_vehiculo;
        this.categoria_vehiculo = categoria_vehiculo;
        this.tipo_vehiculo = tipo_vehiculo;
        this.velocidad_media = velocidad_media;
    }

    public Reporte4(String fecha_participacion,String fabricante, String modelo, String caracteristicas_vehiculo, String categoria_vehiculo, String tipo_vehiculo, String nombre_equipo, int numero_equipo, String pais_equipo, double velocidad_media,String nombre_piloto, String apellido, String nacionalidad,  int cantidad_pilotos) {
        this.fecha_participacion = fecha_participacion;
        this.nombre_equipo = nombre_equipo;
        this.numero_equipo = numero_equipo;
        this.pais_equipo = pais_equipo;
        this.nombre_piloto = nombre_piloto;
        this.apellido = apellido;
        this.nacionalidad = nacionalidad;
        this.fabricante = fabricante;
        this.modelo = modelo;
        this.caracteristicas_vehiculo = caracteristicas_vehiculo;
        this.categoria_vehiculo = categoria_vehiculo;
        this.tipo_vehiculo = tipo_vehiculo;
        this.velocidad_media = velocidad_media;
        this.cantidad_pilotos = cantidad_pilotos;
    }
  
    

    public String getPais_equipo() {
        return pais_equipo;
    }

    public String getTipo_vehiculo() {
        return tipo_vehiculo;
    }

    public void setTipo_vehiculo(String tipo_vehiculo) {
        this.tipo_vehiculo = tipo_vehiculo;
    }

    public void setPais_equipo(String pais_equipo) {
        this.pais_equipo = pais_equipo;
    }

   

    public int getCantidad_pilotos() {
        return cantidad_pilotos;
    }

    public void setCantidad_pilotos(int cantidad_pilotos) {
        this.cantidad_pilotos = cantidad_pilotos;
    }

    
                  
    
    
    
    
    
    
    
    public String getFecha_participacion() {
        return fecha_participacion;
    }

    public void setFecha_participacion(String fecha_participacion) {
        this.fecha_participacion = fecha_participacion;
    }

    
    
    
    public int getId_evento() {
        return id_evento;
    }

    public void setId_evento(int id_evento) {
        this.id_evento = id_evento;
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

  /*  public String getNacionalidad_equipo() {
        return nacionalidad_equipo;
    }

    public void setNacionalidad_equipo(String nacionalidad_equipo) {
        this.nacionalidad_equipo = nacionalidad_equipo;
    }*/

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

    public String getCaracteristicas_vehiculo() {
        return caracteristicas_vehiculo;
    }

    public void setCaracteristicas_vehiculo(String caracteristicas_vehiculo) {
        this.caracteristicas_vehiculo = caracteristicas_vehiculo;
    }

    public String getCategoria_vehiculo() {
        return categoria_vehiculo;
    }

    public void setCategoria_vehiculo(String categoria_vehiculo) {
        this.categoria_vehiculo = categoria_vehiculo;
    }

   
    public int getPosicioncarrera() {
        return posicioncarrera;
    }

    public void setPosicioncarrera(int posicioncarrera) {
        this.posicioncarrera = posicioncarrera;
    }

    public Double getKmcarrera() {
        return kmcarrera;
    }

    public void setKmcarrera(Double kmcarrera) {
        this.kmcarrera = kmcarrera;
    }

    

    public int getVueltascarrera() {
        return vueltascarrera;
    }

    public void setVueltascarrera(int vueltascarrera) {
        this.vueltascarrera = vueltascarrera;
    }

    public double getVelocidad_media() {
        return velocidad_media;
    }

    public void setVelocidad_media(double velocidad_media) {
        this.velocidad_media = velocidad_media;
    }

    public String getVuelta_rapida_carrera() {
        return vuelta_rapida_carrera;
    }

    public void setVuelta_rapida_carrera(String vuelta_rapida_carrera) {
        this.vuelta_rapida_carrera = vuelta_rapida_carrera;
    }

 
   

    public double getDiferencia() {
        return diferencia;
    }

    public void setDiferencia(double diferencia) {
        this.diferencia = diferencia;
    }
  
    
    
    
    
}
