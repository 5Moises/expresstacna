<%-- 
    Document   : menu
    Created on : 29 abr 2022, 14:02:56
    Author     : Desarrollo2
--%>

<%@page import="Entidad.Persona"%>
<%@page import="Modelo.PersonaModelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%   String Seccion;
    String PaginaSeccion = " ";  %>
<%
       int AbrirSesion = 0;
     if (session.getAttribute("AbrirSesion") != null) {
        AbrirSesion = Integer.parseInt(session.getAttribute("AbrirSesion").toString());
    }
   
  
    PersonaModelo persona = new PersonaModelo();
    Persona personaentidad = (Persona) persona.MostrarPersona(AbrirSesion);
%>
<main class="content">
    <div class="container-fluid p-0">

        <div class="row mb-2 mb-xl-3">
            <div class="col-auto d-none d-sm-block">
                <h3>PANEL DE CONTROL</h3>
            </div>

            <div class="col-auto ms-auto text-end mt-n1">
                <!--FECHA DE HOY-->
                <div class="dropdown me-2 d-inline-block">
                    <a class="btn btn-light bg-white shadow-sm dropdown-toggle" href="#"
                       data-bs-toggle="dropdown" data-bs-display="static">
                        <i class="align-middle mt-n1" data-feather="calendar"></i> HOY
                    </a>								
                </div>							
                <button class="btn btn-primary shadow-sm">
                    <i class="align-middle" data-feather="refresh-cw">&nbsp;</i>
                </button>
            </div>
        </div>
        <div>
            <div class="">
                <div class="card illustration flex-fill">
                    <div class="card-body p-0 d-flex flex-fill">
                        <div class="row g-0 w-100">
                            <div class="col-lg-6">
                                <div class="illustration-text p-3 m-1">
                                    <h4 class="illustration-text">Bienvenido, <%= personaentidad.getNombre()%>!</h4>
                                    <p class="mb-0">PANEL DE CONTROL DE TRANSPORTE EXPRESO TACNA</p>
                                </div>
                            </div>
                            <div class="col-6 align-self-end text-end">
                                <img src="img/illustrations/customer-support.png" alt="Customer Support"
                                     class="img-fluid illustration-img">
                            </div>
                        </div>
                    </div>
                </div>
            </div>					

        </div>	
        <div class="row">
            <div class="col-12 col-lg-6 col-xl-4 d-flex">
                <div class="card flex-fill">
                    <div class="card-header">
                            
                        <h5 class="card-title mb-0">CALENDARIO</h5>
                    </div>
                    <div class="card-body d-flex">
                        <div class="align-self-center w-100">
                            <div class="chart">
                                <div id="datetimepicker-dashboard"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-4 d-flex">
                <div class="card flex-fill w-100">
                    <div class="card-header">
                        <span class="badge bg-info float-end">HOY</span>
                        <h5 class="card-title mb-0">CHAT GENERAL</h5>
                    </div>
                    <div class="card-body">
                        <div class="d-flex align-items-start">
                            <img src="img/avatars/avatar-5.jpg" width="36" height="36"
                                 class="rounded-circle me-2" alt="Ashley Briggs">
                            <div class="flex-grow-1">
                                <small class="float-end">5m ago</small>
                                <strong>Ashley Briggs</strong> started following <strong>Stacie
                                    Hall</strong><br />
                                <small class="text-muted">Today 7:51 pm</small><br />

                            </div>
                        </div>

                        <hr />
                        <div class="d-flex align-items-start">
                            <img src="img/avatars/avatar.jpg" width="36" height="36"
                                 class="rounded-circle me-2" alt="Chris Wood">
                            <div class="flex-grow-1">
                                <small class="float-end">30m ago</small>
                                <strong>Chris Wood</strong> posted something on <strong>Stacie
                                    Hall</strong>'s timeline<br />
                                <small class="text-muted">Today 7:21 pm</small>

                                <div class="border text-sm text-muted p-2 mt-1">
                                    Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem
                                    quam semper libero, sit amet adipiscing...
                                </div>
                            </div>
                        </div>

                        <hr />
                        <div class="d-flex align-items-start">
                            <img src="img/avatars/avatar-4.jpg" width="36" height="36"
                                 class="rounded-circle me-2" alt="Stacie Hall">
                            <div class="flex-grow-1">
                                <small class="float-end">1h ago</small>
                                <strong>Stacie Hall</strong> posted a new blog<br />

                                <small class="text-muted">Today 6:35 pm</small>
                            </div>
                        </div>

                        <hr />
                        <div class="d-grid">
                            <a href="#" class="btn btn-primary">ENTRAR CHAT GENERAL</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-6 col-xl-4 d-flex">
                <div class="card flex-fill w-100">
                    <div class="card-header">									
                        <h5 class="card-title mb-0">CALCULADORA</h5>
                    </div>
                    <div id="appBg">
                        <form name="calculator">									

                            <input type="textfield" name="ans" value="" autocomplete="off" readonly>
                            <input type="reset" value="C">
                            <input type="button" value="(" onclick="document.calculator.ans.value += '('" class="gray">
                            <input type="button" value=")" onclick="document.calculator.ans.value += ')'" class="gray">
                            <input type="button" value="/" onclick="document.calculator.ans.value += '/'" class="orange">
                            <BR>
                            <input type="button" value="7" onclick="document.calculator.ans.value += '7'" class="gray">
                            <input type="button" value="8" onclick="document.calculator.ans.value += '8'"  class="gray">
                            <input type="button" value="9" onclick="document.calculator.ans.value += '9'"  class="gray">
                            <input type="button" value="X" onclick="document.calculator.ans.value += '*'"  class="orange">
                            <br>
                            <input type="button" value="4" onclick="document.calculator.ans.value += '4'"  class="gray">
                            <input type="button" value="5" onclick="document.calculator.ans.value += '5'" class="gray">
                            <input type="button" value="6" onclick="document.calculator.ans.value += '6'" class="gray">
                            <input type="button" value="-" onclick="document.calculator.ans.value += '-'" class="orange">
                            <br>
                            <input type="button" value="1" onclick="document.calculator.ans.value += '1'" class="gray">
                            <input type="button" value="2" onclick="document.calculator.ans.value += '2'" class="gray">
                            <input type="button" value="3" onclick="document.calculator.ans.value += '3'" class="gray">
                            <input type="button" value="+" onclick="document.calculator.ans.value += '+'" class="orange">
                            <br>
                            <input type="button" value="+/-" onclick="document.calculator.ans.value += '(-'" class="gray">
                            <input type="button" value="0" onclick="document.calculator.ans.value += '0'" class="gray">
                            <input type="button" value="." onclick="document.calculator.ans.value += '.'" class="gray">
                            <input type="button" value="=" onclick="document.calculator.ans.value = eval(document.calculator.ans.value)">

                        </form>
                    </div>
                </div>
            </div>
        </div>				
    </div>
</main>