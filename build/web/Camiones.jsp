<%-- 
    Document   : Camiones
    Created on : 30 abr 2022, 9:59:07
    Author     : Desarrollo2
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.CamionesModelo"%>
<%@page import="Entidad.Camiones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%CamionesModelo Camion = new CamionesModelo();
    List<Camiones> DatosCamion = Camion.MostrarCamiones();
    Iterator<Camiones> Camioniterator = DatosCamion.iterator();
    Camiones Camiondato = null;

    String PLACA = "", MARCA = "", CERTIFICADO = "", CONFIGURACION = "", CARGA = "";
    if (request.getParameter("PLACA") != null || request.getParameter("MARCA") != null || request.getParameter("CERTIFICADO") != null || request.getParameter("CONFIGURACION") != null || request.getParameter("CARGA") != null) {
        PLACA = request.getParameter("PLACA");
        MARCA = request.getParameter("MARCA");
        CERTIFICADO = request.getParameter("CERTIFICADO");
        CONFIGURACION = request.getParameter("CONFIGURACION");
        CARGA = request.getParameter("CARGA");

    }

%>
<main class="content">
    <div class="container-fluid p-0">

        <h1 class="h3 mb-3">CAMIONES</h1>

        <div class="">
            <div class="card">

                <div class="card-header">
                    <h5 class="card-title">Mantenimiento de Camiones</h5>
                    <button type="button" class="btn btn-primary float-end mt-n1" data-bs-toggle="modal" data-bs-target="#sizedModalLg">
                        <i class="fas fa-plus"></i>
                        Registrar nuevo
                    </button>

                </div>

                <div class="modal fade" id="sizedModalLg" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title">Registro de Camiones</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body m-3">

                                <div class="card-body">
                                    <div class="m-sm-4">
                                        <form action="CamionesServlet" method="POST"  enctype="multipart/form-data">
                                            <div class="mb-3">
                                                <label class="form-label">PLACA</label>
                                                <input class="form-control form-control-lg" type="text" name="PLACA" value="<%= PLACA%>"/>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">MARCA</label>
                                                <input class="form-control form-control-lg" type="text" name="MARCA"  value="<%= MARCA%>"/>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">CERTIFICADO</label>
                                                <input class="form-control form-control-lg" type="text" name="CERTIFICADO"  value="<%= CERTIFICADO%>" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">CONFIGURACIÓN VEHICULAR</label>
                                                <input class="form-control form-control-lg" type="text" name="CONFIGURACION" value="<%=CONFIGURACION%>" />
                                            </div>      
                                            <div class="mb-3">
                                                <label class="form-label">CARGA MÁXIMA</label>
                                                <input class="form-control form-control-lg" type="text" name="CARGA"  value="<%= CARGA%>"/>
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
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width:10%" class="text-center"></th>
                            <th style="width:10%" class="text-center" >Codigo</th>
                            <th style="width:10%" class="text-center">Placar</th>
                            <th style="width:10%" class="text-center">Marca</th>
                            <th style="width:15%" class="text-center">Certificado</th>
                            <th style="width:10%" class="text-center">Configuración_Vehicular</th>
                            <th style="width:15%" class="text-center">Carga Máxima</th>

                            <th style="width:15%">Actions</th>
                        </tr>
                    </thead>
                    <tbody >
                        <%
                            while (Camioniterator.hasNext()) {
                                Camiondato = Camioniterator.next();


                        %>
                        <tr>
                  
                        <td class="text-center">  
                            <a href="CamionesServlet?id_Ca=<%=Camiondato.getId_Ca()%>&Consulta=2"  >Seleccionar</a>
                        </td>
                        <td class="text-center" ><%=Camiondato.getId_Ca()%> </td>
                        <td class="text-center" ><%=Camiondato.getPlaca()%></td>
                        <td class="text-center" ><%=Camiondato.getMarca()%></td>
                        <td class="text-center" ><%=Camiondato.getCertificado()%></td>
                        <td class="text-center"><%=Camiondato.getConfig_vehicular()%></td>
                        <td class="text-center"><%=Camiondato.getCarga_max()%></td>           
                  
                    <td class="table-action">


                        <a data-bs-target="#EditarCamion"  data-bs-toggle="modal">  <i class="align-middle" data-feather="edit-2"></i>   
                        </a>                               
                        <a href="CamionesServlet?id_Ca=<%=Camiondato.getId_Ca()%>&Consulta=3"><i class="align-middle" data-feather="trash"></i></a>
                    </td>
                    </tr>   

                    <%
                        }
                    %> 


                    </tbody>
                </table>
                <%         CamionesModelo CAMIONES = new CamionesModelo();
                    int ip_ca;
                    try {
                        ip_ca = Integer.parseInt(request.getAttribute("idper").toString());
                    } catch (Exception e) {
                        ip_ca = 0;
                    }
                    Camiones camionIden = (Camiones) CAMIONES.MostrarCamion(ip_ca);


                %>
                <div class="modal fade" id="EditarCamion" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title">Edición de Camion </h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body m-3">

                                <div class="card-body">
                                    <div class="m-sm-4">
                                        <form action="CamionesServlet" method="POST"  enctype="multipart/form-data">



                                            <div class="mb-3">
                                                <label class="form-label">PLACA</label>
                                                <input class="form-control form-control-lg" type="text" value="<%=camionIden.getPlaca()%>"/>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">MARCA</label>
                                                <input class="form-control form-control-lg" type="text"  value="<%= camionIden.getMarca()%>"/>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">CERTIFICADO</label>
                                                <input class="form-control form-control-lg" type="text"  value="<%= camionIden.getCertificado()%>" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">CONFIGURACIÓN VEHICULAR</label>
                                                <input class="form-control form-control-lg" type="text" value="<%=camionIden.getConfig_vehicular()%>" />
                                            </div>      
                                            <div class="mb-3">
                                                <label class="form-label">CARGA MÁXIMA</label>
                                                <input class="form-control form-control-lg" type="text"  value="<%= camionIden.getCarga_max()%>"/>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Actualizar Datos</button>
                                            <input type="hidden" name="Consulta" value="2"/>
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
        </div>	
    </div>
</main>