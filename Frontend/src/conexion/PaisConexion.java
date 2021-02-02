/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;



import java.sql.*;


public class PaisConexion {

    public PaisConexion() {
    }
    
    
    
    
    public void insertarParticipante(){
         String url = "jdbc:postgresql://localhost:5432/postgres";
    
    String usuario = "postgres";
    String contrasenia = "car123los";
    
    
    try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        String sql
                = "SELECT * FROM pais";
        ResultSet result = st.executeQuery(sql);
       
        while(result.next()){
            System.out.println(result.getString("nombre"));

        }

        result.close();
        st.close();
        conexion.close();
    }catch(Exception e){
        System.out.println("error");
    }
    
    
    }
    
    
    
    
}
