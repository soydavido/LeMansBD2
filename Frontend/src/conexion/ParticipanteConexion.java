/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;



import Clases.Conductor;
import Clases.Participante;
import java.sql.*;
import java.util.ArrayList;


public class ParticipanteConexion {

    public ParticipanteConexion() {
    }
    
    
    
    
    public ArrayList<Participante> traerConductor(){
        
        ArrayList<Participante> lista = new ArrayList<Participante>();
        Date fecha_ingreso;
        
         String url = "jdbc:postgresql://localhost:5432/postgres";
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        String sql
                = "SELECT  * from listar_participantes_OUT();";
        ResultSet result = st.executeQuery(sql);
        
        
       Participante participante = new Participante();
     
        while(result.next()){
           
            participante = new Participante(Long.parseLong(result.getString("out_id_conductor")),result.getString("out_primer_nombre"),
            result.getString("out_primer_apellido"),result.getString("out_sexo"),Date.valueOf(result.getString("out_fecha_ingreso")),
            Date.valueOf(result.getString("out_fecha_inicio")),Integer.parseInt(result.getString("out_numero_equipo")),
            Long.parseLong(result.getString("out_id_automovil")),result.getString("out_nombre_automovil"));
            
           lista.add(participante);
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
