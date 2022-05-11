/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Entidad.Ruta;
import Modelo.RutasModelo;
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
import javax.swing.JOptionPane;

/**
 *
 * @author Desarrollo2
 */
@WebServlet(name = "RutasServlet", urlPatterns = {"/RutasServlet"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb

public class RutasServlet extends HttpServlet {
      
           
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RutasModelo RutaModelo = new RutasModelo();
        Ruta rutaEntidad = new Ruta();
        HttpSession SesionCodPersona = request.getSession();
        byte Consulta = Byte.parseByte(request.getParameter("Consulta"));
        int AbrirSesion = 0;        
         String Destino = request.getParameter("Destinotxt").trim();
        String Abreviatura = request.getParameter("abreviaturatct").trim();
        String Direccion = request.getParameter("Direcciontxt");      
        if (SesionCodPersona.getAttribute("AbrirSesion") != null) {
            AbrirSesion = Integer.parseInt(SesionCodPersona.getAttribute("AbrirSesion").toString());
        }
          try {
            Part Imagen = request.getPart("IMAGEN");
            rutaEntidad.ColocarImagen(Imagen);
        } catch (Exception e) {
        }
          
          rutaEntidad.setDestino(Destino);
          rutaEntidad.setAbreviatura(Abreviatura);
          rutaEntidad.setDireccion(Direccion);
         try {
            switch (Consulta) {
                case 1:
                    if (!Destino.equals("") && !Abreviatura.equals("") && !Direccion.equals("")) {
                        
                         if (RutaModelo.RegistrarRuta(rutaEntidad) == true) {
                                response.sendRedirect("Dashboard.jsp?id_P=" + AbrirSesion + "&Seccion=4");
                            }
                    } else {
                        //cuadrodialogo.CuadroMensaje(request, response, "Empresa.jsp?CodEmpresa=" + AbrirSesion + "&Seccion=Prod", "Complete los espacios vacíos", "Aviso");
                    }
                    break;
               /* case 2:
                    if (!Nombre.equals("") && !Precio.equals("") && !Descripcion.equals("")) {
                        if (producto.ModificarProducto(productoentidad) == true) {
                            response.sendRedirect("Producto.jsp?CodProducto=" + CodProducto);
                        }
                    } else {
                        cuadrodialogo.CuadroMensaje(request, response, "Producto.jsp?CodProducto=" + CodProducto, "Complete los espacios vacíos", "Aviso");
                    }
                    break;
                    
                case 3:
                    if (producto.EliminarProducto(productoentidad) == true) {
                        response.sendRedirect("Empresa.jsp?CodEmpresa=" + CodEmpresa + "&Seccion=Prod");
                    }
                    break;*/
            }
        } catch (Exception Ex) {
          response.sendRedirect("Dashboard.jsp?id_P=" + AbrirSesion + "&Seccion=4");
        }
        

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession SesionCodPersona = request.getSession();
        byte Consulta = Byte.parseByte(request.getParameter("Consulta"));
        int AbrirSesion = Integer.parseInt(SesionCodPersona.getAttribute("AbrirSesion").toString());   
        int id =Integer.parseInt(request.getParameter("id_Ruta"));        
        //int id=Integer.parseInt(request.getParameter("id_Ruta"));
      
        try {
            switch (Consulta) {
                 case 2:                       
                          request.setAttribute("id",id);         
                          RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp?id_P=1&Seccion=10");
                          rd.forward(request, response);
                         
                    break;
            }
        } catch (Exception e) {
        }
    }
}
