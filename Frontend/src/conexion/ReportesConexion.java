/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import Clases.Reporte1;
import Clases.Reporte11;
import Clases.Reporte15;
import Clases.Reporte16;
import Clases.Reporte4;
import Clases.Reporte7;
import java.sql.*;
import java.util.ArrayList;



public class ReportesConexion {

    public ReportesConexion() {
    }
    
    
     private String url = "jdbc:postgresql://localhost:5432/dw_lemans";
    
    
    
    public ArrayList<Reporte4> reporte4(String ano,int numero_equipo){
        
        ArrayList<Reporte4> lista = new ArrayList<Reporte4>();
       
        
         
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
        if(ano.equals("Seleccionar")){
           
         sql
                = "SELECT  * from reporte4(null,"+numero_equipo+");";
        }else{
           sql
                = "SELECT  * from reporte4("+ano+","+numero_equipo+");";
        }
        
        ResultSet result = st.executeQuery(sql);
       
        Reporte4 reporte = new Reporte4();
      
        String nombre2 = "";
      String apellido2 = "";
      double diferencia = 0;
      
        while(result.next()){
        
          if(result.getString("diferencia") != null){
             diferencia = Double.parseDouble(result.getString("diferencia"));
          }
         
          reporte = new Reporte4(   Integer.parseInt(result.getString("id_evento")),
                                    result.getString("nombre_equipo"),
                                    Integer.parseInt(result.getString("numero_equipo")),
                                    result.getString("pais_equipo"),
                                    result.getString("nombre_piloto"),
                                    nombre2,
                                    result.getString("apellido_piloto"),
                                    apellido2,
                                    result.getString("nacionalidad"),
                                    result.getString("fabricante"),
                                    result.getString("modelo"),
                                    result.getString("motor"),
                                    result.getString("categoria"),
                                    Integer.parseInt(result.getString("posicion")),
                                    Double.parseDouble(result.getString("kilometraje")),
                                    Integer.parseInt(result.getString("vueltas")),
                                    Double.parseDouble(result.getString("velocidad_media")),
                                    result.getString("vuelta_rapida"),
                                    diferencia,
                                    Integer.parseInt(result.getString("cantidad_pilotos"))
                                    );
       
        
       
           
           lista.add(reporte);
            nombre2 = "";
            apellido2 = "";
            diferencia = 0;
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error reporte4");
        return null;
    }
    
    
    }
   
    
    
    
    
    
    public ArrayList<Reporte4> reporte5(String primer_nombre,String primer_apellido){
        
        ArrayList<Reporte4> lista = new ArrayList<Reporte4>();
       
        
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
       
        String sql
                = "SELECT  * from reporte4();";
        ResultSet result = st.executeQuery(sql);
       
        Reporte4 reporte = new Reporte4();
      
        while(result.next()){
             
           
           /* reporte = new Reporte4( result.getString("nombre_equipo"),
                                    Integer.parseInt(result.getString("numero_equipo")),
                                    Integer.parseInt(result.getString("posicion_ensayo")),
                                    Integer.parseInt(result.getString("posicion_carrera")),
                                    result.getString("nombre_piloto"),
                                    result.getString("nombre2"),
                                    result.getString("apellido"),
                                    result.getString("apellido2"),
                                     result.getString("gentilicio")
                                    );
      
       
       
      
           
           lista.add(reporte);*/
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error reporte4");
        return null;
    }
    
    
    }
    
    
    
