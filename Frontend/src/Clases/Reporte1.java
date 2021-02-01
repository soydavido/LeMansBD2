/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;


import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author Carlos
 */
public class Reporte1 {
    
      private  String nombre_equipo;
      private int numero_equipo;
      private  String nacionalidad_equipo;
      
      private int posicion_actual;
      private int numero_vuelta;
       private Long km_recorrido;
      

        private String nombre_automovil;
        private String nombre_motor_automovil; 
        private String cilindrada_motor_automovil;
       private String combustion_motor_automovil; 
       
        private String nombre_categoria;
       
        private int velocidad_media;
        private Time tiempo_mejor_vuelta;
        
        private   String primer_nombre;
        private   String primer_apellido;
         private   String segundo_nombre;
        private   String segundo_apellido;
        private   String nacionalidad_conductor;

    public Reporte1() {
    }
        
        
                                 

    public Reporte1(String nombre_equipo, int numero_equipo, String nacionalidad_equipo, int posicion_actual, int numero_vuelta, Long km_recorrido, String nombre_automovil, String nombre_motor_automovil, String cilindrada_motor_automovil, String combustion_motor_automovil, String nombre_categoria, int velocidad_media, Time tiempo_mejor_vuelta, String primer_nombre, String primer_apellido, String segundo_nombre, String segundo_apellido, String nacionalidad_conductor) {
        this.nombre_equipo = nombre_equipo;
        this.numero_equipo = numero_equipo;
        this.nacionalidad_equipo = nacionalidad_equipo;
        this.posicion_actual = posicion_actual;
        this.numero_vuelta = numero_vuelta;
        this.km_recorrido = km_recorrido;
        this.nombre_automovil = nombre_automovil;
        this.nombre_motor_automovil = nombre_motor_automovil;
        this.cilindrada_motor_automovil = cilindrada_motor_automovil;
        this.combustion_motor_automovil = combustion_motor_automovil;
        this.nombre_categoria = nombre_categoria;
        this.velocidad_media = velocidad_media;
        this.tiempo_mejor_vuelta = tiempo_mejor_vuelta;
        this.primer_nombre = primer_nombre;
        this.primer_apellido = primer_apellido;
        this.segundo_nombre = segundo_nombre;
        this.segundo_apellido = segundo_apellido;
        this.nacionalidad_conductor = nacionalidad_conductor;
       
                                   
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

    public String getNacionalidad_equipo() {
        return nacionalidad_equipo;
    }

    public void setNacionalidad_equipo(String nacionalidad_equipo) {
        this.nacionalidad_equipo = nacionalidad_equipo;
    }

    public int getPosicion_actual() {
        return posicion_actual;
    }

    public void setPosicion_actual(int posicion_actual) {
        this.posicion_actual = posicion_actual;
    }

    public int getNumero_vuelta() {
        return numero_vuelta;
    }

    public void setNumero_vuelta(int numero_vuelta) {
        this.numero_vuelta = numero_vuelta;
    }

    public Long getKm_recorrido() {
        return km_recorrido;
    }

    public void setKm_recorrido(Long km_recorrido) {
        this.km_recorrido = km_recorrido;
    }

    public String getNombre_automovil() {
        return nombre_automovil;
    }

    public void setNombre_automovil(String nombre_automovil) {
        this.nombre_automovil = nombre_automovil;
    }

    public String getNombre_motor_automovil() {
        return nombre_motor_automovil;
    }

    public void setNombre_motor_automovil(String nombre_motor_automovil) {
        this.nombre_motor_automovil = nombre_motor_automovil;
    }

    public String getCilindrada_motor_automovil() {
        return cilindrada_motor_automovil;
    }

    public void setCilindrada_motor_automovil(String cilindrada_motor_automovil) {
        this.cilindrada_motor_automovil = cilindrada_motor_automovil;
    }

    public String getCombustion_motor_automovil() {
        return combustion_motor_automovil;
    }

    public void setCombustion_motor_automovil(String combustion_motor_automovil) {
        this.combustion_motor_automovil = combustion_motor_automovil;
    }

    public String getNombre_categoria() {
        return nombre_categoria;
    }

    public void setNombre_categoria(String nombre_categoria) {
        this.nombre_categoria = nombre_categoria;
    }

    public int getVelocidad_media() {
        return velocidad_media;
    }

    public void setVelocidad_media(int velocidad_media) {
        this.velocidad_media = velocidad_media;
    }

    public Time getTiempo_mejor_vuelta() {
        return tiempo_mejor_vuelta;
    }

    public void setTiempo_mejor_vuelta(Time tiempo_mejor_vuelta) {
        this.tiempo_mejor_vuelta = tiempo_mejor_vuelta;
    }

    public String getPrimer_nombre() {
        return primer_nombre;
    }

    public void setPrimer_nombre(String primer_nombre) {
        this.primer_nombre = primer_nombre;
    }

    public String getPrimer_apellido() {
        return primer_apellido;
    }

    public void setPrimer_apellido(String primer_apellido) {
        this.primer_apellido = primer_apellido;
    }

    public String getSegundo_nombre() {
        return segundo_nombre;
    }

    public void setSegundo_nombre(String segundo_nombre) {
        this.segundo_nombre = segundo_nombre;
    }

    public String getSegundo_apellido() {
        return segundo_apellido;
    }

    public void setSegundo_apellido(String segundo_apellido) {
        this.segundo_apellido = segundo_apellido;
    }

    public String getNacionalidad_conductor() {
        return nacionalidad_conductor;
    }

    public void setNacionalidad_conductor(String nacionalidad_conductor) {
        this.nacionalidad_conductor = nacionalidad_conductor;
    }
        
 	
        
        
        
        
    
}
