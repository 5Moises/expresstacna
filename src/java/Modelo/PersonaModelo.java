package Modelo;

import Configuracion.Conexion;
import Entidad.Persona;
import Entidad.Persona;
import Entidad.Sede;
import Entidad.Usuario;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PersonaModelo {

    Connection conexion = Conexion.getConnection();
    Persona Persona = new Persona();    
    private int ResultadoConsulta;
    private boolean ExitoConsulta = false;
    ResultSet rs;
     ResultSet rs2;

    
    
    
    public List MostrarPersonasE() {
        ArrayList<Persona> DatosPersonaE = new ArrayList<>();
         
        try {
             //PreparedStatement ps = conexion.prepareStatement("select * from persona");
            PreparedStatement ps = conexion.prepareStatement("select persona.id_P, persona.DocIden, persona.Nombres, persona.Apellidos, usuario.Usuario, usuario.Contra, usuario.Rol, persona.Ocupacion,  persona.Brevete , sede.Sede from persona INNER join usuario on persona.id_U = usuario.id_U INNER join sede on sede.id_Sede = persona.id_Sede where persona.id_U is not null ");
               rs = ps.executeQuery();
            while (rs.next()) {        
                Persona persona1 = new Persona();                 
                persona1.setId_P(rs.getInt(1));
                persona1.setDocIden(rs.getString(2));
                persona1.setNombre(rs.getString(3));
                persona1.setApellidos(rs.getString(4));
                persona1.setUsuario(rs.getString(5));
                persona1.setContra(rs.getString(6));
                persona1.setRol(rs.getInt(7));
                persona1.setOcupacion(rs.getString(8));
                persona1.setBrevete(rs.getString(9));
                persona1.setSede(rs.getString(10));
               
                DatosPersonaE.add(persona1);                
            }
        } catch (Exception Ex) {
        }
        return DatosPersonaE;
    }
     public List MostrarSEDE() {
        ArrayList<Sede> DatosSede = new ArrayList<>();
        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM sede");
               rs = ps.executeQuery();
            while (rs.next()) {        
                Sede sede1 = new Sede();
              sede1.setId_Sede(rs.getInt(1));
              sede1.setSede(rs.getString(2));
               DatosSede.add(sede1);
            }
        } catch (Exception Ex) {
        }
        return DatosSede;
    }
    public List MostrarPersonas() {
        ArrayList<Persona> DatosPersona = new ArrayList<>();
        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT id_P, DocIden, Nombres, Apellidos, Ocupacion, Brevete, Razon_social, Direccion, Telefono, Email FROM persona where id_U is null ");
               rs = ps.executeQuery();
            while (rs.next()) {        
                Persona persona1 = new Persona();
                persona1.setId_P(rs.getInt(1));
                persona1.setDocIden(rs.getString(2));
                persona1.setNombre(rs.getString(3));
                persona1.setApellidos(rs.getString(4));
                persona1.setOcupacion(rs.getString(5));
                persona1.setBrevete(rs.getString(6));
                persona1.setRazon_Social(rs.getString(7));
                persona1.setDirecccion(rs.getString(8));
                persona1.setTelefono(rs.getString(9));
                persona1.setEmail(rs.getString(10));
                DatosPersona.add(persona1);
            }
        } catch (Exception Ex) {
        }
        return DatosPersona;
    }

    public Persona MostrarPersona(int id_p) {
        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT id_P, DocIden, Nombres, Apellidos, Razon_social, Direccion, Telefono, Email FROM Persona WHERE id_P = ? ");
            ps.setInt(1, id_p);
            rs = ps.executeQuery();
            if (rs.next()) {
                Persona.setId_P(rs.getInt(1));
                Persona.setDocIden(rs.getString(2));
                Persona.setNombre(rs.getString(3));
                Persona.setApellidos(rs.getString(4));
                Persona.setRazon_Social(rs.getString(5));
                Persona.setDirecccion(rs.getString(6));                
                Persona.setTelefono(rs.getString(7));
                Persona.setEmail(rs.getString(8));
                //Persona.ColocarTipo(rs.getByte(7));
            }
        } catch (Exception Ex) {
        }
        return Persona;
    }
    
    
     public boolean RegistrarEmpleado(Persona DatosPersona) throws SQLException, IOException {
       int id_U = 0;
        int id_S = 0;
        PreparedStatement ps4 = conexion.prepareStatement("INSERT INTO usuario(Usuario, Contra, Rol) VALUES (?,?,?)");
        ps4.setString(1, DatosPersona.getUsuario());
        ps4.setString(2, DatosPersona.getContra());
        ps4.setInt(3, DatosPersona.getRol());        
        ResultadoConsulta = ps4.executeUpdate();
        
          PreparedStatement ps = conexion.prepareStatement("SELECT id_U FROM usuario WHERE Usuario = ? ");
            ps.setString(1,  DatosPersona.getUsuario());
            rs = ps.executeQuery();
              if (rs.next()) {              
                id_U=rs.getInt(1);
              }
              
             PreparedStatement ps1 = conexion.prepareStatement("SELECT id_Sede FROM sede WHERE Sede = ? ");
            ps1.setString(1,  DatosPersona.getSede().trim());
            rs2 = ps1.executeQuery();
              if (rs2.next()) {          
                id_S=rs2.getInt(1);
              }
        
                
          PreparedStatement ps5 = conexion.prepareStatement("INSERT INTO persona(id_U, DocIden, Nombres, Apellidos, Ocupacion, Brevete, Estado, id_Sede) VALUES (?,?,?,?,?,?,1,?)");
          ps5.setInt(1, id_U);
          ps5.setString(2, DatosPersona.getDocIden());
          ps5.setString(3, DatosPersona.getNombre());
          ps5.setString(4, DatosPersona.getApellidos());
          ps5.setString(5, DatosPersona.getOcupacion());
          ps5.setString(6, DatosPersona.getBrevete());
          ps5.setInt(7, id_S);
          ResultadoConsulta = ps5.executeUpdate();
          
          if (ResultadoConsulta > 0) {
            ExitoConsulta = true;
        } else {
            ExitoConsulta = false;
        }
            return ExitoConsulta;
    }

     public boolean RegistrarCliente(Persona DatosPersona) throws SQLException, IOException {

        PreparedStatement ps4 = conexion.prepareStatement("INSERT INTO Persona(DocIden, Nombres, Apellidos, Razon_social, Direccion, Telefono, Email) VALUES (?,?,?,?,?,?,?)");
        ps4.setString(1, DatosPersona.getDocIden());
        ps4.setString(2, DatosPersona.getNombre());
        ps4.setString(3, DatosPersona.getApellidos());
        ps4.setString(4, DatosPersona.getRazon_Social());
        ps4.setString(5, DatosPersona.getDirecccion());
        ps4.setString(6, DatosPersona.getTelefono());
        ps4.setString(7, DatosPersona.getEmail());
        ResultadoConsulta = ps4.executeUpdate();
        if (ResultadoConsulta > 0) {
            ExitoConsulta = true;
        } else {
            ExitoConsulta = false;
        }
            return ExitoConsulta;
    }
    public boolean RegistrarClienteR(Persona DatosPersona) throws SQLException, IOException {

        PreparedStatement ps4 = conexion.prepareStatement("INSERT INTO Persona(DocIden, Nombres, Apellidos, Razon_social, Direccion) VALUES (?,?,?,?,?)");
        ps4.setString(1, DatosPersona.getDocIden());
        ps4.setString(2, DatosPersona.getNombre());
        ps4.setString(3, DatosPersona.getApellidos());
        ps4.setString(4, DatosPersona.getRazon_Social());
        ps4.setString(5, DatosPersona.getDirecccion());
        ResultadoConsulta = ps4.executeUpdate();
        if (ResultadoConsulta > 0) {
            ExitoConsulta = true;
        } else {
            ExitoConsulta = false;
        }
        return ExitoConsulta;
    }
    
  public boolean EliminarPersona(int id) throws SQLException {
        PreparedStatement ps = conexion.prepareStatement("DELETE FROM Persona WHERE id_P = ? ");
        ps.setInt(1,id );
        ResultadoConsulta = ps.executeUpdate();
        if (ResultadoConsulta > 0) {
            ExitoConsulta = true;
        }
        return ExitoConsulta;
    }
    /*
    public boolean ModificarPersona(Persona DatosPersona) throws SQLException, IOException {
        if (DatosPersona.ObtenerImagen() != null) {
            PreparedStatement ps = conexion.prepareStatement("UPDATE Persona SET Nombres = ? ,Apellidos = ? ,Email = ? ,Telefono = ? ,Direccion = ? ,Imagen = ? WHERE CodPersona = ? ");
            ps.setString(1, DatosPersona.ObtenerNombres());
            ps.setString(2, DatosPersona.ObtenerApellidos());
            ps.setString(3, DatosPersona.ObtenerEmail());
            ps.setString(4, DatosPersona.ObtenerTelefono());
            ps.setString(5, DatosPersona.ObtenerDireccion());
            ps.setBlob(6, DatosPersona.ObtenerImagen());
            ps.setInt(7, DatosPersona.ObtenerSesionCodPersona());
            ResultadoConsulta = ps.executeUpdate();
        } else {
            PreparedStatement ps = conexion.prepareStatement("UPDATE Persona SET Nombres = ? ,Apellidos = ? ,Email = ? ,Telefono = ? ,Direccion = ? WHERE CodPersona = ? ");
            ps.setString(1, DatosPersona.ObtenerNombres());
            ps.setString(2, DatosPersona.ObtenerApellidos());
            ps.setString(3, DatosPersona.ObtenerEmail());
            ps.setString(4, DatosPersona.ObtenerTelefono());
            ps.setString(5, DatosPersona.ObtenerDireccion());
            ps.setInt(6, DatosPersona.ObtenerSesionCodPersona());
            ResultadoConsulta = ps.executeUpdate();
        }
        if (ResultadoConsulta > 0) {
            ExitoConsulta = true;
        }
        return ExitoConsulta;
    }

    

    public boolean ConvertirAdministrador(Persona DatosPersona) throws SQLException {
        PreparedStatement ps = conexion.prepareStatement("UPDATE Persona SET Tipo = 1 WHERE CodPersona = ? ");
        ps.setInt(1, DatosPersona.getId_P());
        ResultadoConsulta = ps.executeUpdate();
        if (ResultadoConsulta > 0) {
            ExitoConsulta = true;
        }
        return ExitoConsulta;
    }

    public boolean RenunciarAdministrador(Persona DatosPersona) throws SQLException {
        PreparedStatement ps = conexion.prepareStatement("UPDATE Persona SET Tipo = 0 WHERE CodPersona = ? ");
        ps.setInt(1, DatosPersona.ObtenerSesionCodPersona());
        ResultadoConsulta = ps.executeUpdate();
        if (ResultadoConsulta > 0) {
            ExitoConsulta = true;
        }
        return ExitoConsulta;
    }*/
}
