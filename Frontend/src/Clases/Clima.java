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
public class Clima {
    
    
    private Long id;
    
    private Long id_evento;
    
    private String clima;
    
    private String humedad;
    
    private String temperatura;
    
    private Boolean dia;
    
    private Time hora_inicial;
    
    private Time hora_final;

    public Clima() {
    }
    
    
    

    public Clima(String clima, String humedad, String temperatura, Boolean dia) {
       
        this.clima = clima;
        this.humedad = humedad;
        this.temperatura = temperatura;
        this.dia = dia;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId_evento() {
        return id_evento;
    }

    public void setId_evento(Long id_evento) {
        this.id_evento = id_evento;
    }

    public String getClima() {
        return clima;
    }

    public void setClima(String clima) {
        this.clima = clima;
    }

    public String getHumedad() {
        return humedad;
    }

    public void setHumedad(String humedad) {
        this.humedad = humedad;
    }

    public String getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(String temperatura) {
        this.temperatura = temperatura;
    }

    public Boolean getDia() {
        return dia;
    }

    public void setDia(Boolean dia) {
        this.dia = dia;
    }

    public Time getHora_inicial() {
        return hora_inicial;
    }

    public void setHora_inicial(Time hora_inicial) {
        this.hora_inicial = hora_inicial;
    }

    public Time getHora_final() {
        return hora_final;
    }

    public void setHora_final(Time hora_final) {
        this.hora_final = hora_final;
    }
    
    
    
    
    
    
    
}
