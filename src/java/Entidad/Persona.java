/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;

/**
 *
 * @author Desarrollo2
 */
public class Persona {
     private int id_P,SesionCodPersona;

    public int getSesionCodPersona() {
        return SesionCodPersona;
    }

    public void setSesionCodPersona(int SesionCodPersona) {
        this.SesionCodPersona = SesionCodPersona;
    }
     private String sede, usuario, contra;

    public String getSede() {
        return sede;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public int getRol() {
        return Rol;
    }

    public void setRol(int Rol) {
        this.Rol = Rol;
    }
     private int Rol;
     private String DocIden;
     private String nombre;
     private String Apellidos;
     private String Ocupacion;
     private String Brevete;
     private int estado;
     private String Razon_Social;
     private String Direcccion;
     private String Telefono;
     private String Email;     

    public int getId_P() {
        return id_P;
    }

    public void setId_P(int id_P) {
        this.id_P = id_P;
    }

    public String getDocIden() {
        return DocIden;
    }

    public void setDocIden(String DocIden) {
        this.DocIden = DocIden;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getOcupacion() {
        return Ocupacion;
    }

    public void setOcupacion(String Ocupacion) {
        this.Ocupacion = Ocupacion;
    }

    public String getBrevete() {
        return Brevete;
    }

    public void setBrevete(String Brevete) {
        this.Brevete = Brevete;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getRazon_Social() {
        return Razon_Social;
    }

    public void setRazon_Social(String Razon_Social) {
        this.Razon_Social = Razon_Social;
    }

    public String getDirecccion() {
        return Direcccion;
    }

    public void setDirecccion(String Direcccion) {
        this.Direcccion = Direcccion;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
}
