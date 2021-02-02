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
public class Reporte5_vista extends javax.swing.JFrame {

    
    control con = new control();
    
    int contador = 0;
    ArrayList<Reporte16> lista = new ArrayList<Reporte16>();
    
    ReportesConexion reporte_conexion = new ReportesConexion();
   // ArrayList<Participante> lista = new ArrayList<Participante>();
    private String nombre;
    
    
  public Reporte5_vista() {
        initComponents();
        
        con.iniciaVentana(this);
       
        this.setLocationRelativeTo(this);
            this.setSize(1800,1800);
       
        btnsiguiente1.setVisible(false);
        btnanterior.setVisible(false);
         
        con.llenarComboNombres(combo_nombres);
        
       
          
    }

   
    
    
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        btnCerrar = new javax.swing.JButton();
        etiquetaTiempo = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        txt_nacionalidad_equipo = new javax.swing.JLabel();
        txt_categoria = new javax.swing.JLabel();
        jButton1 = new javax.swing.JButton();
        txtnumero_equipo = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        txt_fabricante = new javax.swing.JLabel();
        txt_piloto2 = new javax.swing.JLabel();
        etiquetaTiempo1 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        txt_nombre = new javax.swing.JLabel();
        txt_apellido = new javax.swing.JLabel();
        txt_nacionalidad = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        txt_primera_participacion = new javax.swing.JLabel();
        txt_numero_participaciones = new javax.swing.JLabel();
        txt_podium1 = new javax.swing.JLabel();
        btnanterior = new javax.swing.JButton();
        btnsiguiente1 = new javax.swing.JButton();
        nohay = new javax.swing.JLabel();
        jLabel15 = new javax.swing.JLabel();
        etiquetaTiempo3 = new javax.swing.JLabel();
        jLabel17 = new javax.swing.JLabel();
        txt_fecha_nacimiento = new javax.swing.JLabel();
        jLabel19 = new javax.swing.JLabel();
        txt_fecha_fallecimiento = new javax.swing.JLabel();
        jLabel20 = new javax.swing.JLabel();
        txt_edad = new javax.swing.JLabel();
        txt_podium3 = new javax.swing.JLabel();
        jLabel21 = new javax.swing.JLabel();
        jLabel22 = new javax.swing.JLabel();
        txtano = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        txt_nombre_equipo = new javax.swing.JLabel();
        jLabel23 = new javax.swing.JLabel();
        jLabel24 = new javax.swing.JLabel();
        etiquetaTiempo4 = new javax.swing.JLabel();
        txt_piloto1 = new javax.swing.JLabel();
        etiquetaTiempo6 = new javax.swing.JLabel();
        combo_nombres = new javax.swing.JComboBox<>();
        etiquetaTiempo7 = new javax.swing.JLabel();
        combo_apellidos = new javax.swing.JComboBox<>();
        etiquetaTiempo2 = new javax.swing.JLabel();
        jLabel25 = new javax.swing.JLabel();
        txt_motor = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        txt_modelo = new javax.swing.JLabel();
        jLabel26 = new javax.swing.JLabel();
        txt_podium2 = new javax.swing.JLabel();
        etiquetaTiempo5 = new javax.swing.JLabel();

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
        jPanel1.add(btnCerrar, new org.netbeans.lib.awtextra.AbsoluteConstraints(1240, 10, 43, 45));

        etiquetaTiempo.setFont(new java.awt.Font("Lucida Sans", 0, 36)); // NOI18N
        etiquetaTiempo.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        etiquetaTiempo.setText("Datos del Auto");
        jPanel1.add(etiquetaTiempo, new org.netbeans.lib.awtextra.AbsoluteConstraints(750, 440, 260, 90));

