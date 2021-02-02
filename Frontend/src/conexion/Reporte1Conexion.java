/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import Clases.Reporte1;
import java.sql.*;
import java.util.ArrayList;



public class Reporte1Conexion {

    public Reporte1Conexion() {
    }
    
    
    
    
    
    
    public ArrayList<Reporte1> reporte1(String ano,String categoria){
        
        ArrayList<Reporte1> lista = new ArrayList<Reporte1>();
       
        
         String url = "jdbc:postgresql://localhost:5432/postgres";
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
       
        String sql
                = "SELECT  * from reporte1('"+ano+"','"+categoria+"');";
        ResultSet result = st.executeQuery(sql);
       
        Reporte1 reporte = new Reporte1();
      
        while(result.next()){
             
           
            reporte = new Reporte1( result.getString("out_nombre_equipo"),
                                    Integer.parseInt(result.getString("out_numero_equipo")),
                                    result.getString("out_nacionalidad_equipo"),
                                    Integer.parseInt(result.getString("out_posicion")),
                                    Integer.parseInt(result.getString("out_numero_vuelta")),
                                    Long.parseLong(result.getString("out_km_recorrido")),
                                    result.getString("out_nombre_automovil"),
                                    result.getString("out_motor_automovil_nombre"),
                                    result.getString("out_motor_automovil_cilindrada"),
                                    result.getString("out_motor_automovil_combustion"),
                                    result.getString("out_nombre_categoria"),
                                    Integer.parseInt(result.getString("out_velocidad_media")),
                                    Time.valueOf(result.getString("out_tiempo_mejor_vuelta")),
                                    result.getString("out_nombre_conductor"),
                                    result.getString("out_segundo_nombre_conductor"),
                                    result.getString("out_apellido_conductor"),
                                    result.getString("out_segundo_apellido_conductor"),
                                     result.getString("out_nacionalidad_conductor")
                                    );
      
       
       
      
           
           lista.add(reporte);
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error reporte1");
        return null;
    }
    
    
    }
   
    
    
    public ArrayList<Reporte1> reporte3(String ano,String categoria){
        
        ArrayList<Reporte1> lista = new ArrayList<Reporte1>();
       
        
         String url = "jdbc:postgresql://localhost:5432/postgres";
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
       
        String sql
                = "SELECT  * from reporte3('"+ano+"','"+categoria+"');";
        ResultSet result = st.executeQuery(sql);
       
        Reporte1 reporte = new Reporte1();
      
        while(result.next()){
             
           
            reporte = new Reporte1( result.getString("out_nombre_equipo"),
                                    Integer.parseInt(result.getString("out_numero_equipo")),
                                    result.getString("out_nacionalidad_equipo"),
                                    Integer.parseInt(result.getString("out_posicion")),
                                    Integer.parseInt(result.getString("out_numero_vuelta")),
                                    Long.parseLong(result.getString("out_km_recorrido")),
                                    result.getString("out_nombre_automovil"),
                                    result.getString("out_motor_automovil_nombre"),
                                    result.getString("out_motor_automovil_cilindrada"),
                                    result.getString("out_motor_automovil_combustion"),
                                    result.getString("out_nombre_categoria"),
                                    Integer.parseInt(result.getString("out_velocidad_media")),
                                    Time.valueOf(result.getString("out_tiempo_mejor_vuelta")),
                                    result.getString("out_nombre_conductor"),
                                    result.getString("out_segundo_nombre_conductor"),
                                    result.getString("out_apellido_conductor"),
                                    result.getString("out_segundo_apellido_conductor"),
                                     result.getString("out_nacionalidad_conductor")
                                    );
      
       
       
      
           
           lista.add(reporte);
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error reporte1");
        return null;
    }
    
    
    }
   
    
    
    
    public ArrayList<Reporte1> reporte2(String ano,String categoria,Time hora){
        
        ArrayList<Reporte1> lista = new ArrayList<Reporte1>();
       
        
         String url = "jdbc:postgresql://localhost:5432/postgres";
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
     
        
        String sql
                = "SELECT  * from reporte2('"+ano+"','"+categoria+"','"+hora+"');";
        
        System.out.println(sql);
        ResultSet result = st.executeQuery(sql);
       
        Reporte1 reporte = new Reporte1();
      
        while(result.next()){
             
           
            reporte = new Reporte1( result.getString("out_nombre_equipo"),
                                    Integer.parseInt(result.getString("out_numero_equipo")),
                                    result.getString("out_nacionalidad_equipo"),
                                    Integer.parseInt(result.getString("out_posicion")),
                                    Integer.parseInt(result.getString("out_numero_vuelta")),
                                    Long.parseLong(result.getString("out_km_recorrido")),
                                    result.getString("out_nombre_automovil"),
                                    result.getString("out_motor_automovil_nombre"),
                                    result.getString("out_motor_automovil_cilindrada"),
                                    result.getString("out_motor_automovil_combustion"),
                                    result.getString("out_nombre_categoria"),
                                    Integer.parseInt(result.getString("out_velocidad_media")),
                                    Time.valueOf(result.getString("out_tiempo_mejor_vuelta")),
                                    result.getString("out_nombre_conductor"),
                                    result.getString("out_segundo_nombre_conductor"),
                                    result.getString("out_apellido_conductor"),
                                    result.getString("out_segundo_apellido_conductor"),
                                     result.getString("out_nacionalidad_conductor")
                                    );
      
       
       
      
           
           lista.add(reporte);
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error reporte2");
        return null;
    }
    
    
    }
   
    
    
    
}
