<%-- 
    Document   : Dashboard
    Created on : 29 abr 2022, 14:03:47
    Author     : Desarrollo2
--%>

<%@page import="Modelo.PersonaModelo"%>
<%@page import="Entidad.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%   String Seccion = request.getParameter("Seccion");
    String PaginaSeccion = "menu.jsp";
    int AbrirSesion = 0;

    if (session.getAttribute("AbrirSesion") != null) {
        AbrirSesion = Integer.parseInt(session.getAttribute("AbrirSesion").toString());
    }

    int Id_P = Integer.parseInt(request.getParameter("id_P"));
    PersonaModelo persona = new PersonaModelo();
    Persona personaentidad = (Persona) persona.MostrarPersona(Id_P);
%>
<!DOCTYPE html>
<html lang="ES-es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Dashboard | Expreso Tacna</title>	
        <link rel="shortcut icon" href="img/favicon.ico">

        <link class="js-stylesheet" href="css/light.css" rel="stylesheet">
        <link href="css/calculadora.css" rel="stylesheet">
        <script src="js/settings.js"></script>

    </head>
    <body data-theme="light" data-layout="fluid" data-sidebar-position="left" data-sidebar-behavior="sticky" class="">
        <div class="wrapper">


            <nav id="sidebar" class="sidebar" style="background: #ffffff">
                <div class="sidebar-content js-simplebar">
                    <a class="sidebar-brand" href="Dashboard.jsp?id_P=<%=personaentidad.getId_P()%>">
                        <img src="img/favicon.ico">

                        <span class="align-middle me-3">Expreso TACNA</span>
                    </a>

                    <%

                        if (personaentidad.getId_P() == AbrirSesion) {
                    %>
                    <ul class="sidebar-nav">
                        <li class="sidebar-header">
                            <B style="color: red;">MAESTROS</B>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href= "Dashboard.jsp?id_P=<%=personaentidad.getId_P()%>&Seccion=1" >                                
                                <i class="align-middle" data-feather="truck"></i> <span class="align-middle">CAMIONES</span>							
                            </a>						
                        </li>				
                        <li class="sidebar-item">
                            <a class="sidebar-link " href="Dashboard.jsp?id_P=<%=personaentidad.getId_P()%>&Seccion=2">
                                <i class="align-middle fas fa-users"></i> <span class="align-middle">CLIENTES RAPIDOS</span>
                            </a>						
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="Dashboard.jsp?id_P=<%=personaentidad.getId_P()%>&Seccion=3">
                                <i class="align-middle" data-feather="users"></i> <span class="align-middle">CLIENTES</span>							
                            </a>					
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="Dashboard.jsp?id_P=<%=personaentidad.getId_P()%>&Seccion=4">
                                <i class="align-middle" data-feather="map-pin"></i> <span
                                    class="align-middle">RUTAS</span>
                            </a>						
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="Dashboard.jsp?id_P=<%=personaentidad.getId_P()%>&Seccion=5">
                                <i class="align-middle" data-feather="eye"></i> <span
                                    class="align-middle">EMPLEADOS</span>
                            </a>						
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="Dashboard.jsp?id_P=<%=personaentidad.getId_P()%>&Seccion=6">
                                <i class="align-middle fas fa-money-bill-wave-alt"></i> <span
                                    class="align-middle">TIPO DE PAGO </span>
                            </a>						
                        </li>

                        <li class="sidebar-header">
                            <B style="color: red;">OPERACIONES</B>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="Dashboard.jsp?id_P=<%=personaentidad.getId_P()%>&Seccion=7">
                                <i class="align-middle" data-feather="file-text"></i> <span class="align-middle">BOLETAS | FACTURAS</span>
                            </a>

                        </li>					
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="#">
                                <i class="align-middle" data-feather="x-circle"></i> <span
                                    class="align-middle">DOCUMENTOS ELIMINADOS</span>
                            </a>						
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="#">
                                <i class="align-middle" data-feather="list"></i> <span class="align-middle">NOTAS DE CREDITO</span>
                            </a>
                        </li>

                        <li class="sidebar-header">
                            <B style="color: red;">REPORTES</B>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="#">
                                <i class="align-middle" data-feather="check-square"></i> <span class="align-middle">LIQUIDACIONES</span>
                            </a>					
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="#">
                                <i class="align-middle" data-feather="list"></i> <span
                                    class="align-middle">REGISTRO DE VENTAS</span>
                            </a>						
                        </li>       
                    </ul>
                </div>
            </nav>
            <%
                }
                if (Seccion == null) {
                    Seccion = "";
                }
                switch (Seccion) {
                    case "1":
                        PaginaSeccion = "Camiones.jsp";
                        break;
                    case "2":
                        PaginaSeccion = "PersonaR.jsp";
                        break;
                    case "3":
                        PaginaSeccion = "Persona.jsp";
                        break;
                    case "4":
                        PaginaSeccion = "Rutas.jsp";
                        break;
                    case "5":
                        PaginaSeccion = "PersonaE.jsp";
                        break;
                    case "6":
                        PaginaSeccion = "Tipo_pago.jsp";
                        break;
                    case "7":
                        PaginaSeccion = "BoFa.jsp";
                        break;
                    case "10":
                        PaginaSeccion = "Vista/Editar.jsp";
                        break;
                    case "11":
                        PaginaSeccion = "Vista/Agregar.jsp";
                        break;
                    default:
                        PaginaSeccion = "menu.jsp";
                }
            %>
            <div class="main">
                <nav class="navbar navbar-expand navbar-light navbar-bg">
                    <a class="sidebar-toggle">
                        <i class="hamburger align-self-center"></i>
                    </a>



                    <ul class="navbar-nav">
                        <li class="nav-item px-2 dropdown">
                            <H1>
                                <B style="color: red;">TRANSPOTES</B> <B style="color: silver;">EXPRESO</B> <B style="color: blue;">TACNA</B> 
                            </H1>

                        </li>
                    </ul>

                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav navbar-align">
                            <li class="nav-item dropdown">
                                <a class="nav-icon dropdown-toggle" href="#" id="messagesDropdown"
                                   data-bs-toggle="dropdown">
                                    <div class="position-relative">
                                        <i class="align-middle" data-feather="message-circle"></i>
                                        <span class="indicator">4</span>
                                    </div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
                                     aria-labelledby="messagesDropdown">
                                    <div class="dropdown-menu-header">
                                        <div class="position-relative">
                                            4 New Messages
                                        </div>
                                    </div>
                                    <div class="list-group">
                                        <a href="#" class="list-group-item">
                                            <div class="row g-0 align-items-center">
                                                <div class="col-2">
                                                    <img src="img/avatars/avatar-5.jpg"
                                                         class="avatar img-fluid rounded-circle" alt="Ashley Briggs">
                                                </div>
                                                <div class="col-10 ps-2">
                                                    <div class="text-dark">Ashley Briggs</div>
                                                    <div class="text-muted small mt-1">Nam pretium turpis et arcu. Duis arcu
                                                        tortor.</div>
                                                    <div class="text-muted small mt-1">15m ago</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row g-0 align-items-center">
                                                <div class="col-2">
                                                    <img src="img/avatars/avatar-2.jpg"
                                                         class="avatar img-fluid rounded-circle" alt="Carl Jenkins">
                                                </div>
                                                <div class="col-10 ps-2">
                                                    <div class="text-dark">Carl Jenkins</div>
                                                    <div class="text-muted small mt-1">Curabitur ligula sapien euismod
                                                        vitae.</div>
                                                    <div class="text-muted small mt-1">2h ago</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row g-0 align-items-center">
                                                <div class="col-2">
                                                    <img src="img/avatars/avatar-4.jpg"
                                                         class="avatar img-fluid rounded-circle" alt="Stacie Hall">
                                                </div>
                                                <div class="col-10 ps-2">
                                                    <div class="text-dark">Stacie Hall</div>
                                                    <div class="text-muted small mt-1">Pellentesque auctor neque nec urna.
                                                    </div>
                                                    <div class="text-muted small mt-1">4h ago</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row g-0 align-items-center">
                                                <div class="col-2">
                                                    <img src="img/avatars/avatar-3.jpg"
                                                         class="avatar img-fluid rounded-circle" alt="Bertha Martin">
                                                </div>
                                                <div class="col-10 ps-2">
                                                    <div class="text-dark">Bertha Martin</div>
                                                    <div class="text-muted small mt-1">Aenean tellus metus, bibendum sed,
                                                        posuere ac, mattis non.</div>
                                                    <div class="text-muted small mt-1">5h ago</div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="dropdown-menu-footer">
                                        <a href="#" class="text-muted">TODOS LOS MENSAJES</a>
                                    </div>
                                </div>
                            </li>

                            <!-- USUARIO -->
                            <li class="nav-item dropdown">
                                <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#"
                                   data-bs-toggle="dropdown">
                                    <i class="align-middle" data-feather="settings"></i>
                                </a>

                                <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#"
                                   data-bs-toggle="dropdown">
                                    <img src="img/avatars/avatar.jpg" class="avatar img-fluid rounded-circle me-1" 
                                         <span class="text-dark"><%= personaentidad.getNombre() + " " + personaentidad.getApellidos()%></span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end">
                                    <a class="dropdown-item" href="pages-settings.html">CONFIGURACIÓN</a>								
                                    <div class="dropdown-divider"></div>								
                                    <a class="dropdown-item" href="#">AYUDA</a>
                                    <a class="dropdown-item" href="index.jsp">CERRAR SESION</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>                

                <!-- llamada de seccion -->
                <jsp:include page="<%= PaginaSeccion%>"/>
            </div>
        </div>
        <script src="js/app.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Bar chart
                new Chart(document.getElementById("chartjs-dashboard-bar"), {
                    type: "bar",
                    data: {
                        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                        datasets: [{
                                label: "Last year",
                                backgroundColor: window.theme.primary,
                                borderColor: window.theme.primary,
                                hoverBackgroundColor: window.theme.primary,
                                hoverBorderColor: window.theme.primary,
                                data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
                                barPercentage: .325,
                                categoryPercentage: .5
                            }, {
                                label: "This year",
                                backgroundColor: window.theme["primary-light"],
                                borderColor: window.theme["primary-light"],
                                hoverBackgroundColor: window.theme["primary-light"],
                                hoverBorderColor: window.theme["primary-light"],
                                data: [69, 66, 24, 48, 52, 51, 44, 53, 62, 79, 51, 68],
                                barPercentage: .325,
                                categoryPercentage: .5
                            }]
                    },
                    options: {
                        maintainAspectRatio: false,
                        cornerRadius: 15,
                        legend: {
                            display: false
                        },
                        scales: {
                            yAxes: [{
                                    gridLines: {
                                        display: false
                                    },
                                    ticks: {
                                        stepSize: 20
                                    },
                                    stacked: true,
                                }],
                            xAxes: [{
                                    gridLines: {
                                        color: "transparent"
                                    },
                                    stacked: true,
                                }]
                        }
                    }
                });
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                $("#datetimepicker-dashboard").datetimepicker({
                    inline: true,
                    sideBySide: false,
                    format: "L"
                });
            });
        </script>


    </body>
</html>
</body>
</html>
