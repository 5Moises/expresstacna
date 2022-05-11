package Controlador;

import Entidad.Usuario;
import Modelo.Acceso;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AccederServlet", urlPatterns = {"/AccederServlet"})

public class AccederServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Usuario Usuario = new Usuario();
        Acceso acceso = new Acceso();
        HttpSession AbrirSesion = request.getSession();
        CuadrosDialogo cuadrosdialogo = new CuadrosDialogo();

        String IdAcceso = request.getParameter("txt_idacceso");
        String Contrasena = request.getParameter("txt_contrasena");

        Usuario.setUsuario(IdAcceso);
        Usuario.setContraseña(Contrasena);

        try {
            if (acceso.Acceder(Usuario) > 0) {
                AbrirSesion.setAttribute("AbrirSesion", acceso.Acceder(Usuario));
                response.sendRedirect("Dashboard.jsp?id_P=" + acceso.Acceder(Usuario));
            } else {
                cuadrosdialogo.CuadroMensaje(request, response, "index.jsp", "IdAcceso y/o Contraseña incorrecta", "Aviso");
            }
        } catch (Exception Ex) {
            cuadrosdialogo.CuadroMensaje(request, response, "index.jsp", Ex.toString(), "Error");
        }
    }
}
