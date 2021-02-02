/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista;

import Clases.Carrera;
import Clases.Reporte1;
import Clases.Reporte16;
import Clases.Reporte4;

import conexion.Reporte1Conexion;
import conexion.ParticipanteConexion;
import conexion.ReportesConexion;
import control.control;
import javax.swing.table.TableColumnModel;


import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Time;
import java.text.DecimalFormat;
import java.util.ArrayList;
import javax.swing.Timer;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author RojeruSan
 */
public class Reporte16_vista extends javax.swing.JFrame {

    
    control con = new control();
    
    ArrayList<Reporte16> lista = new ArrayList<Reporte16>();
    
    ReportesConexion reporte_conexion = new ReportesConexion();
    
    
    int contador = 0;
    int id_donde_termina = 0;
    int id_anterior = 0;
    int numero_evento_viejo = 0;
   
    
  public Reporte16_vista() {
        initComponents();
        
        con.iniciaVentana(this);
       
        this.setLocationRelativeTo(this);
            this.setSize(1800,1800);
        btnsiguiente1.setVisible(false);
        btnanterior.setVisible(false);
         
         con.llenarComboAno(combo_ano);
          
    }

    
    
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup1 = new javax.swing.ButtonGroup();
        jPanel1 = new javax.swing.JPanel();
        btnCerrar = new javax.swing.JButton();
        etiquetaTiempo = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        txt_nacionalidad_equipo = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        txt_nombre_equipo = new javax.swing.JLabel();
        combo_ano = new javax.swing.JComboBox<>();
        jButton1 = new javax.swing.JButton();
        jLabel5 = new javax.swing.JLabel();
        txtnumero_equipo = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        txt_ano_participacion = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        txt_nombre_conductor = new javax.swing.JLabel();
        txt_apellido = new javax.swing.JLabel();
        txt_nacionalidad_conductor = new javax.swing.JLabel();
        etiquetaTiempo2 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        txt_fabricante = new javax.swing.JLabel();
        txt_motor = new javax.swing.JLabel();
        txt_categoria = new javax.swing.JLabel();
        nohay = new javax.swing.JLabel();
        jLabel15 = new javax.swing.JLabel();
        txt_nombre2 = new javax.swing.JLabel();
        jLabel18 = new javax.swing.JLabel();
        txt_nombre3 = new javax.swing.JLabel();
        etiquetaTiempo3 = new javax.swing.JLabel();
        jLabel21 = new javax.swing.JLabel();
        txt_numero_participaciones = new javax.swing.JLabel();
        jLabel22 = new javax.swing.JLabel();
        txt_podium1 = new javax.swing.JLabel();
        jLabel23 = new javax.swing.JLabel();
        txt_podium2 = new javax.swing.JLabel();
        etiquetaTiempo4 = new javax.swing.JLabel();
        jLabel26 = new javax.swing.JLabel();
        btnanterior = new javax.swing.JButton();
        btnsiguiente1 = new javax.swing.JButton();
        txt_modelo = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        txt_podium3 = new javax.swing.JLabel();
        jLabel24 = new javax.swing.JLabel();
        etiquetaTiempo5 = new javax.swing.JLabel();
        etiquetaTiempo6 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setUndecorated(true);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(255, 255, 255), 5));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        btnCerrar.setBackground(new java.awt.Color(0, 153, 204));
        btnCerrar.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        btnCerrar.setForeground(new java.awt.Color(255, 255, 255));
        btnCerrar.setText("X");
        btnCerrar.setBorder(null);
        btnCerrar.setContentAreaFilled(false);
        btnCerrar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnCerrar.setOpaque(true);
        btnCerrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCerrarActionPerformed(evt);
            }
        });
        jPanel1.add(btnCerrar, new org.netbeans.lib.awtextra.AbsoluteConstraints(1400, 30, 43, 45));

        etiquetaTiempo.setFont(new java.awt.Font("Lucida Sans", 0, 36)); // NOI18N
        etiquetaTiempo.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        etiquetaTiempo.setText("Datos del Automovil");
        jPanel1.add(etiquetaTiempo, new org.netbeans.lib.awtextra.AbsoluteConstraints(880, 170, 390, 90));

        jLabel1.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel1.setText("Nacionalidad:");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 200, 160, 40));

        txt_nacionalidad_equipo.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_nacionalidad_equipo, new org.netbeans.lib.awtextra.AbsoluteConstraints(330, 200, 550, 40));

        jLabel3.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel3.setText("Nombre:");
        jPanel1.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 160, 100, 40));

        txt_nombre_equipo.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_nombre_equipo, new org.netbeans.lib.awtextra.AbsoluteConstraints(280, 160, 450, 40));

        combo_ano.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        combo_ano.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccionar", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020" }));
        combo_ano.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                combo_anoActionPerformed(evt);
            }
        });
        jPanel1.add(combo_ano, new org.netbeans.lib.awtextra.AbsoluteConstraints(690, 100, 250, 40));

        jButton1.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jButton1.setText("Buscar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(1140, 50, 120, 50));

        jLabel5.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel5.setText("Numero de Equipo:");
        jPanel1.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 120, 210, 40));

        txtnumero_equipo.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txtnumero_equipo, new org.netbeans.lib.awtextra.AbsoluteConstraints(400, 120, 180, 40));

        jLabel6.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel6.setText("Posición:");
        jPanel1.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 310, 110, 40));

        txt_ano_participacion.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_ano_participacion, new org.netbeans.lib.awtextra.AbsoluteConstraints(500, 350, 200, 40));

        jLabel8.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel8.setText("Nombres:");
        jPanel1.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 640, 110, 40));

        jLabel9.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel9.setText("Apellidos:");
        jPanel1.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 680, 120, 40));

        jLabel2.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel2.setText("Nacionalidad:");
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 720, 160, 40));

        txt_nombre_conductor.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_nombre_conductor, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 640, 310, 40));

        txt_apellido.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_apellido, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 680, 330, 40));

        txt_nacionalidad_conductor.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_nacionalidad_conductor, new org.netbeans.lib.awtextra.AbsoluteConstraints(350, 720, 280, 40));

        etiquetaTiempo2.setFont(new java.awt.Font("Lucida Sans", 0, 36)); // NOI18N
        etiquetaTiempo2.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        etiquetaTiempo2.setText("Datos de la Piloto");
        jPanel1.add(etiquetaTiempo2, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 560, 450, 90));

        jLabel10.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel10.setText("Fabricante:");
        jPanel1.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(750, 260, 130, 40));

        jLabel11.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel11.setText("Motor:");
        jPanel1.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(750, 300, 90, 40));

        jLabel12.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel12.setText("Categoría:");
        jPanel1.add(jLabel12, new org.netbeans.lib.awtextra.AbsoluteConstraints(750, 340, 130, 40));

        txt_fabricante.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_fabricante, new org.netbeans.lib.awtextra.AbsoluteConstraints(880, 260, 210, 40));

        txt_motor.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_motor, new org.netbeans.lib.awtextra.AbsoluteConstraints(830, 300, 500, 40));

        txt_categoria.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_categoria, new org.netbeans.lib.awtextra.AbsoluteConstraints(870, 340, 390, 40));

        nohay.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        nohay.setForeground(new java.awt.Color(255, 0, 51));
        jPanel1.add(nohay, new org.netbeans.lib.awtextra.AbsoluteConstraints(590, 110, 380, 40));

        jLabel15.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel15.setText("Nombres:");
        jPanel1.add(jLabel15, new org.netbeans.lib.awtextra.AbsoluteConstraints(640, 640, 110, 40));

        txt_nombre2.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_nombre2, new org.netbeans.lib.awtextra.AbsoluteConstraints(750, 640, 290, 40));

        jLabel18.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel18.setText("Nombres:");
        jPanel1.add(jLabel18, new org.netbeans.lib.awtextra.AbsoluteConstraints(1070, 640, 110, 40));

        txt_nombre3.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_nombre3, new org.netbeans.lib.awtextra.AbsoluteConstraints(1190, 640, 410, 40));

        etiquetaTiempo3.setFont(new java.awt.Font("Lucida Sans", 0, 36)); // NOI18N
        etiquetaTiempo3.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        etiquetaTiempo3.setText("Datos del Equipo");
        jPanel1.add(etiquetaTiempo3, new org.netbeans.lib.awtextra.AbsoluteConstraints(160, 30, 320, 90));

        jLabel21.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel21.setText("Número total de participaciones:");
        jPanel1.add(jLabel21, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 390, 360, 40));

        txt_numero_participaciones.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_numero_participaciones, new org.netbeans.lib.awtextra.AbsoluteConstraints(530, 390, 200, 40));

        jLabel22.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel22.setText("Victorias:");
        jPanel1.add(jLabel22, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 430, 110, 40));

        txt_podium1.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_podium1, new org.netbeans.lib.awtextra.AbsoluteConstraints(280, 430, 200, 40));

        jLabel23.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel23.setText("Pódium 2:");
        jPanel1.add(jLabel23, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 470, 110, 40));

        txt_podium2.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_podium2, new org.netbeans.lib.awtextra.AbsoluteConstraints(280, 470, 110, 40));

        etiquetaTiempo4.setFont(new java.awt.Font("Lucida Sans", 0, 36)); // NOI18N
        etiquetaTiempo4.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        etiquetaTiempo4.setText("Datos Relevantes");
        jPanel1.add(etiquetaTiempo4, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 270, 400, 90));

        jLabel26.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel26.setText("Año de primera participación:");
        jPanel1.add(jLabel26, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 350, 320, 40));

        btnanterior.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        btnanterior.setText("Anterior");
        btnanterior.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnanteriorActionPerformed(evt);
            }
        });
        jPanel1.add(btnanterior, new org.netbeans.lib.awtextra.AbsoluteConstraints(1030, 110, 170, 50));

        btnsiguiente1.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        btnsiguiente1.setText("Siguiente");
        btnsiguiente1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnsiguiente1ActionPerformed(evt);
            }
        });
        jPanel1.add(btnsiguiente1, new org.netbeans.lib.awtextra.AbsoluteConstraints(1230, 110, 170, 50));

        txt_modelo.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_modelo, new org.netbeans.lib.awtextra.AbsoluteConstraints(1190, 260, 300, 40));

        jLabel13.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel13.setText("Modelo:");
        jPanel1.add(jLabel13, new org.netbeans.lib.awtextra.AbsoluteConstraints(1100, 260, 90, 40));

        txt_podium3.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_podium3, new org.netbeans.lib.awtextra.AbsoluteConstraints(280, 510, 110, 40));

        jLabel24.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel24.setText("Pódium 3:");
        jPanel1.add(jLabel24, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 510, 110, 40));

        etiquetaTiempo5.setFont(new java.awt.Font("Lucida Sans", 0, 36)); // NOI18N
        etiquetaTiempo5.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        etiquetaTiempo5.setText("Datos de los Compañeros");
        jPanel1.add(etiquetaTiempo5, new org.netbeans.lib.awtextra.AbsoluteConstraints(760, 540, 450, 90));

        etiquetaTiempo6.setFont(new java.awt.Font("Lucida Sans", 0, 36)); // NOI18N
        etiquetaTiempo6.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        etiquetaTiempo6.setText("Año");
        jPanel1.add(etiquetaTiempo6, new org.netbeans.lib.awtextra.AbsoluteConstraints(650, 10, 320, 90));

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(-130, 0, 1570, 910));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCerrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCerrarActionPerformed
        Principal ventana = new  Principal();
                   con.activaVentana(ventana, this);  
                   
    }//GEN-LAST:event_btnCerrarActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed

        try{
            nohay.setText("");
     
        
       String ano = combo_ano.getSelectedItem().toString();
        
      
        this.lista = reporte_conexion.reporte16(ano);
        
        mostrar();
        
        if(lista.size() > 1)
             btnsiguiente1.setVisible(true);
        
        }catch(Exception e){
            nohay.setText("No hay Registros de esta Busqueda");
        }
        
    }//GEN-LAST:event_jButton1ActionPerformed

    private void combo_anoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_combo_anoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_combo_anoActionPerformed

    private void btnanteriorActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnanteriorActionPerformed
        this.contador --;
        btnsiguiente1.setVisible(true);
        try{
            mostrar();
        }catch(Exception e){
            btnanterior.setVisible(false);
        }
    }//GEN-LAST:event_btnanteriorActionPerformed

    private void btnsiguiente1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnsiguiente1ActionPerformed
        this.contador ++;
        btnanterior.setVisible(true);
        try{
           mostrar();
        }catch(Exception e){
            btnsiguiente1.setVisible(false);
        }
    }//GEN-LAST:event_btnsiguiente1ActionPerformed

    
    
 
    
    
    public void mostrar(){
      
        txt_nombre_equipo.setText(lista.get(contador).getNombre_equipo());
        txtnumero_equipo.setText(Integer.toString(lista.get(contador).getNumero_equipo()));
        txt_nacionalidad_equipo.setText(lista.get(contador).getPais_equipo());
        
        txt_ano_participacion.setText(lista.get(contador).getPrimera_participacion());
        txt_numero_participaciones.setText(lista.get(contador).getParticipaciones_totales());
        txt_podium1.setText(lista.get(contador).getPodium1());
        txt_podium2.setText(lista.get(contador).getPodium2());
        txt_podium3.setText(lista.get(contador).getPodium3());
        
        DecimalFormat df = new DecimalFormat("#0.00");
             
        
        txt_fabricante.setText(lista.get(contador).getFabricante());
        txt_modelo.setText(lista.get(contador).getModelo());
        txt_motor.setText(lista.get(contador).getMotor());
        txt_categoria.setText(lista.get(contador).getCategoria());
        
        
       
        txt_nombre_conductor.setText(lista.get(contador).getNombre_piloto());
        txt_apellido.setText(lista.get(contador).getApellido());
        
        
        txt_nacionalidad_conductor.setText(lista.get(contador).getNacionalidad());
        
        String nombres = lista.get(contador).getCorredores();
        String primer_piloto = "";
        String segundo_piloto = "";
        
       
                int o = 0;
        
        for(int i = 0; i< nombres.length();i++){
            if(nombres.charAt(i) == '-'){
                 primer_piloto =nombres.substring(o,i-1);
                 o= i+1;
                 txt_nombre2.setText(primer_piloto);
                 break;
            }
        }
       primer_piloto = nombres.substring(o,nombres.length());
        txt_nombre3.setText(primer_piloto);
        /*} else if ((piloto == 1) || (piloto == -1)){
             
                
                 txt_nombre_conductor1.setText(lista.get(contador+piloto).getNombre_piloto());

              //  txt_apellido1.setText(lista.get(contador+piloto).getApellido());
                
               // txt_nacionalidad_conductor1.setText(lista.get(contador+piloto).getNacionalidad());
        }
        else if ((piloto == 2) || (piloto == -2)){
             
                 txt_nombre_conductor2.setText(lista.get(contador+piloto).getNombre_piloto());
                 //txt_apellido2.setText(lista.get(contador+piloto).getApellido());
                
                //txt_nacionalidad_conductor2.setText(lista.get(contador+piloto).getNacionalidad());
        }
        */
       
    }
    
    
    
    
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Reporte16_vista.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Reporte16_vista.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Reporte16_vista.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Reporte16_vista.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Reporte16_vista().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCerrar;
    private javax.swing.JButton btnanterior;
    private javax.swing.JButton btnsiguiente1;
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.JComboBox<String> combo_ano;
    private javax.swing.JLabel etiquetaTiempo;
    private javax.swing.JLabel etiquetaTiempo2;
    private javax.swing.JLabel etiquetaTiempo3;
    private javax.swing.JLabel etiquetaTiempo4;
    private javax.swing.JLabel etiquetaTiempo5;
    private javax.swing.JLabel etiquetaTiempo6;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel18;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel22;
    private javax.swing.JLabel jLabel23;
    private javax.swing.JLabel jLabel24;
    private javax.swing.JLabel jLabel26;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel nohay;
    private javax.swing.JLabel txt_ano_participacion;
    private javax.swing.JLabel txt_apellido;
    private javax.swing.JLabel txt_categoria;
    private javax.swing.JLabel txt_fabricante;
    private javax.swing.JLabel txt_modelo;
    private javax.swing.JLabel txt_motor;
    private javax.swing.JLabel txt_nacionalidad_conductor;
    private javax.swing.JLabel txt_nacionalidad_equipo;
    private javax.swing.JLabel txt_nombre2;
    private javax.swing.JLabel txt_nombre3;
    private javax.swing.JLabel txt_nombre_conductor;
    private javax.swing.JLabel txt_nombre_equipo;
    private javax.swing.JLabel txt_numero_participaciones;
    private javax.swing.JLabel txt_podium1;
    private javax.swing.JLabel txt_podium2;
    private javax.swing.JLabel txt_podium3;
    private javax.swing.JLabel txtnumero_equipo;
    // End of variables declaration//GEN-END:variables
}
