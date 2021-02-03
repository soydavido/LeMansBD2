/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author Carlos
 */
public class Reporte15 {
    
    
    private String nombre;
    
    private String Pais;
    
    private int numero_victorias;

    public Reporte15(String nombre, String Pais, int numero_victorias) {
        this.nombre = nombre;
        this.Pais = Pais;
        this.numero_victorias = numero_victorias;
    }

    public Reporte15(String nombre, int numero_victorias) {
        this.nombre = nombre;
        this.numero_victorias = numero_victorias;
    }

    
    
    
    
    public Reporte15() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPais() {
        return Pais;
    }

    public void setPais(String Pais) {
        this.Pais = Pais;
    }

    public int getNumero_victorias() {
        return numero_victorias;
    }

    public void setNumero_victorias(int numero_victorias) {
        this.numero_victorias = numero_victorias;
    }
    
    
    
    
    
    
}
