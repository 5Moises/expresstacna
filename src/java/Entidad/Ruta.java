/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;

import java.io.IOException;
import java.io.InputStream;
import javax.servlet.http.Part;

/**
 *
 * @author Desarrollo2
 */
public class Ruta {
    
    private int id_ruta;
    private String Destino;
    private String Abreviatura;
    private String Direccion;    
    private InputStream ConverImagen;
    private Part Imagen;
   
   public InputStream ObtenerImagen() throws IOException {
        if (Imagen != null) {
            ConverImagen = Imagen.getInputStream();
        }
        return ConverImagen;
    }

    public void ColocarImagen(Part Imagen) {
        if (Imagen.getSubmittedFileName() != "") {
            this.Imagen = Imagen;
        }
    }     
    public int getId_ruta() {
        return id_ruta;
    }

    public void setId_ruta(int id_ruta) {
        this.id_ruta = id_ruta;
    }

    public String getDestino() {
        return Destino;
    }

    public void setDestino(String Destino) {
        this.Destino = Destino;
    }

    public String getAbreviatura() {
        return Abreviatura;
    }

    public void setAbreviatura(String Abreviatura) {
        this.Abreviatura = Abreviatura;
    }

    public String getDireccion() {
        return Direccion;
    }
     
    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }
    
}
