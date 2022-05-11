<%-- 
    Document   : Persona
    Created on : 2 may 2022, 11:30:43
    Author     : Desarrollo2
--%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="com.google.gson.*"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="Entidad.Sede"%>
<%@page import="Modelo.PersonaModelo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="Entidad.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% PersonaModelo Personas = new PersonaModelo();

    List<Persona> DatosPersona = Personas.MostrarPersonasE();
    Iterator<Persona> Personaiterato = DatosPersona.iterator();
    Persona Personadato = null; 
    
    int AbrirSesion = 0;

    if (session.getAttribute("AbrirSesion") != null) {
        AbrirSesion = Integer.parseInt(session.getAttribute("AbrirSesion").toString());
    }

%>

<main class="content">
    <div class="container-fluid p-0">

        <h1 class="h3 mb-3">MANTENIMIENTO DE EMPLEADOS</h1>

        <div class="">
            <div class="card">

                <div class="card-header">
                    <h5 class="card-title">Mantenimiento de EMPLEADOS</h5>
                    <a type="button" class="btn btn-primary float-end mt-n1" href="Dashboard.jsp?id_P=<%=AbrirSesion%>&Seccion=11">
                        <i class="fas fa-plus"></i>
                        Registrar nuevo
                    </a>

                </div>
            

                <table class="table">
                    <thead>
                        <tr>
                            <th style="width:5%;" class="text-center" >Codigo</th>
                            <th style="width:10%" class="text-center">DNI</th>
                            <th style="width:10%" class="text-center">Nombres</th>
                            <th style="width:10%" class="text-center">Apellido</th>
                            <th style="width:10%" class="text-center">Usuario</th>
                            <th style="width:10%" class="text-center">Contraseña</th>
                            <th style="width:5%" class="text-center">Rol</th>
                            <th style="width:10%" class="text-center">Ocupacion</th>
                            <th style="width:10%" class="text-center">Brevete</th>
                            <th style="width:10%" class="text-center">Sede</th>

                            <th style="width:10%">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            while (Personaiterato.hasNext()) {
                                Personadato = Personaiterato.next();


                        %>
                        <tr>
                            <td class="text-center" ><%=Personadato.getId_P()%> </td>
                            <td class="text-center" ><%=Personadato.getDocIden()%></td>
                            <td class="text-center" ><%=Personadato.getNombre()%></td>
                            <td class="text-center" ><%=Personadato.getApellidos()%></td>
                            <td class="text-center"><%=Personadato.getUsuario()%></td>
                            <td class="text-center" >*********</td>
                            <td class="text-center"><%=Personadato.getRol()%></td>
                            <td class="text-center"><%=Personadato.getOcupacion()%></td>
                            <td class="text-center"><%=Personadato.getBrevete()%></td><!-- comment -->
                            <td class="text-center"><%=Personadato.getSede()%></td>
                            <td class="table-action">


                                <a href="#">
                                    <h5>ELEGIR</h5>
                                </a>         
                                <a data-bs-toggle="modal" data-bs-target="#EditarCamion">
                                    <i class="align-middle" data-feather="edit-2"></i>  
                                    <a href="#"><i class="align-middle" data-feather="trash"></i></a>
                            </td>
                        </tr>   

                        <%
                            }
                        %>      
                    </tbody>
                </table>           
            </div>
        </div>	
    </div>
</main>

