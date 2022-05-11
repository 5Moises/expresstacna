<%-- 
    Document   : Agregar
    Created on : 9 may 2022, 13:28:56
    Author     : Desarrollo2
--%>

<%@page import="Modelo.PersonaModelo"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.Iterator"%>
<%@page import="Entidad.Sede"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    PersonaModelo sede = new PersonaModelo();
    List<Sede> DatosSede = sede.MostrarSEDE();
    Iterator<Sede> Sedeiterato = DatosSede.iterator();
    Sede Sededato = null;

    String apellidop;
    String apellidoM;
    String Apellidos;
    String Nombres;
    String Doc;
    String Sede1 , Ocupacion, brevete,usuario, contra,rol;
      Sede1 ="";
      Ocupacion  ="";
      brevete  ="";
      usuario ="";
      contra ="";
      rol ="";
    try {

        Doc = (request.getAttribute("idper").toString());
        String enlace = "http://api.apis.net.pe/v1/dni?numero=" + Doc;
        URL url = new URL(enlace);
        URLConnection rLConnection = url.openConnection();
        rLConnection.connect();
        JsonParser jp = new JsonParser();
        JsonElement root = jp.parse(new InputStreamReader((InputStream) rLConnection.getContent()));
        JsonObject rootobj = root.getAsJsonObject();
        apellidop = rootobj.get("apellidoPaterno").getAsString();
        apellidoM = rootobj.get("apellidoMaterno").getAsString();
        Nombres = rootobj.get("nombres").getAsString();
        Apellidos = apellidop + " " + apellidoM;
    } catch (Exception e) {
        apellidop = "";
        apellidoM = "";
        Apellidos = "";
        Nombres = "";
        Doc = "";
    }
    int AbrirSesion = 0;

    if (session.getAttribute("AbrirSesion") != null) {
        AbrirSesion = Integer.parseInt(session.getAttribute("AbrirSesion").toString());
    }
     if (request.getParameter("sedetxt") != null || request.getParameter("ocupaciontxt") != null || request.getParameter("brevetetxt") != null || request.getParameter("roltxt") != null ||request.getParameter("RUCtxt1") != null || request.getParameter("NOMBRE") != null || request.getParameter("APELLIDO") != null || request.getParameter("usuariotxt") != null || request.getParameter("contratxt") != null) {
        Sede1 = request.getParameter("sedetxt");  
        Ocupacion = request.getParameter("ocupaciontxt");
        brevete = request.getParameter("brevetetxt");
        usuario = request.getParameter("usuariotxt");
        contra = request.getParameter("contratxt");
        rol = request.getParameter("roltxt");
    }

%>
<!DOCTYPE html>
 
<div class="card-body">
         <a type="button" class="btn btn-primary float-end mt-n1" href="Dashboard.jsp?id_P=<%=AbrirSesion%>&Seccion=5">
                        <i class="fas fa-x"></i> Cancelar
          </a>
    <div class="m-sm-4">
      
        <%            if (Doc.equals("")) {
        %>
        <form action="PersonaServlet" method="post" enctype="multipart/form-data">
            <div class="row">
                <div class="mb-3 col-md-12">
                    <label class="form-label">RUC/DNI</label>
                    <input class="form-control form-control-lg" type="text" name="RUCtxt" />
                    <button class="btn btn-primary btn-lg" style="margin-top: 25px "> BUSCAR DNI</button>
                      <input type="hidden" name="Consulta" value="0"/>
                </div>
               
            </div>
        </form>

      
            <%
            } else {
            %>
            <div class="mb-3 ">
                <label class="form-label">RUC/DNI</label>
                <input class="form-control form-control-lg" type="text" name="RUCtxt1" value="<%=Doc%>" />                                              
            </div>
            <%
                }
            %>
            <form action="PersonaServlet" method="POST" enctype="multipart/form-data"> 
            
            <div class="row">
                <div class="mb-3 col-md-6"">
                    <input  type="hidden" name="RUCtxt1" value="<%=Doc%>" />   
                    <label class="form-label">NOMBRE</label>
                    <input class="form-control form-control-lg" type="text" name="NOMBRE" value="<%=Nombres%>"/>


                </div>
                <div class="mb-3 col-md-6"">                                                                                                     
                    <label class="form-label">APELLIDO</label>
                    <input class="form-control form-control-lg" type="text" name="APELLIDO" value="<%=Apellidos%>"  />

                </div>
            </div>
            <div class="row">
                <div class="mb-3 col-md-6">
                    <label class="form-label">USUARIO</label>
                    <input class="form-control form-control-lg" type="text" name="usuariotxt" value="<%=usuario%>"/>
                </div>      
                <div class="mb-3 col-md-6">
                    <label class="form-label">CONTRASEÑA</label>
                    <input class="form-control form-control-lg" type="password" name="contratxt"  value="<%=contra%>"/>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">ROL</label>
                <select id="inputState" class="form-control" name="roltxt" value="<%=rol%>">
                    <option selected="">Elegir...</option>
                    <option>Administrador</option>
                    <option>Operador</option>
                </select>
            </div><!-- comment -->

            <div class="mb-3">
                <label class="form-label">OCUPACIÓN</label>
                <input class="form-control form-control-lg" type="text" name="ocupaciontxt" value="<%=Ocupacion%>" />
            </div>
            <div class="mb-3">
                <label class="form-label">BREVETE</label>
                <input class="form-control form-control-lg" type="text" name="brevetetxt"  value="<%=brevete%>"/>
            </div><!-- comment -->

            <div class="mb-3">
                <label class="form-label">SEDE</label>
                <select id="inputState" class="form-control" name="sedetxt" value="<%=Sede1%>">
                    <option selected="">Elegir...</option>
                    <%
                        while (Sedeiterato.hasNext()) {
                            Sededato = Sedeiterato.next();


                    %>
                    <option> <%= Sededato.getSede()%></option>
                    <%
                        }
                    %>
                </select>
            </div>             
                <button type="submit" class="btn btn-primary">Guardar Datos</button>
                  <input type="hidden" name="Consulta" value="5"/>
                </form>
    </div>
</div>
