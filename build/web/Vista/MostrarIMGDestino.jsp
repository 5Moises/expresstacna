<%-- 
    Document   : MostrarIMGDestino
    Created on : 5 may 2022, 13:50:14
    Author     : Desarrollo2
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="Configuracion.Conexion"%>
<%@page import="java.sql.*"%>
<%
    int  CodProducto = Integer.parseInt(request.getParameter("CodProducto").toString());
    try {
        Connection con = Conexion.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT img FROM rutas WHERE id_Ruta = ? ");        
        ps.setInt(1, CodProducto);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Blob blob = rs.getBlob(1);
            byte byteArray[] = blob.getBytes(1, (int) blob.length());
           response.setContentType("image/gif");
            OutputStream os = response.getOutputStream();
            os.write(byteArray);
            os.flush();
            os.close();
        } else {
          out.println("No image found with this id.");
        }
    } catch (Exception e) {
        out.println(e);
    }
%>