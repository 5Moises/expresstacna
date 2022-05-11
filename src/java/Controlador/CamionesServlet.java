/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Entidad.Camiones;
import Entidad.Usuario;
import Modelo.Acceso;
import Modelo.CamionesModelo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Desarrollo2
 */
        @WebServlet(name = "CamionesServlet", urlPatterns = {"/CamionesServlet"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class CamionesServlet extends HttpServlet {
            
Camiones CamionesEntidad = new Camiones();
CamionesModelo camiones = new CamionesModelo();
CuadrosDialogo cuadrosdialogo = new CuadrosDialogo();   

       @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         
        byte Consulta = Byte.parseByte(request.getParameter("Consulta"));        
        String Placa = request.getParameter("PLACA");
        String Marca = request.getParameter("MARCA");
        String Certificado = request.getParameter("CERTIFICADO");
        String Config_Vehicular = request.getParameter("CONFIGURACION");
        String Carga_Max = request.getParameter("CARGA");
       // int id_ca = Integer.parseInt(request.getParameter("id_Ca"));
       
        HttpSession SesionCodPersona = request.getSession();
        int AbrirSesion = Integer.parseInt(SesionCodPersona.getAttribute("AbrirSesion").toString());
         

      
        CamionesEntidad.setPlaca(Placa);
        CamionesEntidad.setMarca(Marca);
        CamionesEntidad.setCertificado(Certificado);
        CamionesEntidad.setConfig_vehicular(Config_Vehicular);
        CamionesEntidad.setCarga_max(Carga_Max);     
         
        try {
            switch (Consulta) {
                case 1:
                    try {
                        if (!Placa.equals("") && !Marca.equals("") && !Certificado.equals("") && !Config_Vehicular.equals("") && !Carga_Max.equals("")) {
                            if (camiones.RegistrarCamion(CamionesEntidad) == true) {
                               cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?id_P=1&Seccion=1", "Se registro un camion"," Éxito");
                            } else {
                                cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?&Seccion=1", "Ya existe un Camion con este Este Camion", "Aviso");
                            }
                        } else {
                            cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?&Seccion=1", "Complete los espacios vacíos", "Aviso");
                        }
                    } catch (Exception Ex) {
                        cuadrosdialogo.CuadroMensaje(request, response, "", Ex.toString(), "Error");
                    }
                    break;                     
            }
        } catch (Exception Ex) {
           
        }
    }
    
    
    
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession SesionCodPersona = request.getSession();

        int AbrirSesion = Integer.parseInt(SesionCodPersona.getAttribute("AbrirSesion").toString());
      
        Byte Consulta = Byte.parseByte(request.getParameter("Consulta"));
        int id_ca =Integer.parseInt(request.getParameter("id_Ca"));        
        try {
            switch (Consulta) {   
                
                case 2:
                       
                          request.setAttribute("idper",id_ca);         
                          RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp?id_P=1&Seccion=1");
                          rd.forward(request, response);
                         
                    break;
                case 3:
                    if (camiones.EliminarCamion(id_ca) == true) {
                        cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?id_P=" + AbrirSesion, "Se Eliminó un Camion", "Éxito");
                    }
                    break;              
            }
        } catch (Exception Ex) {
            cuadrosdialogo.CuadroMensaje(request, response, "Dashboard.jsp?id_P=" + AbrirSesion, Ex.toString(), "Error");
        }
    }
}
