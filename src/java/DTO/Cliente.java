/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DTO;

/**
 * 
 * @author jg
 */
public class Cliente {
    private String rut;
    private String contrasenha;
    private String nombre;
    private String correo;
    private String telefono;

    public Cliente() {
    }

    public Cliente(String rut, String contrasenha, String nombre, String correo, String telefono) {
        this.rut = rut;
        this.contrasenha = contrasenha;
        this.nombre = nombre;
        this.correo = correo;
        this.telefono = telefono;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getContrasenha() {
        return contrasenha;
    }

    public void setContrasenha(String contrasenha) {
        this.contrasenha = contrasenha;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    @Override
    public String toString() {
        return "Cliente{" + "rut=" + rut + ", contrasenha=" + contrasenha + ", nombre=" + nombre + ", correo=" + correo + ", telefono=" + telefono + '}';
    }
    
}