        jLabel1.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel1.setText("Nacionalidad:");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(1030, 390, 160, 40));

        txt_nacionalidad_equipo.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_nacionalidad_equipo, new org.netbeans.lib.awtextra.AbsoluteConstraints(1180, 390, 200, 40));

        txt_categoria.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_categoria, new org.netbeans.lib.awtextra.AbsoluteConstraints(640, 540, 290, 40));

        jButton1.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jButton1.setText("Buscar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(970, 70, 120, 50));

        txtnumero_equipo.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txtnumero_equipo, new org.netbeans.lib.awtextra.AbsoluteConstraints(1130, 310, 110, 40));

        jLabel6.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel6.setText("Fabricante:");
        jPanel1.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(520, 580, 130, 40));

        txt_fabricante.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_fabricante, new org.netbeans.lib.awtextra.AbsoluteConstraints(640, 580, 290, 40));

        txt_piloto2.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_piloto2, new org.netbeans.lib.awtextra.AbsoluteConstraints(980, 700, 380, 40));

        etiquetaTiempo1.setFont(new java.awt.Font("Lucida Sans", 0, 24)); // NOI18N
        etiquetaTiempo1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        etiquetaTiempo1.setText("Tabla detallada de las participaciones");
        jPanel1.add(etiquetaTiempo1, new org.netbeans.lib.awtextra.AbsoluteConstraints(870, 190, 480, 90));

        jLabel8.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel8.setText("Nombres:");
        jPanel1.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 280, 110, 40));

        jLabel9.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel9.setText("Apellidos:");
        jPanel1.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 320, 120, 40));

        jLabel2.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel2.setText("Nacionalidad:");
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 360, 160, 40));

        txt_nombre.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_nombre, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 280, 300, 40));

        txt_apellido.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_apellido, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 320, 290, 40));

        txt_nacionalidad.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_nacionalidad, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 360, 280, 40));

        jLabel10.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel10.setText("Año de la primera participación:");
        jPanel1.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 550, 350, 40));

        jLabel11.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel11.setText("Número total de participaciones:");
        jPanel1.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 590, 360, 40));

        jLabel12.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel12.setText("Victorias:");
        jPanel1.add(jLabel12, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 630, 110, 40));

        txt_primera_participacion.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_primera_participacion, new org.netbeans.lib.awtextra.AbsoluteConstraints(400, 550, 190, 40));

        txt_numero_participaciones.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_numero_participaciones, new org.netbeans.lib.awtextra.AbsoluteConstraints(410, 590, 110, 40));

        txt_podium1.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_podium1, new org.netbeans.lib.awtextra.AbsoluteConstraints(160, 630, 80, 40));

        btnanterior.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        btnanterior.setText("Anterior");
        btnanterior.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnanteriorActionPerformed(evt);
            }
        });
        jPanel1.add(btnanterior, new org.netbeans.lib.awtextra.AbsoluteConstraints(860, 130, 170, 50));

        btnsiguiente1.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        btnsiguiente1.setText("Siguiente");
        btnsiguiente1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnsiguiente1ActionPerformed(evt);
            }
        });
        jPanel1.add(btnsiguiente1, new org.netbeans.lib.awtextra.AbsoluteConstraints(1060, 130, 170, 50));

        nohay.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        nohay.setForeground(new java.awt.Color(255, 0, 51));
        jPanel1.add(nohay, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 210, 380, 40));

        jLabel15.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel15.setText("Datos del Equipo:");
        jPanel1.add(jLabel15, new org.netbeans.lib.awtextra.AbsoluteConstraints(1000, 270, 210, 40));

        etiquetaTiempo3.setFont(new java.awt.Font("Lucida Sans", 0, 36)); // NOI18N
        etiquetaTiempo3.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        etiquetaTiempo3.setText("Datos del Conductor");
        jPanel1.add(etiquetaTiempo3, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 210, 390, 90));

        jLabel17.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel17.setText("Fecha de Nacimiento:");
        jPanel1.add(jLabel17, new org.netbeans.lib.awtextra.AbsoluteConstraints(480, 270, 250, 40));

        txt_fecha_nacimiento.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_fecha_nacimiento, new org.netbeans.lib.awtextra.AbsoluteConstraints(720, 270, 260, 40));

        jLabel19.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel19.setText("Fecha de Fallecimiento:");
        jPanel1.add(jLabel19, new org.netbeans.lib.awtextra.AbsoluteConstraints(480, 320, 250, 40));

        txt_fecha_fallecimiento.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_fecha_fallecimiento, new org.netbeans.lib.awtextra.AbsoluteConstraints(740, 320, 270, 40));

        jLabel20.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel20.setText("Edad:");
        jPanel1.add(jLabel20, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 400, 70, 40));

        txt_edad.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_edad, new org.netbeans.lib.awtextra.AbsoluteConstraints(120, 400, 480, 40));

        txt_podium3.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_podium3, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 710, 80, 40));

        jLabel21.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel21.setText("Podium3:");
        jPanel1.add(jLabel21, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 710, 100, 40));

        jLabel22.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel22.setText("Año:");
        jPanel1.add(jLabel22, new org.netbeans.lib.awtextra.AbsoluteConstraints(1590, 250, 70, 40));

        txtano.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txtano, new org.netbeans.lib.awtextra.AbsoluteConstraints(1640, 250, 180, 40));

        jLabel13.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel13.setText("Nombre:");
        jPanel1.add(jLabel13, new org.netbeans.lib.awtextra.AbsoluteConstraints(1030, 350, 100, 40));

        txt_nombre_equipo.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_nombre_equipo, new org.netbeans.lib.awtextra.AbsoluteConstraints(1130, 350, 280, 40));

        jLabel23.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel23.setText("Numero:");
        jPanel1.add(jLabel23, new org.netbeans.lib.awtextra.AbsoluteConstraints(1030, 310, 100, 40));

        jLabel24.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel24.setText("Categoria:");
        jPanel1.add(jLabel24, new org.netbeans.lib.awtextra.AbsoluteConstraints(520, 540, 110, 40));

        etiquetaTiempo4.setFont(new java.awt.Font("Lucida Sans", 0, 36)); // NOI18N
        etiquetaTiempo4.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        etiquetaTiempo4.setText("Datos relevantes ");
        jPanel1.add(etiquetaTiempo4, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 460, 390, 90));

        txt_piloto1.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_piloto1, new org.netbeans.lib.awtextra.AbsoluteConstraints(560, 700, 370, 40));

        etiquetaTiempo6.setFont(new java.awt.Font("Lucida Sans", 0, 36)); // NOI18N
        etiquetaTiempo6.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        etiquetaTiempo6.setText("Nombres de Pilotos");
        jPanel1.add(etiquetaTiempo6, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 20, 360, 90));

        combo_nombres.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        combo_nombres.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                combo_nombresMouseClicked(evt);
            }
        });
        combo_nombres.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                combo_nombresActionPerformed(evt);
            }
        });
        jPanel1.add(combo_nombres, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 100, 340, 40));

        etiquetaTiempo7.setFont(new java.awt.Font("Lucida Sans", 0, 36)); // NOI18N
        etiquetaTiempo7.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        etiquetaTiempo7.setText("Apellidos de Pilotos");
        jPanel1.add(etiquetaTiempo7, new org.netbeans.lib.awtextra.AbsoluteConstraints(450, 20, 360, 90));

        combo_apellidos.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        combo_apellidos.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                combo_apellidosActionPerformed(evt);
            }
        });
        jPanel1.add(combo_apellidos, new org.netbeans.lib.awtextra.AbsoluteConstraints(460, 100, 340, 40));

        etiquetaTiempo2.setFont(new java.awt.Font("Lucida Sans", 0, 36)); // NOI18N
        etiquetaTiempo2.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        etiquetaTiempo2.setText("Piloto 3");
        jPanel1.add(etiquetaTiempo2, new org.netbeans.lib.awtextra.AbsoluteConstraints(930, 630, 260, 90));

        jLabel25.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel25.setText("Motor:");
        jPanel1.add(jLabel25, new org.netbeans.lib.awtextra.AbsoluteConstraints(970, 540, 70, 40));

        txt_motor.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_motor, new org.netbeans.lib.awtextra.AbsoluteConstraints(1050, 540, 330, 40));

        jLabel7.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel7.setText("Modelo:");
        jPanel1.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(970, 580, 110, 40));

        txt_modelo.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_modelo, new org.netbeans.lib.awtextra.AbsoluteConstraints(1060, 580, 320, 40));

        jLabel26.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel26.setText("Podium2:");
        jPanel1.add(jLabel26, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 670, 100, 40));

        txt_podium2.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jPanel1.add(txt_podium2, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 670, 80, 40));

        etiquetaTiempo5.setFont(new java.awt.Font("Lucida Sans", 0, 36)); // NOI18N
        etiquetaTiempo5.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        etiquetaTiempo5.setText("Piloto 2");
        jPanel1.add(etiquetaTiempo5, new org.netbeans.lib.awtextra.AbsoluteConstraints(520, 630, 260, 90));

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(-10, 0, 1570, 910));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCerrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCerrarActionPerformed
        Principal ventana = new  Principal();
                   con.activaVentana(ventana, this);  
                   
    }//GEN-LAST:event_btnCerrarActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed

        try{
            nohay.setText("");
        btnsiguiente1.setVisible(true);
        btnanterior.setVisible(true);
        
      String nombre = combo_nombres.getSelectedItem().toString();
      
      String apellido = combo_apellidos.getSelectedItem().toString();
      
      this.lista = reporte_conexion.reporte5(nombre,apellido);
  
        mostrar();
        
        }catch(Exception e){
            nohay.setText("No hay Registros de esta Busqueda");
        }
        
    }//GEN-LAST:event_jButton1ActionPerformed

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

    private void combo_nombresActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_combo_nombresActionPerformed
      
        combo_apellidos.removeAllItems();
        
        this.nombre = combo_nombres.getSelectedItem().toString();
       
       con.llenarComboApellidos(nombre,combo_apellidos);
    }//GEN-LAST:event_combo_nombresActionPerformed

    private void combo_apellidosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_combo_apellidosActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_combo_apellidosActionPerformed

    private void combo_nombresMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_combo_nombresMouseClicked
        
       
    }//GEN-LAST:event_combo_nombresMouseClicked

   
    
    public void mostrar(){
      
        txt_nombre_equipo.setText(lista.get(contador).getNombre_equipo());
        txtnumero_equipo.setText(Integer.toString(lista.get(contador).getNumero_equipo()));
        txt_nacionalidad_equipo.setText(lista.get(contador).getPais_equipo());
        
        txt_fecha_nacimiento.setText(lista.get(contador).getFecha_nacimiento());
        txt_fecha_fallecimiento.setText(lista.get(contador).getFecha_fallecimiento());
        
        txt_primera_participacion.setText(lista.get(contador).getPrimera_participacion());
        txt_numero_participaciones.setText(lista.get(contador).getParticipaciones_totales());
        txt_podium1.setText(lista.get(contador).getPodium1());
        txt_podium2.setText(lista.get(contador).getPodium2());
        txt_podium3.setText(lista.get(contador).getPodium3());
        
        DecimalFormat df = new DecimalFormat("#0.00");
             
        
        txt_fabricante.setText(lista.get(contador).getFabricante());
        txt_modelo.setText(lista.get(contador).getModelo());
        txt_motor.setText(lista.get(contador).getMotor());
        txt_categoria.setText(lista.get(contador).getCategoria());
        
        
       
        txt_nombre.setText(lista.get(contador).getNombre_piloto());
        txt_apellido.setText(lista.get(contador).getApellido());
        txt_edad.setText(lista.get(contador).getEdad());
        
        txt_nacionalidad.setText(lista.get(contador).getNacionalidad());
        
        String nombres = lista.get(contador).getCorredores();
        String primer_piloto = "";
        String segundo_piloto = "";
        
       
                int o = 0;
        
        for(int i = 0; i< nombres.length();i++){
            if(nombres.charAt(i) == '-'){
                 primer_piloto =nombres.substring(o,i-1);
                 o= i+1;
                 txt_piloto1.setText(primer_piloto);
                 break;
            }
        }
       primer_piloto = nombres.substring(o,nombres.length());
        txt_piloto2.setText(primer_piloto);
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
            java.util.logging.Logger.getLogger(Reporte5_vista.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Reporte5_vista.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Reporte5_vista.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Reporte5_vista.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
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

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Reporte5_vista().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCerrar;
    private javax.swing.JButton btnanterior;
    private javax.swing.JButton btnsiguiente1;
    private javax.swing.JComboBox<String> combo_apellidos;
    private javax.swing.JComboBox<String> combo_nombres;
    private javax.swing.JLabel etiquetaTiempo;
    private javax.swing.JLabel etiquetaTiempo1;
    private javax.swing.JLabel etiquetaTiempo2;
    private javax.swing.JLabel etiquetaTiempo3;
    private javax.swing.JLabel etiquetaTiempo4;
    private javax.swing.JLabel etiquetaTiempo5;
    private javax.swing.JLabel etiquetaTiempo6;
    private javax.swing.JLabel etiquetaTiempo7;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel19;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel22;
    private javax.swing.JLabel jLabel23;
    private javax.swing.JLabel jLabel24;
    private javax.swing.JLabel jLabel25;
    private javax.swing.JLabel jLabel26;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel nohay;
    private javax.swing.JLabel txt_apellido;
    private javax.swing.JLabel txt_categoria;
    private javax.swing.JLabel txt_edad;
    private javax.swing.JLabel txt_fabricante;
    private javax.swing.JLabel txt_fecha_fallecimiento;
    private javax.swing.JLabel txt_fecha_nacimiento;
    private javax.swing.JLabel txt_modelo;
    private javax.swing.JLabel txt_motor;
    private javax.swing.JLabel txt_nacionalidad;
    private javax.swing.JLabel txt_nacionalidad_equipo;
    private javax.swing.JLabel txt_nombre;
    private javax.swing.JLabel txt_nombre_equipo;
    private javax.swing.JLabel txt_numero_participaciones;
    private javax.swing.JLabel txt_piloto1;
    private javax.swing.JLabel txt_piloto2;
    private javax.swing.JLabel txt_podium1;
    private javax.swing.JLabel txt_podium2;
    private javax.swing.JLabel txt_podium3;
    private javax.swing.JLabel txt_primera_participacion;
    private javax.swing.JLabel txtano;
    private javax.swing.JLabel txtnumero_equipo;
    // End of variables declaration//GEN-END:variables
}