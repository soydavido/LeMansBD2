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
public class Carrera implements Comparable<Carrera>{
    
    
      private int numero_vuelta;
      private int posicion_actual;
      private Time tiempo_inicial;
      private Time tiempo_final;
      
       private Long km_recorrido;
       private int velocidad_media;
       private String nombre_pista;
       
        private Long id_evento;
        
        private Date fecha_ingreso;
        private Date fecha_inicio;
        
        private int numero_equipo;
    
        private Long id_automovil;
        private String nombre_automovil;
      
        private Long id_conductor;
        private   String primer_nombre;
        private   String primer_apellido;
        
        private Boolean pasar_por_boxes;
        
        
        
        
     @Override
    public int compareTo(Carrera t) {
      
          
                
                  if(this.numero_equipo > t.getNumero_equipo()){
                return 1;
            }else if (this.numero_equipo < t.getNumero_equipo()){
                return -1;
            }else{
                
                  if(this.numero_vuelta > t.getNumero_vuelta()){
                return 1;
            }else if (this.numero_vuelta < t.getNumero_vuelta()){
                return -1;
            }else{
                if(this.km_recorrido > t.getKm_recorrido()){
                return 1;
            }else if (this.km_recorrido < t.getKm_recorrido()){
                return -1;
            }else{
              return 0;
            }
            }
            }
            }

    public Carrera(int numero_vuelta, int posicion_actual, Time tiempo_inicial, Time tiempo_final, Long km_recorrido, int velocidad_media, String nombre_pista, Long id_evento, Date fecha_ingreso, Date fecha_inicio, int numero_equipo, Long id_automovil, String nombre_automovil, Long id_conductor, String primer_nombre, String primer_apellido, Boolean pasar_por_boxes) {
        this.numero_vuelta = numero_vuelta;
        this.posicion_actual = posicion_actual;
        this.tiempo_inicial = tiempo_inicial;
        this.tiempo_final = tiempo_final;
        this.km_recorrido = km_recorrido;
        this.velocidad_media = velocidad_media;
        this.nombre_pista = nombre_pista;
        this.id_evento = id_evento;
        this.fecha_ingreso = fecha_ingreso;
        this.fecha_inicio = fecha_inicio;
        this.numero_equipo = numero_equipo;
        this.id_automovil = id_automovil;
        this.nombre_automovil = nombre_automovil;
        this.id_conductor = id_conductor;
        this.primer_nombre = primer_nombre;
        this.primer_apellido = primer_apellido;
        this.pasar_por_boxes = pasar_por_boxes;
    }

    public Carrera(int numero_vuelta, int posicion_actual, Time tiempo_final, Long km_recorrido, int velocidad_media, String nombre_pista, Long id_evento, Date fecha_ingreso, Date fecha_inicio, int numero_equipo, Long id_automovil, String nombre_automovil, Long id_conductor, String primer_nombre, String primer_apellido, Boolean pasar_por_boxes) {
        this.numero_vuelta = numero_vuelta;
        this.posicion_actual = posicion_actual;
        this.tiempo_final = tiempo_final;
        this.km_recorrido = km_recorrido;
        this.velocidad_media = velocidad_media;
        this.nombre_pista = nombre_pista;
        this.id_evento = id_evento;
        this.fecha_ingreso = fecha_ingreso;
        this.fecha_inicio = fecha_inicio;
        this.numero_equipo = numero_equipo;
        this.id_automovil = id_automovil;
        this.nombre_automovil = nombre_automovil;
        this.id_conductor = id_conductor;
        this.primer_nombre = primer_nombre;
        this.primer_apellido = primer_apellido;
        this.pasar_por_boxes = pasar_por_boxes;
    }
    
    
    

    public Boolean getPasar_por_boxes() {
        return pasar_por_boxes;
    }

    public void setPasar_por_boxes(Boolean pasar_por_boxes) {
        this.pasar_por_boxes = pasar_por_boxes;
    }
    


    public String getNombre_pista() {
        return nombre_pista;
    }

    public void setNombre_pista(String nombre_pista) {
        this.nombre_pista = nombre_pista;
    }

        

    public int getNumero_vuelta() {
        return numero_vuelta;
    }

    public void setNumero_vuelta(int numero_vuelta) {
        this.numero_vuelta = numero_vuelta;
    }

    public int getPosicion_actual() {
        return posicion_actual;
    }

    public void setPosicion_actual(int posicion_actual) {
        this.posicion_actual = posicion_actual;
    }

    public Time getTiempo_inicial() {
        return tiempo_inicial;
    }

    public void setTiempo_inicial(Time tiempo_inicial) {
        this.tiempo_inicial = tiempo_inicial;
    }

    public Time getTiempo_final() {
        return tiempo_final;
    }

    public void setTiempo_final(Time tiempo_final) {
        this.tiempo_final = tiempo_final;
    }

    public Long getId_evento() {
        return id_evento;
    }

    public void setId_evento(Long id_evento) {
        this.id_evento = id_evento;
    }

    public Date getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(Date fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }
      
     
      
      
      
      

   
    public Long getId_conductor() {
        return id_conductor;
    }

    public void setId_conductor(Long id_conductor) {
        this.id_conductor = id_conductor;
    }

    public Long getId_automovil() {
        return id_automovil;
    }

    public void setId_automovil(Long id_automovil) {
        this.id_automovil = id_automovil;
    }

    public Long getKm_recorrido() {
        return km_recorrido;
    }

    public void setKm_recorrido(Long km_recorrido) {
        this.km_recorrido = km_recorrido;
    }

    public int getVelocidad_media() {
        return velocidad_media;
    }

    public void setVelocidad_media(int velocidad_media) {
        this.velocidad_media = velocidad_media;
    }

    

      
      
      
      
      
      
    public Carrera() {
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
      
      
      
      
    
    
}
