<%-- 
    Document   : Persona
    Created on : 2 may 2022, 11:30:43
    Author     : Desarrollo2
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.PersonaModelo"%>
<%@page import="Entidad.Persona" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
 PersonaModelo  Personas = new PersonaModelo();
 List<Persona> DatosPersona =Personas.MostrarPersonas();
 Iterator<Persona> Personaiterato = DatosPersona.iterator();
                Persona Personadato = null;
                
%>
<main class="content">
    <div class="container-fluid p-0">

        <h1 class="h3 mb-3">CLIENTES</h1>

        <div class="">
            <div class="card">

                <div class="card-header">
                    <h5 class="card-title">Mantenimiento de CLIENTES</h5>
                    <button type="button" class="btn btn-primary float-end mt-n1" data-bs-toggle="modal" data-bs-target="#sizedModalLg">
                        <i class="fas fa-plus"></i>
                        Registrar nuevo
                    </button>

                </div>

                <div class="modal fade" id="sizedModalLg" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title">Registro de Clientes</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body m-3">
                               
                                    <div class="card-body">
                                        <div class="m-sm-4">
                                            <form action="PersonaServlet" method="POST"  enctype="multipart/form-data">
                                                <div class="mb-3">
                                                    <label class="form-label">RUC/DNI</label>
                                                    <input class="form-control form-control-lg" type="text" name="RUC" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">NOMBRE</label>
                                                    <input class="form-control form-control-lg" type="text" name="NOMBRE"/>
                                                </div>
                                                 <div class="mb-3">
                                                    <label class="form-label">APELLIDO</label>
                                                    <input class="form-control form-control-lg" type="text" name="APELLIDO"  />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">RAZÓN SOCIAL</label>
                                                    <input class="form-control form-control-lg" type="text" name="SOCIAL" />
                                                </div>      
                                                <div class="mb-3">
                                                    <label class="form-label">DIRECCION</label>
                                                    <input class="form-control form-control-lg" type="text" name="DIRECCION" />
                                                </div>
                                                   <div class="mb-3">
                                                    <label class="form-label">TELEFONO</label>
                                                    <input class="form-control form-control-lg" type="text" name="TELEFONO" />
                                                   </div><!-- comment -->
                                                      <div class="mb-3">
                                                    <label class="form-label">EMAIL</label>
                                                    <input class="form-control form-control-lg" type="text" name="EMAIL" />
                                                </div>
                                                <button type="submit" class="btn btn-primary">Guardar Datos</button>
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
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width:10%;" class="text-center" >Codigo</th>
                            <th style="width:10%" class="text-center">Ruc/DNI</th>
                             <th style="width:10%" class="text-center">Nombre</th>
                              <th style="width:10%" class="text-center">Apellido</th>
                               <th style="width:10%" class="text-center">Razón Social</th>
                                <th style="width:10%" class="text-center">Dirección</th>
                                 <th style="width:10%" class="text-center">Telefono</th>
                                   <th style="width:10%" class="text-center">Email</th>
                          
                            <th style="width:15%">Actions</th>
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
                               <td class="text-center"><%=Personadato.getRazon_Social()%></td>
                                <td class="text-center"><%=Personadato.getDirecccion()%></td>
                                <td class="text-center"><%=Personadato.getTelefono()%></td> 
                                <td class="text-center"><%=Personadato.getEmail()%></td> 
                            <td class="table-action">
                                
                                
                                 <a href="PersonaServlet?id_P=<%=Personadato.getId_P()%>&Consulta=3">
                                     <h5>ELEGIR</h5>
                                 </a>         
                                <a data-bs-toggle="modal" data-bs-target="#EditarCamion"><i class="align-middle" data-feather="edit-2"></i></a>  
                                <a href="PersonaServlet?id_P=<%=Personadato.getId_P()%>&Consulta=4"><i class="align-middle" data-feather="trash"></i></a>
                            </td>
                        </tr>   
                          
                       <%
                           }
            %> 
            
                  
                    </tbody>
                </table>
            <%         
                int ip_ca;
                   PersonaModelo PersonasE = new PersonaModelo();
                      try {
                               ip_ca = Integer.parseInt(request.getAttribute("idper").toString());   
                          } catch (Exception e) {                          
                                ip_ca =0    ;
                          }                                   
                             Persona camionIden = (Persona) PersonasE.MostrarPersona(ip_ca );
                          
                         
                        
                            
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
                                                  <div class="mb-3 hidden" >                                                   
                                                    <input class="form-control form-control-lg" type="text" name="id_P1" value="<%=camionIden.getId_P()%>"/>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">PLACA</label>
                                                    <input class="form-control form-control-lg" type="text" name="PLACA" value="<%=camionIden.getDocIden()%>"/>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">MARCA</label>
                                                    <input class="form-control form-control-lg" type="text" name="MARCA"  value="<%= camionIden.getNombre()%>"/>
                                                </div>
                                                 <div class="mb-3">
                                                    <label class="form-label">CERTIFICADO</label>
                                                    <input class="form-control form-control-lg" type="text" name="CERTIFICADO"  value="<%= camionIden.getApellidos()%>" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">CONFIGURACIÓN VEHICULAR</label>
                                                    <input class="form-control form-control-lg" type="text" name="CONFIGURACION" value="<%=camionIden.getRazon_Social()%>" />
                                                </div>      
                                                <div class="mb-3">
                                                    <label class="form-label">CARGA MÁXIMA</label>
                                                    <input class="form-control form-control-lg" type="text" name="CARGA"  value="<%= camionIden.getDirecccion()%>"/>
                                                </div>
                                                 <div class="mb-3">
                                                    <label class="form-label">CARGA MÁXIMA</label>
                                                    <input class="form-control form-control-lg" type="" name="CARGA"  value="<%= camionIden.getTelefono()%>"/>
                                                </div>
                                                 <div class="mb-3">
                                                    <label class="form-label">CARGA MÁXIMA</label>
                                                    <input class="form-control form-control-lg" type="email" name="CARGA"  value="<%= camionIden.getEmail()%>"/>
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
  
        