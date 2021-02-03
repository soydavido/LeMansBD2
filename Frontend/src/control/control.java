package control;


import Clases.Reporte4;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import javax.swing.*;
import static javax.swing.WindowConstants.DO_NOTHING_ON_CLOSE;
import java.util.*;
import javax.swing.table.DefaultTableModel;



public class control {

    JFrame ventana;
    
   
    
    private String url = "jdbc:postgresql://localhost:5432/dw_lemans";
    private String usuario = "postgres";
    private String contrasenia = "car123los";
    
    
    public control() {
    }
    
    
     
      public control(JFrame ventana){
       this.ventana = ventana;
    }
    
      public void iniciaVentana(JFrame ventana){
       ventana.setLocationRelativeTo(null); //permite centrar la ventana
      
// ventana.setIconImage(new ImageIcon(ruta).getImage()); 
      //ImageIcon permite agregar un icono en el frame superior (hacia la
      //izquierda) de la ventana para evitar que salga la taza de java por 
      //defecto, debe importarse la librería javax.swing.ImageIcon
     
      ventana.setResizable(false); // no permite que el usuario cambie el tamaño 
      // de la ventana, de lo contrario los componentes pueden verse afectados
      
    //  ventana.setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);
         //para evitar cerrar con la "X", solo se sale de la ventana a través
        // del botón Salir del Sistema.
       // btnGuardar.setVisible(false); //DESAPARECER EL BOTON
    }
     
        public void activaVentana(JFrame ventana,JFrame ventana2) {
        
        ventana.setLocationRelativeTo(null);
        ventana.setVisible(true);
        ventana2.dispose(); //elimina la ventana de la memoria, incluyendo datos
        //el dispose() garantiza que no dejes ventanas ejecutándose
        //en esta etapa no nos precupamos por guardar los datos, lo haremos
        //cuando veamos xml
     }
        
       public void llenarComboNombres(JComboBox op){
        
        
        op.addItem("Seleccionar");
            
           try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
        
         sql
                = "SELECT  * from nombres_pilotos();";
       
        ResultSet result = st.executeQuery(sql);
       
        while(result.next()){
            op.addItem(result.getString("nombres"));
        }
           
            
            
        
        }catch(Exception e){
               System.out.println("error al traer los equipos");
        }
            
        }
       
       public void llenarComboApellidos(String nombre,JComboBox op){
        
        
          
           try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
        
         sql
                = "SELECT  * from apellidos_pilotos('"+nombre+"');";
       
        ResultSet result = st.executeQuery(sql);
       
        while(result.next()){
            op.addItem(result.getString("apellidos"));
        }
           
            
            
        
        }catch(Exception e){
               System.out.println("error al traer los equipos");
        }
            
        }
            
       
        public void llenarComboFabricantes(JComboBox op){
        
        
        op.addItem("Seleccionar");
            
           try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
        
         sql
                = "SELECT  * from fabricantes();";
       
        ResultSet result = st.executeQuery(sql);
       
        while(result.next()){
            op.addItem(result.getString("fabricantes"));
        }
           
            
            
        
        }catch(Exception e){
               System.out.println("error al traer los fabricantes");
        }
            
        }
        
        
        
         public void llenarComboFabricantes(String fabricante,JComboBox op){
        
        
        op.addItem("Seleccionar");
            
           try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
        
         sql
                = "SELECT  * from fabricantes('"+fabricante+"');";
       
        ResultSet result = st.executeQuery(sql);
       
        while(result.next()){
            op.addItem(result.getString("fabricantes"));
        }
           
            
            
        
        }catch(Exception e){
               System.out.println("error al traer los fabricantes");
        }
            
        }
       
        
        
       
        public void llenarComboModelos(String fabricante,JComboBox op){
        
     
            
           try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
        
         sql
                = "SELECT  * from modelos_autos('"+fabricante+"');";
       
        ResultSet result = st.executeQuery(sql);
       
        while(result.next()){
            op.addItem(result.getString("modelos"));
        }
           
            
            
        
        }catch(Exception e){
               System.out.println("error al traer los modelos");
        }
            
        }
       
        
        
 
    public void llenarComboEquipos(String ano,JComboBox op){
        
        
        op.addItem("Seleccionar");
            
           try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
         if(ano.equals("Seleccionar")){
          sql
                = "SELECT  * from numeros_equipo();";
         }else{ 
         sql
                = "SELECT  * from numeros_equipo_por_ano("+ano+");";
         }
        ResultSet result = st.executeQuery(sql);
       
        while(result.next()){
            op.addItem(result.getString("numero"));
        }
           
            
            
        
        }catch(Exception e){
               System.out.println("error al traer los equipos");
        }
            
        }
            
 



public void llenarComboAno(JComboBox op){
        
        
        op.addItem("Seleccionar");
            
           try{
        
        Class.forName("org.postgresql.Driver");
        Connection conexion = DriverManager.getConnection(url,usuario,contrasenia);
        java.sql.Statement st = conexion.createStatement();
        
        String sql;
       
        
         sql
                = "SELECT  * from anhos_disponibles();";
       
        ResultSet result = st.executeQuery(sql);
       
        while(result.next()){
            op.addItem(result.getString("anho"));
        }
           
            
            
        
        }catch(Exception e){
               System.out.println("error al traer los anhos");
        }
            
        
    }
            
 }
    
