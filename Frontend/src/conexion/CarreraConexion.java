/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;



import Clases.Carrera;
import Clases.Clima;
import Clases.Conductor;
import Clases.Participante;
import java.sql.*;
import java.util.ArrayList;


public class CarreraConexion {

    public CarreraConexion() {
    }
    
    
    
    
      
    public String calcular_condicion_auto(ArrayList<Carrera> carrera,Time tiempo){
        
       // ArrayList<Carrera> lista = new ArrayList<Carrera>();
      try{  
        
         String url = "jdbc:postgresql://localhost:5432/postgres";
         String usuario = "postgres";
         String contrasenia = "car123los";
          Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
    
    
        Long km_actual ;
        int velocidad_actual = 0;
        String nombre_pista = "Maison Blance";
        int numero_vuelta = 0;
        ResultSet result = null;
        
         Time tiempo_inicial = new Time(0,0,0);
         
         String situaciones = "";
              String llegada = "";
         
        for(int i = 0;i < carrera.size();i++){
           
             tiempo_inicial = carrera.get(i).getTiempo_inicial();
         
           
              String sql
               = "select * from calcular_condicion_auto('"
                      +tiempo+"',"
                      +carrera.get(i).getId_evento()+",'"
                      +carrera.get(i).getFecha_ingreso()+"','"
                      +carrera.get(i).getFecha_inicio()+"',"
                      +carrera.get(i).getNumero_equipo()+","
                      +carrera.get(i).getId_automovil()+","
                      +carrera.get(i).getId_conductor()+")";
                     
                       
              result = st.executeQuery(sql);
             
      
              
              
            while(result.next()){ 
                
                
                  llegada =  result.getString("calcular_condicion_auto");
                  
                  if(!llegada.equals("Nada")){
                      situaciones = situaciones+ "\nLa situacion del equipo "+carrera.get(i).getNumero_equipo()
                              +" es "+llegada;
                  }
                
            }
        }
        
       
        
        //------------------------------------------------------------------
        result.close();
        st.close();
        conexion.close();
        
        return situaciones;
    }catch(Exception e){
        System.out.println("error condicion_auto");
        return "";
    }
    
    
    }
    
    
    
      
    
