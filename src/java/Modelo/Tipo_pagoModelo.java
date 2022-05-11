/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Configuracion.Conexion;
import Entidad.Ruta;
import Entidad.TipoPago;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Desarrollo2
 */
public class Tipo_pagoModelo {
 Connection conexion = Conexion.getConnection();    
    private int ResultadoConsulta;
    private boolean ExitoConsulta = false;
    ResultSet rs;
    TipoPago tipo = new TipoPago();
        public TipoPago MostrarTipo(int id) {
        
        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM tipopago where id_Tipo = ? ");
            ps.setInt(1,id );
            rs = ps.executeQuery();
            if (rs.next()) {                 
                tipo.setId_tipo(rs.getInt(1));
                tipo.setDescrip(rs.getString(2));
                tipo.setNro_dias(rs.getString(3));
                tipo.setEstado(rs.getString(4));  
            }
        } catch (Exception Ex) {
        }
        return tipo;
    }
 
    public List MostrarTipo() {
        ArrayList<TipoPago> DatosTIPO = new ArrayList<>();
        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM tipopago ");
               rs = ps.executeQuery();
            while (rs.next()) {        
                TipoPago tipo_P = new TipoPago();
                 tipo_P.setId_tipo(rs.getInt(1));
                tipo_P.setDescrip(rs.getString(2));
                tipo_P.setNro_dias(rs.getString(3));
                tipo_P.setEstado(rs.getString(4));    
                DatosTIPO.add(tipo_P);
            }
        } catch (Exception Ex) {
        }
        return DatosTIPO;
    }
}
