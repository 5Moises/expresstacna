<%-- 
    Document   : Rutas
    Created on : 5 may 2022, 13:25:10
    Author     : Desarrollo2
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.RutasModelo"%>
<%@page import="Entidad.Ruta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%RutasModelo RUTAS = new RutasModelo();
    List<Ruta> Datosruta = RUTAS.MostrarRutas();
    Iterator<Ruta> Rutaiterator = Datosruta.iterator();
    Ruta rutadato = null;
    String Seccion = request.getParameter("Consulta");
%>
<main class="content">
    <div class="container-fluid p-0">
        <button type="button" class="btn btn-primary float-end mt-n1" data-bs-toggle="modal" data-bs-target="#sizedModalLg">
            <i class="fas fa-plus"></i>
            Registrar nuevo
        </button>
        <h1 class="h3 mb-3">RUTAS</h1>

        <div class="row">
            <%
                while (Rutaiterator.hasNext()) {
                    rutadato = Rutaiterator.next();


            %>
            <div class="col-12 col-md-6 col-lg-4">

                <div class="card" >   

                    <img  src="Vista/MostrarIMGDestino.jsp?CodProducto=<%= rutadato.getId_ruta()%>" width="auto" height="150" >

                    <div class="card-header">
                        <h5 class="card-title mb-0"><%=rutadato.getDestino()%> - <%=rutadato.getAbreviatura()%></h5>
                    </div>
                    <div class="card-body">
                      
                        <p class="card-text"><%=rutadato.getDireccion()%></p>
                        <a href="RutasServlet?id_Ruta=<%=rutadato.getId_ruta()%>&Consulta=2" class="card-link">EDITAR</a>
                        <a href="#" class="card-link">ELIMINAR</a>
                    </div>
                </div>
            </div>            
            <%
                }
            %>
        </div>
       
        
        <div class="modal fade" id="sizedModalLg" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title">Nuevo Registro de Rutas</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body m-3">

                        <div class="card-body">
                            <div class="m-sm-4">
                                <form action="RutasServlet" method="POST"  enctype="multipart/form-data">
                                    <div class="mb-3">
                                        <label class="form-label">DESTINO</label>
                                        <input class="form-control form-control-lg" type="text" name="Destinotxt" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">ABREVIATURA</label>
                                        <input class="form-control form-control-lg" type="text" name="abreviaturatct"  />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">DIRECCIÓN</label>
                                        <input class="form-control form-control-lg" type="text" name="Direcciontxt"  />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">IMAGEN</label>
                                        <input class="form-control form-control-lg" type="file" name="IMAGEN"  accept="image/jpeg"/>
                                    </div>                                                    
                                    <button type="submit" class="btn btn-primary">Guardar Datos</button>
                                    <input type="hidden" name="Consulta" value="1"/>
                                </form>                                          
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>                              
                    </div>
                </div>
            </div>
        </div>


    </div>
</main>
