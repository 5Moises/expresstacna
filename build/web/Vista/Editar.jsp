<%-- 
    Document   : EditarRuta
    Created on : 7 may 2022, 9:38:56
    Author     : Desarrollo2
--%>

<%@page import="Entidad.Ruta"%>
<%@page import="Modelo.RutasModelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

 <%           
                    RutasModelo RUTAS = new RutasModelo();
                    int ip = Integer.parseInt(request.getAttribute("id").toString());
                
                    Ruta camionIden = (Ruta) RUTAS.MostrarRuta(ip);
                 
 %>
 <main class="content">
                <div class="">
                    <div class="">
                        <div class="">
                            <div class="">

                                <div class="container-fluid p-0">
                                    <h1 class="h2"><b>Editar Rutas</b></h1>                                    
                                </div>

                                <div class="card">
                                     <div class="card-body">
                            <div class="m-sm-4">
                                <form action="RutasServlet" method="POST"  enctype="multipart/form-data">
                                    <div class="mb-3">
                                        <label class="form-label">DESTINO</label>
                                        <input class="form-control form-control-lg" type="text" name="Destinotxt" value="<%=camionIden.getDestino()%>" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">ABREVIATURA</label>
                                        <input class="form-control form-control-lg" type="text" name="abreviaturatct"  value="<%=camionIden.getAbreviatura()%>" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">DIRECCIÓN</label>
                                        <input class="form-control form-control-lg" type="text" name="Direcciontxt"   value="<%=camionIden.getDireccion()%>" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">IMAGEN</label>
                                        <input class="form-control form-control-lg" type="file" name="IMAGEN"  accept="image/jpeg"/>
                                    </div>                                                    
                                    <button type="submit" class="btn btn-primary">Guardar Datos</button>
                                    <input type="hidden" name="Consulta" value="2"/>
                                </form>                                          
                            </div>
                        </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </main>
  
        
                    