/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.Date;

/**
 *
 * @author Carlos
 */
public class Participante {
    
      private Long id_conductor;
      private   String primer_nombre;
      
      private   String primer_apellido;
      
      private   String sexo;
      
    
    private Date fecha_ingreso;
     private Date fecha_inicial;
      
      
      
      private int numero_equipo;
      
      private Long id_automovil;
      private String nombre_automovil;

    public Participante(Long id_conductor, String primer_nombre, String primer_apellido, String sexo, Date fecha_ingreso, Date fecha_inicial, int numero_equipo, Long id_automovil, String nombre_automovil) {
        this.id_conductor = id_conductor;
        this.primer_nombre = primer_nombre;
        
        this.primer_apellido = primer_apellido;
        
        this.sexo = sexo;
        this.fecha_ingreso = fecha_ingreso;
        this.fecha_inicial = fecha_inicial;
        
        this.numero_equipo = numero_equipo;
        this.id_automovil = id_automovil;
        this.nombre_automovil = nombre_automovil;
    }

    

      
      
      
      
      
      
    public Participante() {
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

   
    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public Date getFecha_inicial() {
        return fecha_inicial;
    }

    public void setFecha_inicial(Date fecha_inicial) {
        this.fecha_inicial = fecha_inicial;
    }

    

    public int getNumero_equipo() {
        return numero_equipo;
    }

    public void setNumero_equipo(int numero_equipo) {
        this.numero_equipo = numero_equipo;
    }

    public String getNombre_automovil() {
        return nombre_automovil;
    }

    public void setNombre_automovil(String nombre_automovil) {
        this.nombre_automovil = nombre_automovil;
    }
      
      
      
      
      
    
    
    

    public Participante(Date fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    public Date getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(Date fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }
    
    
    
}
