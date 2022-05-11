<%-- 
    Document   : Persona
    Created on : 2 may 2022, 11:30:43
    Author     : Desarrollo2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


      
            <main class="content">
                <div class="">
                    <div class="">
                        <div class="">
                            <div class="">

                                <div class="container-fluid p-0">
                                    <h1 class="h2"><b>Registro de Clientes Rapidos</b></h1>                                    
                                </div>

                                <div class="card">
                                    <div class="card-body">
                                        <div class="m-sm-4">
                                            <form action="PersonaServlet" method="POST"  enctype="multipart/form-data">
                                                <div class="mb-3">
                                                    <label class="form-label">RUC/DNI</label>
                                                    <input class="form-control form-control-lg" type="text" name="DOCTXT" placeholder="Ingrese su documento de identidad" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">RAZÓN SOCIAL</label>
                                                    <input class="form-control form-control-lg" type="text" name="SOCIALTXT" placeholder="Ingrese Razón Social" />
                                                </div>
                                                 <div class="mb-3">
                                                    <label class="form-label">NOMBRE</label>
                                                    <input class="form-control form-control-lg" type="text" name="NOMBRETXT" placeholder="Ingrese su nombre" />
                                                </div>
                                                  <div class="mb-3">
                                                    <label class="form-label">APELLIDO</label>
                                                    <input class="form-control form-control-lg" type="text" name="APELLIDOTXT" placeholder="Ingrese su nombre" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">DIRECCIÓN</label>
                                                    <input class="form-control form-control-lg" type="text" name="DIRECCIONTXT" placeholder="Ingrese su Dirección" />
                                                </div>                                              
                                                <div class="text-center mt-3">
                                                   <button type="submit" class="btn btn-primary">Registrar Cliente</button>
                                                    <input type="hidden" name="Consulta" value="1"/>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </main>
  
        