    public ArrayList<Reporte4> reporte6(String fabricante,String modelo){
        
        ArrayList<Reporte4> lista = new ArrayList<Reporte4>();
       
        
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
      /*  if(ano.equals("Seleccionar")){
          
         sql
                = "SELECT  * from reporte4(null,"+numero_equipo+");";
        }else{
           sql
                = "SELECT  * from reporte4('"+ano+"',"+numero_equipo+");";
        }*/
        sql
                = "SELECT  * from reporte4('"+fabricante+"','"+modelo+"');";
        
        ResultSet result = st.executeQuery(sql);
       
        Reporte4 reporte = new Reporte4();
      
         String nombre2 = "";
      String apellido2 = "";
      
        while(result.next()){
           if(result.getString("nombre2") != null){
              nombre2 =  result.getString("nombre2");
          }
          if(result.getString("apellido2") != null){
              apellido2 =  result.getString("apellido2");
          }
         
         
         
          reporte = new Reporte4(   result.getString("ano_participacion"),
                  
                                    result.getString("nombre_equipo"),
                                    Integer.parseInt(result.getString("numero_equipo")),
                                   
                                    result.getString("nombre_piloto"),
                                    nombre2,
                                    result.getString("apellido"),
                                    apellido2,
                                    result.getString("nacionalidad"),
                                    result.getString("fabricante"),
                                    result.getString("modelo"),
                                    result.getString("caracteristicas_vehiculo"),
                                    result.getString("categoria_vehiculo")
                                    
                                    );
       
        
       
           
           lista.add(reporte);
            nombre2 = "";
            apellido2 = "";
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error reporte6");
        return null;
    }
    
    
    }
   
    
    
    
     public ArrayList<Reporte7> reporte7(String ano){
        
        ArrayList<Reporte7> lista = new ArrayList<Reporte7>();
       
        
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
        if(ano.equals("Seleccionar")){
          
         sql
                = "SELECT  * from reporte7(null);";
        }else{
          
           sql
                = "SELECT  * from reporte7("+ano+");";
        }
        
        ResultSet result = st.executeQuery(sql);
       
        Reporte7 reporte = new Reporte7();
      
        String nombre2 = "";
      String apellido2 = "";
      
        while(result.next()){
            // System.out.println(result.getString("nombre_equipo")+Integer.parseInt(result.getString("numero_equipo")));
          //  System.out.println( result.getString("nombre_piloto")+result.getString("nombre2")+result.getString("apellido")+result.getString("apellido2"));
          
         
         
        reporte = new Reporte7(  
                                    result.getString("nombre"),
                                    nombre2,
                                    result.getString("apellido"),
                                    apellido2,
                                    result.getString("nacionalidad"),
                                    result.getString("edad")
                                    );
       
        
       
           
           lista.add(reporte);
            
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error reporte7");
        return null;
    }
    
    
    }
   
     
     
     
     public ArrayList<Reporte7> reporte8(String ano){
        
        ArrayList<Reporte7> lista = new ArrayList<Reporte7>();
       
        
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
        if(ano.equals("Seleccionar")){
          
         sql
                = "SELECT  * from reporte8(null);";
        }else{
           sql
                = "SELECT  * from reporte8("+ano+");";
        }
        
        ResultSet result = st.executeQuery(sql);
       
        Reporte7 reporte = new Reporte7();
      
        String nombre2 = "";
      String apellido2 = "";
      
        while(result.next()){
            // System.out.println(result.getString("nombre_equipo")+Integer.parseInt(result.getString("numero_equipo")));
          //  System.out.println( result.getString("nombre_piloto")+result.getString("nombre2")+result.getString("apellido")+result.getString("apellido2"));
        
         
         
          reporte = new Reporte7(  
                                    result.getString("nombre"),
                                    nombre2,
                                    result.getString("apellido"),
                                    apellido2,
                                    result.getString("nacionalidad"),
                                    result.getString("edad")
                                    );
       
        
       
           
           lista.add(reporte);
            nombre2 = "";
            apellido2 = "";
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error reporte8");
        return null;
    }
    
    
    }
    
     
     
      
     
