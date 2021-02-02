/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import Clases.Conductor;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Carlos
 */
public class ConductorConexion {
    
     
    public ArrayList<Conductor> traerConductor(){
        
        ArrayList<Conductor> lista = new ArrayList<Conductor>();
        Date fecha_ingreso;
        
         String url = "jdbc:postgresql://localhost:5432/postgres";
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        String sql
                = "SELECT traer_datos_personales(persona,1) from conductor;";
        ResultSet result = st.executeQuery(sql);
        
        
        
        int contador = 1;
        int o = 1;
        String primer_nombre = "";
        String segundo_nombre= "";
        String primer_apellido = "";
        String segundo_apellido= "";
        Date fecha_nacimiento= null;
        String sexo = "Masculino";
        String lugar_nacimiento= "";
        Date fecha_fallecimiento= null;
        
        while(result.next()){
            
            
          
            String arreglo = result.getString("traer_datos_personales");
            
            for (int i = 0; i < arreglo.length(); i++){
                
                
                if(arreglo.charAt(i) == ',' || (arreglo.charAt(i) == ')')){
                    
                    if(contador == 1){
                        primer_nombre = arreglo.substring(o, i);
                        
                        o = i+1;
                        
                    }
                    if(contador == 2){
                        segundo_nombre = arreglo.substring(o, i);
                        
                        o = i+1;
                       
                    }
                    if(contador == 3){
                        primer_apellido = arreglo.substring(o, i);
                        
                        o = i+1;
                       
                    }
                    if(contador == 4){
                        segundo_apellido = arreglo.substring(o, i);
                        
                        o = i+1;
                        System.out.println(segundo_apellido);
                    }
                    if(contador == 5){
                        fecha_nacimiento = Date.valueOf(arreglo.substring(o, i));
                        
                        o = i+1;
                       // System.out.println(fecha_nacimiento);
                    }
                     if(contador == 6){
                        sexo = arreglo.substring(o, i);
                        
                        o = i+1;
                        System.out.println(sexo);
                    }
                      if(contador == 7){
                        lugar_nacimiento = arreglo.substring(o, i);
                        
                        o = i+1;
                       // System.out.println(lugar_nacimiento);
                    }
                    if(contador == 8){
                       fecha_fallecimiento = Date.valueOf(arreglo.substring(o, i));
                         
                        
                        contador = 0;
                        o = 1;
                        Conductor conductor = new Conductor(primer_nombre,segundo_nombre,
                                                                        primer_apellido,segundo_apellido,sexo,fecha_nacimiento,
                                                                        lugar_nacimiento,fecha_fallecimiento );
                        
                         lista.add(conductor);
          
                    }
                   
                    contador ++;                         
                }
            }
         
        }

        
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error");
        return null;
    }
    
    
    }
    
    
    
    
    
    
    
}
