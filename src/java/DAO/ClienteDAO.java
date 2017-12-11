/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import DTO.Cliente;
import Servicios.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 
 * @author jg
 */
public class ClienteDAO {

    PreparedStatement ps;
    private static final String SQL_INSERT = "INSERT INTO cliente(Rut, Contraseña, Nombre, Correo, Telefono) VALUES (?,?,?,?,?)";
    private static final String SQL_LOGIN = "SELECT * FROM cliente WHERE Rut = ? AND Contraseña = ?";
    private static final Conexion con = Conexion.getInstance();
    
    public int insert(Cliente cliente){
        int flag = 0;
        try {
            ps = con.getCnn().prepareStatement(SQL_INSERT);
            ps.setString(1, cliente.getRut());
            ps.setString(2, cliente.getContrasenha());
            ps.setString(3, cliente.getNombre());
            ps.setString(4, cliente.getCorreo());
            ps.setString(5, cliente.getTelefono());
            flag = ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error al ingresar cliente" + e.getMessage());
        }
        return flag;
    }
    
    public Cliente validaLogin(String rut, String pass){
        Cliente cliente = null;
        try {
            cliente = null;
            ps = con.getCnn().prepareStatement(SQL_LOGIN);
            ps.setString(1, rut);
            ps.setString(2, pass);
            ResultSet res = ps.executeQuery();
            if(res.next()){
                cliente = new Cliente(res.getString(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5));
            }
        } catch (SQLException e) {
            System.err.println("Error al buscar cliente " + e.getMessage());
        }
        return cliente;
    }
}
