package Modelo;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Configuracion.Conexion;
import Entidad.Camiones;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Desarrollo2
 */
public class CamionesModelo extends HttpServlet {
    
Connection conexion = Conexion.getConnection();
Camiones Camiones = new Camiones();
ResultSet rs;
 private int ResultadoConsulta;
 private boolean ExitoConsulta = false;

public List MostrarCamiones() {
        ArrayList<Camiones> DatosCamion = new ArrayList<>();
        try {
          PreparedStatement ps = conexion.prepareStatement("SELECT * FROM camiones ");   
           rs = ps.executeQuery();
            while (rs.next()) {
                Camiones Camiones1 = new Camiones();
                Camiones1.setId_Ca(rs.getInt(1));
                Camiones1.setPlaca(rs.getString(2));
                Camiones1.setMarca(rs.getString(3));
                Camiones1.setCertificado(rs.getString(4));
                Camiones1.setConfig_vehicular(rs.getString(5));
                Camiones1.setCarga_max(rs.getString(6));
                DatosCamion.add(Camiones1);
            }
        } catch (Exception Ex) {
        }
        return DatosCamion;
    }
 public Camiones MostrarCamion(int id) {
        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM camiones where id_Ca = ? ");
            ps.setInt(1,id );
            rs = ps.executeQuery();
            if (rs.next()) {
                Camiones.setId_Ca(rs.getInt(1));
                Camiones.setPlaca(rs.getString(2));
                Camiones.setMarca(rs.getString(3));
                Camiones.setCertificado(rs.getString(4));
                Camiones.setConfig_vehicular(rs.getString(5));
                Camiones.setCarga_max(rs.getString(6));
                //Persona.ColocarTipo(rs.getByte(7));
            }
        } catch (Exception Ex) {
        }
        return Camiones;
    }
 
 
  public boolean RegistrarCamion(Camiones DatosCamion) throws SQLException, IOException {        
             
                PreparedStatement ps4 = conexion.prepareStatement("INSERT INTO camiones(Placa, Marca, Certificado, Config_Vehicular, Carga_Max) VALUES (?,?,?,?,?)");
              
                ps4.setString(1, DatosCamion.getPlaca());
                ps4.setString(2, DatosCamion.getMarca());
                ps4.setString(3, DatosCamion.getCertificado());
                ps4.setString(4, DatosCamion.getConfig_vehicular());
                ps4.setString(5, DatosCamion.getCarga_max());
              
                ResultadoConsulta = ps4.executeUpdate();
                if (ResultadoConsulta > 0) {
                    ExitoConsulta = true;
                
            } else {
                ExitoConsulta = false;
            }
       
        return ExitoConsulta;
    }
    public boolean EliminarCamion(int id) throws SQLException {
        PreparedStatement ps = conexion.prepareStatement("DELETE FROM camiones WHERE id_Ca = ? ");
        ps.setInt(1,id );
        ResultadoConsulta = ps.executeUpdate();
        if (ResultadoConsulta > 0) {
            ExitoConsulta = true;
        }
        return ExitoConsulta;
    }
  public boolean ModificarCamion(Camiones DatosCamion) throws SQLException, IOException {
       
            PreparedStatement ps = conexion.prepareStatement("UPDATE camiones SET Placa = ? ,Marca = ? ,Certificado = ? ,Config_Vehicular = ? ,Carga_Max = ? WHERE id_Ca = ? ");
            ps.setString(1, DatosCamion.getPlaca());
            ps.setString(2, DatosCamion.getMarca());
            ps.setString(3, DatosCamion.getCertificado());
            ps.setString(4, DatosCamion.getConfig_vehicular());
            ps.setString(5, DatosCamion.getCarga_max());
            ps.setInt(6, DatosCamion.getId_Ca());
            ResultadoConsulta = ps.executeUpdate();
        
        if (ResultadoConsulta > 0) {
            ExitoConsulta = true;
        }
        return ExitoConsulta;
    }
}
