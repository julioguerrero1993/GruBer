/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.gruber.Controller;

import DAO.ClienteDAO;
import DTO.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jg
 */
@WebServlet(name = "LoginClienteController", urlPatterns = {"/LoginClienteController"})
public class LoginClienteController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String rut = request.getParameter("rut");
            String pass = request.getParameter("password");
            
            //creando la session usuario, luego a esta se le seteara un obj 
            //tipo cliente para rescatar datos y pintarlos mas adelante
            HttpSession sesionCliente = request.getSession(true);
            
            
            //se llama al dao para usar su metodo validador del login
            ClienteDAO clienteDao = new ClienteDAO();
            Cliente cliente = clienteDao.validaLogin(rut, pass);
            if (cliente != null) {
                System.err.println("Pasa la validacion");
                sesionCliente.setAttribute("sessionCliente", cliente);
                response.sendRedirect("PanelUsuario/panel_usuario.jsp");
            }else {
                System.err.println("No paaasa la validacion");
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
                System.err.println("Se cae la validacion");
                response.sendRedirect("error/error.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
