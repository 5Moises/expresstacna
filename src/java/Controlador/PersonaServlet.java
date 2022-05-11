package Controlador;

import Entidad.Persona;
import Modelo.PersonaModelo;
import com.google.gson.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.http.Part;

@WebServlet(name = "PersonaServlet", urlPatterns = {"/PersonaServlet"})

@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class PersonaServlet extends HttpServlet {

    Persona personaentidad = new Persona();
    PersonaModelo persona = new PersonaModelo();
    CuadrosDialogo cuadrosdialogo = new CuadrosDialogo();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession SesionCodPersona = request.getSession();

        byte Consulta = Byte.parseByte(request.getParameter("Consulta"));
       
        int AbrirSesion = 0;

        String Doc;
        String Apellido;
        String Brevete;
        String Direccion;
        String email;
        String estado;
        String Nombre;
        String Ocupacion;
        String Razon;
        String telefono;
        if (SesionCodPersona.getAttribute("AbrirSesion") != null) {
            AbrirSesion = Integer.parseInt(SesionCodPersona.getAttribute("AbrirSesion").toString());
        }

        //personaentidad.ColocarSesionCodPersona(AbrirSesion);
        try {
           
            switch (Consulta) {
             
                    case 0:
                          
                              Doc = request.getParameter("RUCtxt");
                              request.setAttribute("idper", Doc);
                              cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?id_P=1&Seccion=11", "Se Eliminó un Camion", "Éxito");
                    break;      
                case 1:
                    Doc = request.getParameter("DOCTXT");
                    Razon = request.getParameter("SOCIALTXT");
                    Nombre = request.getParameter("NOMBRETXT");
                    Apellido = request.getParameter("APELLIDOTXT");
                    Direccion = request.getParameter("DIRECCIONTXT");
                    personaentidad.setDocIden(Doc);
                    personaentidad.setNombre(Nombre);
                    personaentidad.setApellidos(Apellido);
                    personaentidad.setRazon_Social(Razon);
                    personaentidad.setDirecccion(Direccion);
                    try {
                        if (!Doc.equals("")) {
                            if (persona.RegistrarClienteR(personaentidad) == true) {
                                cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?id_P=1&Seccion=2", "Se registro un CLIENTE", " Éxito");
                            }
                        } else {
                            cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?id_P=1&Seccion=2", "Complete los espacios vacíos", "Aviso");
                        }
                    } catch (Exception Ex) {
                        cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?id_P=1&Seccion=2", Ex.toString(), "Error");
                    }
                    break;

                case 2:
                    Doc = request.getParameter("RUC");
                    Razon = request.getParameter("SOCIAL");
                    Nombre = request.getParameter("NOMBRE");
                    Apellido = request.getParameter("APELLIDO");
                    Direccion = request.getParameter("DIRECCION");
                    telefono = request.getParameter("TELEFONO");
                    email = request.getParameter("EMAIL");
                    personaentidad.setDocIden(Doc);
                    personaentidad.setNombre(Nombre);
                    personaentidad.setApellidos(Apellido);
                    personaentidad.setRazon_Social(Razon);
                    personaentidad.setDirecccion(Direccion);
                    personaentidad.setTelefono(telefono);
                    personaentidad.setEmail(email);
                    try {
                        if (!Doc.equals("")) {
                            if (persona.RegistrarCliente(personaentidad) == true) {
                                cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?id_P=" + AbrirSesion + "&Seccion=3", "Resgitrado", "Éxito");
                            }
                        } else {
                            cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?id_P=1&Seccion=3", "Complete los espacios vacíos", "Aviso");
                        }
                    } catch (Exception Ex) {
                        cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?id_P=1&Seccion=3", Ex.toString(), "Error");
                    }
                    break;

                 case 5:
                     Doc=request.getParameter("RUCtxt1");
                     Nombre = request.getParameter("NOMBRE");
                     Apellido = request.getParameter("APELLIDO");
                     String Usuario = request.getParameter("usuariotxt");
                     String contra = request.getParameter("contratxt");
                     String Rol = request.getParameter("roltxt");
                     int indentificadorRol;
                     if(Rol.equals("Administrador"))
                     {
                         indentificadorRol=2;
                     }else
                     {
                         indentificadorRol=1;
                     }
                     Ocupacion = request.getParameter("ocupaciontxt");
                     Brevete = request.getParameter("brevetetxt");
                     String Sede = request.getParameter("sedetxt");
                     personaentidad.setDocIden(Doc);
                     personaentidad.setNombre(Nombre);
                     personaentidad.setApellidos(Apellido);
                     personaentidad.setUsuario(Usuario);
                     personaentidad.setContra(contra);
                     personaentidad.setRol(indentificadorRol);
                     personaentidad.setOcupacion(Ocupacion);
                     personaentidad.setBrevete(Brevete);
                     personaentidad.setSede(Sede);
                     
                      if (!Doc.equals("")) {
                            if (persona.RegistrarEmpleado(personaentidad) == true) {
                                cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?id_P=" + AbrirSesion + "&Seccion=5", "Resgitrado", "Éxito");
                            }
                        } else {
                            cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?id_P=1&Seccion=3", "Complete los espacios vacíos", "Aviso");
                        }
                    break;

            }
        } catch (Exception Ex) {
            cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?id_P=1&Seccion=2", Ex.toString(), "Error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession SesionCodPersona = request.getSession();
        String AbrirSesion = (SesionCodPersona.getAttribute("AbrirSesion").toString());
        Byte Consulta = Byte.parseByte(request.getParameter("Consulta"));  
        
        String Doc;
        String Apellido;
        String Brevete;
        String Direccion;
        String email;
        String estado;
        String Nombre;
        String Ocupacion;
        String Razon;
        String telefono;
        int id_ca = 0;
        try {
            switch (Consulta) {
                          
                case 3:
                  id_ca = Integer.parseInt(request.getParameter("id_P"));
                    request.setAttribute("idper", id_ca);
                    RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp?id_P=1&Seccion=3");
                    rd.forward(request, response);

                    break;
                case 4:
                      id_ca = Integer.parseInt(request.getParameter("id_P"));
                    if (persona.EliminarPersona(id_ca) == true) {
                        cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?id_P=" + AbrirSesion + "&Seccion=3", "Se Eliminó un Camion", "Éxito");
                    }
                    break;
                case 11:
                  
                    break;
              

            }
        } catch (Exception Ex) {
            cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?id_P=" + AbrirSesion + "&Seccion=3", Ex.toString(), "Error");
        }
    }
}