    public Clima calcular_clima(int id_evento,Time tiempo){
        
       
        
         String url = "jdbc:postgresql://localhost:5432/postgres";
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        Clima clima = new Clima();
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        String sql
                = "select * from calcular_clima_hora("+id_evento+",'"+tiempo+"');";
        ResultSet result = st.executeQuery(sql);
     
        while(result.next()){
            clima = new Clima(result.getString("out_clima"),
                                    result.getString("out_humedad"),
                                    result.getString("out_temperatura"),
                                    Boolean.valueOf(result.getString("out_dia")));
           
        }
       
        
        result.close();
        st.close();
        conexion.close();
        
       return clima;
    }catch(Exception e){
        System.out.println("error clima");
       return null;
    }
    
    
    }
    
    
    
    public ArrayList<Carrera> traerCorredores(){
        
        ArrayList<Carrera> lista = new ArrayList<Carrera>();
        Date fecha_ingreso;
        
         String url = "jdbc:postgresql://localhost:5432/postgres";
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        String sql
                = "SELECT  * from traer_carrera();";
        ResultSet result = st.executeQuery(sql);
        
        
       Carrera carrera = new Carrera();
        Time tiempo_final;
        while(result.next()){
           if(result.getString("out_tiempo_final") == null){
                    
               tiempo_final = new Time(0,0,0);                
           
           }else{
                tiempo_final = Time.valueOf(result.getString("out_tiempo_final")); 
           }
            carrera = new Carrera(0,
                                    Integer.parseInt(result.getString("out_posicion_actual")),
                                 
                                    Time.valueOf(result.getString("out_tiempo_inicial")),
                                    
                                    tiempo_final,
                                    Long.parseLong(result.getString("out_km_recorrido")),
                                    Integer.parseInt(result.getString("out_velocidad_media")),
                                    "",
                                    Long.parseLong(result.getString("out_id_evento")),
                                    Date.valueOf(result.getString("out_fecha_ingreso")),
                                    Date.valueOf(result.getString("out_fecha_inicio")),
                                    Integer.parseInt(result.getString("out_numero_equipo")),
                                    Long.parseLong(result.getString("out_id_automovil")),
                                    result.getString("out_nombre_automovil"),
                                    Long.parseLong(result.getString("out_id_conductor")),
                                    result.getString("out_primer_nombre"),
                                    result.getString("out_primer_apellido"),
                                    Boolean.valueOf(result.getString("out_primer_apellido"))
                                    
                                    );
           
           lista.add(carrera);
            }
       
        
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error traerCorredores");
        return null;
    }
    
    
    }
    
    
    public ArrayList<Carrera> calcular_velocidad_posicion(ArrayList<Carrera> carrera,Time tiempo){
        
       // ArrayList<Carrera> lista = new ArrayList<Carrera>();
      try{  
        
         String url = "jdbc:postgresql://localhost:5432/postgres";
         String usuario = "postgres";
         String contrasenia = "car123los";
          Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
    
    
        Long km_actual ;
        int velocidad_actual = 0;
        String nombre_pista = "Maison Blance";
        int numero_vuelta = 0;
        ResultSet result = null;
        
         /* System.out.println(tiempo);
          
          String tiempo_conver = tiempo.toString();
          
          tiempo_conver = "'"+tiempo_conver+"'";
          
          System.out.println(tiempo_conver);*/
        
         //--------------------------------------------------------
         Time tiempo_inicial = new Time(0,0,0);
         
         
         
        for(int i = 0;i < carrera.size();i++){
           
             tiempo_inicial = carrera.get(i).getTiempo_inicial();
         
           
              String sql
               = "select * from calcular_velocidad("
                       +carrera.get(i).getNumero_vuelta()+","
                        +carrera.get(i).getPosicion_actual()+",'"+
                        tiempo_inicial+"','"+tiempo+"',"
                        +carrera.get(i).getKm_recorrido()+","
                        +carrera.get(i).getVelocidad_media()+","
                        +carrera.get(i).getId_evento()+",'"
                        +carrera.get(i).getFecha_ingreso()+"','"
                        +carrera.get(i).getFecha_inicio()+"',"
                        +carrera.get(i).getNumero_equipo()+","
                        +carrera.get(i).getId_automovil()+","
                        +carrera.get(i).getId_conductor()+")";
              result = st.executeQuery(sql);
             
           // System.out.println("equipo "+carrera.get(i).getNumero_equipo()+"km "+carrera.get(i).getKm_recorrido()+" , ");
             
            while(result.next()){ 
                
                  km_actual =  Long.parseLong(result.getString("out_km_actual"));
                 velocidad_actual = Integer.parseInt(result.getString("out_velocidad_actual"));
               
                 numero_vuelta = Integer.parseInt(result.getString("out_numero_vueltas"));
                //System.out.println(km_actual+"  "+numero_vuelta);
                 if(result.getString("out_tiempo_inicial") != null){
                     tiempo_inicial = Time.valueOf(result.getString("out_tiempo_inicial"));
                     carrera.get(i).setTiempo_inicial(tiempo_inicial);
                    
                 }
                   carrera.get(i).setKm_recorrido(km_actual);
                   carrera.get(i).setNumero_vuelta(numero_vuelta);
                   carrera.get(i).setVelocidad_media(velocidad_actual);
                  
                 
                 
           
               
                
            }
        }
        
       
        
        //------------------------------------------------------------------
        result.close();
        st.close();
        conexion.close();
        
        return carrera;
    }catch(Exception e){
        System.out.println("error calcular velocidad");
        return null;
    }
    
    
    }
    
    
    
     
    
    public ArrayList<Carrera> actualizar_posicion(Time tiempo){
        
       // ArrayList<Carrera> lista = new ArrayList<Carrera>();
      try{  
       
         String url = "jdbc:postgresql://localhost:5432/postgres";
         String usuario = "postgres";
         String contrasenia = "car123los";
          Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
    
    
        int km_actual = 0;
        int velocidad_actual = 0;
        String nombre_pista = "Maison Blance";
        int numero_vuelta = 0;
        ResultSet result = null;
        
          
        String sql
               = "select * from asignar_posiciones("
                        +1+")";
              result = st.executeQuery(sql);
        
               
        
       Carrera carre = new Carrera();
        Time tiempo_final;
        ArrayList<Carrera> lista = new ArrayList<Carrera>();
        
        
        while(result.next()){
           if(result.getString("out_tiempo_final") == null){
                    
               tiempo_final = new Time(0,0,0);                
           
           }else{
                tiempo_final = Time.valueOf(result.getString("out_tiempo_final")); 
           }
           
            carre = new Carrera(Integer.parseInt(result.getString("out_numero_vueltas")),
                                    Integer.parseInt(result.getString("out_posicion_actual")),
                                 
                                    Time.valueOf(result.getString("out_tiempo_inicial")),
                                    
                                    tiempo_final,
                                    Long.parseLong(result.getString("out_km_recorrido")),
                                    Integer.parseInt(result.getString("out_velocidad_media")),
                                    result.getString("out_nombre_pista"),
                                    Long.parseLong(result.getString("out_id_evento")),
                                    Date.valueOf(result.getString("out_fecha_ingreso")),
                                    Date.valueOf(result.getString("out_fecha_inicio")),
                                    Integer.parseInt(result.getString("out_numero_equipo")),
                                    Long.parseLong(result.getString("out_id_automovil")),
                                    result.getString("out_nombre_automovil"),
                                    Long.parseLong(result.getString("out_id_conductor")),
                                    result.getString("out_primer_nombre"),
                                    result.getString("out_primer_apellido"),
                                    Boolean.valueOf(result.getString("out_primer_apellido"))
                                    
                                    
                                    );
          /*  System.out.println(result.getString("out_km_recorrido")+" "+result.getString("out_posicion_actual")+" "+
                    result.getString("out_numero_vueltas"));*/
           lista.add(carre);
            }
       
        
        //------------------------------------------------------------------
        result.close();
        st.close();
        conexion.close();
        
        return lista;
    }catch(Exception e){
        System.out.println("error calcular posicion");
        return null;
    }
    
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
