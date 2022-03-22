/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.transaction;

import Login.BaseAuthenticationController;
import dal.CustomerDBContext;
import dal.OrderDBContext;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Billed;
import model.Customer;

/**
 *
 * @author win
 */
public class OrderController extends BaseAuthenticationController {

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
        String err = "";
        OrderDBContext db = new OrderDBContext();

        CustomerDBContext cdb = new CustomerDBContext();
        String search = request.getParameter("search");
        ArrayList<Customer> customers = new ArrayList<>();
        final int page_sz = 10;
        int page = 1;
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }
        int totalProducts = db.getTotalOrder(search);
        int totalPage = totalProducts / page_sz;
        if (totalProducts % page_sz != 0) {
            totalPage += 1;
        }
        if ("".equals(search) || search == null) {
            //customers = cdb.getCustomerInOrder();
            customers = cdb.getCustomerInOrder(page, page_sz);
            ArrayList<Billed> billed = db.getAllOrder();
            request.setAttribute("billed", billed);
        } else {
            //customers = cdb.getCustomerbyNameInOrder(search);
            customers = cdb.getCustomerbyNameInOrder(search, page, page_sz);
            ArrayList<Billed> billed = db.getOrderByCustomerName(search);
            request.setAttribute("billed", billed);
        }
        if (customers.isEmpty()) {
            err = "Danh sánh rỗng!";
            request.setAttribute("err", err);
        }
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("search", search);
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("transaction/order.jsp").forward(request, response);
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
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
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
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
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
