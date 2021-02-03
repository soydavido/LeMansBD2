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
public class Reporte16 {
    
       private   String nombre_piloto;
       private   String apellido;
   
       private String fecha_nacimiento;
     //  private String lugar_nacimiento;
       private String fecha_fallecimiento;
       private   String nacionalidad;
       private String edad;
        
       private String participaciones_totales;
       private String primera_participacion;
        
       private String podium1;
          private String podium2;
          private String podium3;
          
          
       private String corredores;
       
      private  String nombre_equipo;
      private int numero_equipo;
     private  String pais_equipo;
        
         private String fabricante;
        private String modelo; 
        private String motor;
         private String categoria;
        
        private String fecha;
 public Reporte16() {
    }

    public Reporte16(String nombre_piloto, String apellido, String fecha_nacimiento, String fecha_fallecimiento, String nacionalidad, String edad, String participaciones_totales, String primera_participacion, String podium1, String podium2, String podium3, String corredores, String nombre_equipo, int numero_equipo, String pais_equipo, String fabricante, String modelo, String motor, String categoria) {
        this.nombre_piloto = nombre_piloto;
        this.apellido = apellido;
        this.fecha_nacimiento = fecha_nacimiento;
        this.fecha_fallecimiento = fecha_fallecimiento;
        this.nacionalidad = nacionalidad;
        this.edad = edad;
        this.participaciones_totales = participaciones_totales;
        this.primera_participacion = primera_participacion;
        this.podium1 = podium1;
        this.podium2 = podium2;
        this.podium3 = podium3;
        this.corredores = corredores;
        this.nombre_equipo = nombre_equipo;
        this.numero_equipo = numero_equipo;
        this.pais_equipo = pais_equipo;
        this.fabricante = fabricante;
        this.modelo = modelo;
        this.motor = motor;
        this.categoria = categoria;
    }

    public Reporte16(String nombre_piloto, String apellido, String fecha_nacimiento, String fecha_fallecimiento, String nacionalidad, String edad, String participaciones_totales, String primera_participacion, String podium1, String podium2, String podium3, String corredores, String nombre_equipo, int numero_equipo, String pais_equipo, String fabricante, String modelo, String motor, String categoria, String fecha) {
        this.nombre_piloto = nombre_piloto;
        this.apellido = apellido;
        this.fecha_nacimiento = fecha_nacimiento;
        this.fecha_fallecimiento = fecha_fallecimiento;
        this.nacionalidad = nacionalidad;
        this.edad = edad;
        this.participaciones_totales = participaciones_totales;
        this.primera_participacion = primera_participacion;
        this.podium1 = podium1;
        this.podium2 = podium2;
        this.podium3 = podium3;
        this.corredores = corredores;
        this.nombre_equipo = nombre_equipo;
        this.numero_equipo = numero_equipo;
        this.pais_equipo = pais_equipo;
        this.fabricante = fabricante;
        this.modelo = modelo;
        this.motor = motor;
        this.categoria = categoria;
        this.fecha = fecha;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    
    
    
    
    
    
    public String getNombre_piloto() {
        return nombre_piloto;
    }

    public void setNombre_piloto(String nombre_piloto) {
        this.nombre_piloto = nombre_piloto;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getFecha_fallecimiento() {
        return fecha_fallecimiento;
    }

    public void setFecha_fallecimiento(String fecha_fallecimiento) {
        this.fecha_fallecimiento = fecha_fallecimiento;
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

    public String getParticipaciones_totales() {
        return participaciones_totales;
    }

    public void setParticipaciones_totales(String participaciones_totales) {
        this.participaciones_totales = participaciones_totales;
    }

    public String getPrimera_participacion() {
        return primera_participacion;
    }

    public void setPrimera_participacion(String primera_participacion) {
        this.primera_participacion = primera_participacion;
    }

    public String getPodium1() {
        return podium1;
    }

    public void setPodium1(String podium1) {
        this.podium1 = podium1;
    }

    public String getPodium2() {
        return podium2;
    }

    public void setPodium2(String podium2) {
        this.podium2 = podium2;
    }

    public String getPodium3() {
        return podium3;
    }

    public void setPodium3(String podium3) {
        this.podium3 = podium3;
    }

    public String getCorredores() {
        return corredores;
    }

    public void setCorredores(String corredores) {
        this.corredores = corredores;
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

    public String getPais_equipo() {
        return pais_equipo;
    }

    public void setPais_equipo(String pais_equipo) {
        this.pais_equipo = pais_equipo;
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

    public String getMotor() {
        return motor;
    }

    public void setMotor(String motor) {
        this.motor = motor;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

   
    
    
    
}
