/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Configuracion.Conexion;

import Entidad.Ruta;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Desarrollo2
 */
public class RutasModelo {
    Connection conexion = Conexion.getConnection();    
    private int ResultadoConsulta;
    private boolean ExitoConsulta = false;
    ResultSet rs;
 Ruta ruta2= new Ruta();
    
    
    public Ruta MostrarRuta(int id) {
        
        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT id_Ruta, Destino, Abreviatura, Direccion FROM rutas where id_Ruta = ? ");
            ps.setInt(1,id );
            rs = ps.executeQuery();
            if (rs.next()) {                 
                ruta2.setId_ruta(rs.getInt(1));
                ruta2.setDestino(rs.getString(2));
                ruta2.setAbreviatura(rs.getString(3));
                ruta2.setDireccion(rs.getString(4));  
            }
        } catch (Exception Ex) {
        }
        return ruta2;
    }
 
    public List MostrarRutas() {
        ArrayList<Ruta> Datosruta = new ArrayList<>();
        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT id_Ruta, Destino, Abreviatura, Direccion FROM rutas ");
               rs = ps.executeQuery();
            while (rs.next()) {        
                Ruta ruta1 = new Ruta();
                ruta1.setId_ruta(rs.getInt(1));
                ruta1.setDestino(rs.getString(2));
                ruta1.setAbreviatura(rs.getString(3));
                ruta1.setDireccion(rs.getString(4));   
                Datosruta.add(ruta1);
            }
        } catch (Exception Ex) {
        }
        return Datosruta;
    }
        public boolean RegistrarRuta(Ruta DatosRuta) throws SQLException, IOException {
        PreparedStatement ps = conexion.prepareStatement("INSERT INTO rutas (Destino, Abreviatura, Direccion, img) VALUES (?,?,?,?)");
        ps.setString(1, DatosRuta.getDestino());
        ps.setString(2, DatosRuta.getAbreviatura());
        ps.setString(3, DatosRuta.getDireccion());       
        ps.setBlob(4, DatosRuta.ObtenerImagen());     
        ResultadoConsulta = ps.executeUpdate();
        if (ResultadoConsulta > 0) {
            ExitoConsulta = true;
        }
        return ExitoConsulta;
    }
        
}
