/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.service;

import dal.BilledDBContext;
import dal.RefaudDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Billed;
import model.InfoBilled;

/**
 *
 * @author win
 */
public class CustomerRefaudController extends HttpServlet {

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
        RefaudDBContext db = new RefaudDBContext();
        // mã trả hàng
        String rid ="r"+ db.Count();
        request.setAttribute("rid", rid);
        // lấy tất cả các bill
        BilledDBContext bdb = new BilledDBContext();
        ArrayList<Billed> allbill = bdb.getAllBilled();
        request.setAttribute("allbill", allbill);
        // lấy mã bill từ request 
        String bid = request.getParameter("bid");
        // mã, tên khách hàng
        String cid = db.getIDCustomer(bid);
        String cname = db.getNameCustomer(bid);
        request.setAttribute("cid", cid);
        request.setAttribute("cname", cname);
        // lấy ra toàn bộ các sản phẩm có trong bill đó 
        ArrayList<InfoBilled> products = bdb.getAllProductInBilled(bid);
        request.setAttribute("products", products);
        request.setAttribute("bid", bid);
        request.getRequestDispatcher("service/refaud.jsp").forward(request, response);
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
