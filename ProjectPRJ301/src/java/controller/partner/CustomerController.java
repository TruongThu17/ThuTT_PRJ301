/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.partner;

import Login.BaseAuthenticationController;
import dal.CustomerDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;

/**
 *
 * @author win
 */
public class CustomerController extends BaseAuthenticationController {

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
        CustomerDBContext cdb = new CustomerDBContext();
        String raw_txt = request.getParameter("searchc");
        ArrayList<Customer> customers = new ArrayList<>();
        String err = "";
        final int page_sz = 10;
        int page = 1;
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }
        int totalProducts = cdb.getTotalCustomer();
        int totalPage = totalProducts / page_sz;
        if (totalProducts % page_sz != 0) {
            totalPage += 1;
        }
        if(raw_txt!= null){
            //customers= cdb.getCustomersByName(raw_txt);
            customers= cdb.getCustomersByName(raw_txt, page, page_sz);
        }
        else{
            //customers= cdb.getCustomers();
            customers= cdb.getCustomers(page, page_sz);
        }
         if(customers.isEmpty()){
             err="Danh sách khách hàng rỗng";
              request.setAttribute("err", err);
         }
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("searchc", raw_txt);
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("businesspartner/customer.jsp").forward(request, response);
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
