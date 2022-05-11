<%-- 
    Document   : Tipo_pago
    Created on : 9 may 2022, 11:50:03
    Author     : Desarrollo2
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Entidad.TipoPago"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Tipo_pagoModelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Tipo_pagoModelo tipoPago = new Tipo_pagoModelo();
    List<TipoPago> DatosTipoP = tipoPago.MostrarTipo();
    Iterator<TipoPago> Tipoiterator = DatosTipoP.iterator();
    TipoPago TipoPdato = null;
%>
<!DOCTYPE html>
<main class="content">
    <div class="container-fluid p-0">

        <h1 class="h3 mb-3">TIPO DE PAGO</h1>

        <div class="card">
            <div class="card-header">
               <button type="button" class="btn btn-primary float-end col-md-12" data-bs-toggle="modal" data-bs-target="#sizedModalLg">
                        <i class="fas fa-plus"></i>
                        Registrar nuevo
                    </button>
            </div>
            <table class="table">
                <thead>
                    <tr>
                        <th style="width:20%" class="text-center">Codigo</th>
                        <th style="width:20%" class="text-center">Nombre</th>
                        <th class="text-center" style="width:20%">Numero de dias</th>
                        <th style="width:20%" class="text-center">Activo</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                        <%
                            while (Tipoiterator.hasNext()) {
                                TipoPdato = Tipoiterator.next();


                        %>
                    <tr >
                        
                        <td class="text-center"><%=TipoPdato.getId_tipo()%></td>
                        <td class="text-center"><%=TipoPdato.getDescrip()%></td>
                        <td class="text-center"><%=TipoPdato.getNro_dias()%></td>
                        <%
                            String dato= TipoPdato.getEstado();
                             switch(dato)
                              {
                                 case "ACTIVO":
                           %>
                        <td class="text-center" ><span class="badge bg-success"><%=TipoPdato.getEstado()%></span></td>
                        <%
                             break;
                             default:
                        %>
                          <td class="text-center" ><span class="badge bg-warning"><%=TipoPdato.getEstado()%></span></td>
                           <%
                               break;
                               } 
                        %>
                        <td class="table-action">
                            <a href="#"><i class="align-middle" data-feather="edit-2"></i></a>
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
</main>