     public ArrayList<Reporte7> reporte9(){
        
        ArrayList<Reporte7> lista = new ArrayList<Reporte7>();
       
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
         sql
                = "SELECT  * from reporte9();";
       
        
        ResultSet result = st.executeQuery(sql);
       
        Reporte7 reporte = new Reporte7();
      
        String nombre2 = "";
      String apellido2 = "";
      
        while(result.next()){
            // System.out.println(result.getString("nombre_equipo")+Integer.parseInt(result.getString("numero_equipo")));
          //  System.out.println( result.getString("nombre_piloto")+result.getString("nombre2")+result.getString("apellido")+result.getString("apellido2"));
          if(result.getString("nombre2") != null){
              nombre2 =  result.getString("nombre2");
          }
          if(result.getString("apellido2") != null){
              apellido2 =  result.getString("apellido2");
          }
         
         
          reporte = new Reporte7(  
                                    result.getString("nombre_piloto"),
                                    nombre2,
                                    result.getString("apellido"),
                                    apellido2,
                                    result.getString("nacionalidad"),
                                    Integer.parseInt(result.getString(""))
                                    );
       
        
       
           
           lista.add(reporte);
            nombre2 = "";
            apellido2 = "";
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error reporte9");
        return null;
    }
    
    
    }
     
     
     
     
     public ArrayList<Reporte7> reporte10(String ano){
        
        ArrayList<Reporte7> lista = new ArrayList<Reporte7>();
       
        
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
        if(ano.equals("Seleccionar")){
          
         sql
                = "SELECT  * from reporte10(null);";
        }else{
           sql
                = "SELECT  * from reporte10('"+ano+"');";
        }
        
        ResultSet result = st.executeQuery(sql);
       
        Reporte7 reporte = new Reporte7();
      
        String nombre2 = "";
      String apellido2 = "";
      
        while(result.next()){
       
            if(result.getString("nombre2") != null){
              nombre2 =  result.getString("nombre2");
          }
          if(result.getString("apellido2") != null){
              apellido2 =  result.getString("apellido2");
          }
         
         
          reporte = new Reporte7(  
                                    result.getString("nombre_piloto"),
                                    nombre2,
                                    result.getString("apellido"),
                                    apellido2,
                                    result.getString("nacionalidad")
                                    );
       
        
       
           
           lista.add(reporte);
            nombre2 = "";
            apellido2 = "";
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error reporte10");
        return null;
    }
    
    
    }
    
    
     public ArrayList<Reporte11> reporte11(String ano){
        
        ArrayList<Reporte11> lista = new ArrayList<Reporte11>();
       
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
        if(ano.equals("Seleccionar")){
          
         sql
                = "SELECT  * from reporte11(null);";
        }else{
           sql
                = "SELECT  * from reporte11("+ano+");";
        }
        
        ResultSet result = st.executeQuery(sql);
       
        Reporte11 reporte = new Reporte11();
      
       
      
        while(result.next()){
       
            
         
         
          reporte = new Reporte11(  
                                    result.getString("nombre_equipo"),
                                    Integer.parseInt(result.getString("numero_equipo")),
                                    result.getString("nacionalidad"),
                                    result.getString("fabricante"),
                                    result.getString("modelo"),
                                    Double.parseDouble(result.getString("velocidad_media"))
                                    );
       
        
       
           
           lista.add(reporte);
            
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error reporte11");
        return null;
    }
    
    
    }
    
     
     
     
    public ArrayList<Reporte4> reporte12(int numero){
        
        ArrayList<Reporte4> lista = new ArrayList<Reporte4>();
       
        
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
     
         sql
                = "SELECT  * from reporte12("+numero+");";
        
        
        ResultSet result = st.executeQuery(sql);
       
        Reporte4 reporte = new Reporte4();
      
        String nombre2 = "";
      String apellido2 = "";
      
        while(result.next()){
           
          reporte = new Reporte4(   result.getString("nombre_equipo"),
                                    Integer.parseInt(result.getString("numero_equipo")),
                                    result.getString("pais_equipo"),
                                    result.getString("nombre_piloto"),
                                    result.getString("apellido_piloto"),
                                    result.getString("nacionalidad"),
                                    result.getString("fabricante"),
                                    result.getString("modelo"),
                                    result.getString("motor"),
                                    result.getString("categoria"),
                                    Integer.parseInt(result.getString("posicion")),
                                    Double.parseDouble(result.getString("kilometraje")),
                                    Integer.parseInt(result.getString("vueltas")),
                                    Double.parseDouble(result.getString("velocidad_media")),
                                    result.getString("vuelta_rapida"),
                                    Double.parseDouble(result.getString("diferencia")),
                                    Integer.parseInt(result.getString("cantidad_pilotos"))
                                    );
       
        
       
           
           lista.add(reporte);
           
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error reporte12");
        return null;
    }
    
    
    }
   
    
     public ArrayList<Reporte7> reporte13(){
        
        ArrayList<Reporte7> lista = new ArrayList<Reporte7>();
       
        
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
      
         sql
                = "SELECT  * from reporte13();";
       
        
        ResultSet result = st.executeQuery(sql);
       
        Reporte7 reporte = new Reporte7();
      
        String nombre2 = "";
      String apellido2 = "";
      
        while(result.next()){
      
          if(result.getString("nombre2") != null){
              nombre2 =  result.getString("nombre2");
          }
          if(result.getString("apellido2") != null){
              apellido2 =  result.getString("apellido2");
          }
         
         
          reporte = new Reporte7(  
                                    result.getString("nombre_piloto"),
                                    nombre2,
                                    result.getString("apellido"),
                                    apellido2,
                                    result.getString("nacionalidad"),
                                    result.getString("edad")
                                    );
       
        
       
           
           lista.add(reporte);
            nombre2 = "";
            apellido2 = "";
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error reporte13");
        return null;
    }
    
    
    }
   
     
     public ArrayList<Reporte7> reporte14(){
        
        ArrayList<Reporte7> lista = new ArrayList<Reporte7>();
       
        
         
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
          
         sql
                = "SELECT  * from reporte14();";
     
        
        ResultSet result = st.executeQuery(sql);
       
        Reporte7 reporte = new Reporte7();
      
        String nombre2 = "";
      String apellido2 = "";
      
        while(result.next()){
            // System.out.println(result.getString("nombre_equipo")+Integer.parseInt(result.getString("numero_equipo")));
          //  System.out.println( result.getString("nombre_piloto")+result.getString("nombre2")+result.getString("apellido")+result.getString("apellido2"));
          if(result.getString("nombre2") != null){
              nombre2 =  result.getString("nombre2");
          }
          if(result.getString("apellido2") != null){
              apellido2 =  result.getString("apellido2");
          }
         
         
          reporte = new Reporte7(  
                                    result.getString("nombre_piloto"),
                                    nombre2,
                                    result.getString("apellido"),
                                    apellido2,
                                    result.getString("nacionalidad"),
                                    result.getString("edad")
                                    );
       
        
       
           
           lista.add(reporte);
            nombre2 = "";
            apellido2 = "";
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error reporte14");
        return null;
    }
    
    
    }
   
    
     public ArrayList<Reporte15> reporte15(String marca){
        
        ArrayList<Reporte15> lista = new ArrayList<Reporte15>();
       
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
        if(marca.equals("Seleccionar")){
          
         sql
                = "SELECT  * from reporte7(null);";
        }else{
           sql
                = "SELECT  * from reporte7('"+marca+"');";
        }
        
        ResultSet result = st.executeQuery(sql);
       
        Reporte15 reporte = new Reporte15();
      
        String nombre2 = "";
      String apellido2 = "";
      
        while(result.next()){
           
         
          reporte = new Reporte15(  
                                    result.getString("nombre"),
                                    result.getString("pais"),
                                    Integer.parseInt(result.getString("cantidad_victoria"))
                                    );
       
        
       
           
           lista.add(reporte);
            
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error reporte15");
        return null;
    }
    
    
    }
   
     
    
    
    public ArrayList<Reporte16> reporte16(String ano){
        
        ArrayList<Reporte16> lista = new ArrayList<Reporte16>();
       
        
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
        if(ano.equals("Seleccionar")){
          
         sql
                = "SELECT  * from reporte16(null);";
        }else{
           sql
                = "SELECT  * from reporte16("+ano+");";
        }
        
        ResultSet result = st.executeQuery(sql);
       
        Reporte16 reporte = new Reporte16();
      
        String nombre2 = "";
      String apellido2 = "";
      double diferencia = 0;
      
        while(result.next()){
          
        
         
          reporte = new Reporte16(  result.getString("nombre_piloto"),
                                    result.getString("apellido_piloto"),
                                    result.getString("fecha_nacimiento"),
                                    result.getString("fecha_fallecimiento"),
                                    result.getString("nacionalidad"),
                                    result.getString("edad"),
                  
                  
                                    result.getString("participaciones_totaltes"),
                                    result.getString("primera_participacion"),
                  
                                    result.getString("podium1"),
                                    result.getString("podium2"),
                                    result.getString("podium3"),
                  
                                    result.getString("corredores"),
                  
                                    result.getString("nombre_equipo"),
                                    Integer.parseInt(result.getString("numero_equipo")),
                                    result.getString("pais_equipo"),
                  
                                    result.getString("fabricante"),
                                    result.getString("modelo"),
                                    result.getString("motor"),
                                    result.getString("categoria")
                                    );
       
       
      
           
           lista.add(reporte);
          
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error reporte16");
        return null;
    }
    
    
    }
   
     
    
    
    
    
    
}
