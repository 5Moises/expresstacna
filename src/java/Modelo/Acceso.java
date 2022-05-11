package Modelo;

import Configuracion.Conexion;
import Entidad.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Acceso {

    Connection conexion = Conexion.getConnection();
    Usuario accesoentidad = new Usuario();

    private ResultSet rs;

    public int Acceder(Usuario DatosPersona) throws SQLException {
        int id_P = 0;
        PreparedStatement ps = conexion.prepareStatement("SELECT Count(*), id_P FROM Usuario INNER JOIN persona ON Usuario.id_U = Persona.id_U WHERE usuario.Usuario = ? AND Usuario.Contra = ? ");
        ps.setString(1, DatosPersona.getUsuario());
        ps.setString(2, DatosPersona.getContraseña());
        rs = ps.executeQuery();
        if (rs.next()) {
            if (rs.getByte(1) > 0) {
                id_P = rs.getInt(2);
            }
        }
        return id_P;
    }
}
