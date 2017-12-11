/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servicios;

import java.sql.Connection;
import DTO.Cliente;
import DAO.ClienteDAO;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class TestConexiones {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        try {
            //Cliente cliente = new Cliente("18326971-2", "12345", "julio guerrero", "jguerrero@acl.cl", "23232323");
            ClienteDAO clienteDao = new ClienteDAO();
            Cliente cliente = clienteDao.validaLogin("18326971-2", "12345");
            if (cliente != null) {
                System.err.println("Cliente encontrado con exito " + cliente.getNombre());
            }else{
                System.out.println("Cliente no fue encontrado");
            }
        } catch (Exception e) {
            System.out.println("Se va por el catch"+e.getMessage());
        }
    }
    
}
