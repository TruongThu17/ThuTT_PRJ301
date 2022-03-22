/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.home;

import Login.BaseAuthenticationController;
import dal.BilledDBContext;
import dal.HomeDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Bill_Month_Day;

/**
 *
 * @author win
 */
public class HomeController extends BaseAuthenticationController {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            BilledDBContext db = new BilledDBContext();
            float totalday = db.getTotalDay();
            float totalmonth = db.getTotalMonth();
            HomeDBContext hdb = new HomeDBContext();
            
            String err1 = "";
            String err2 = "";
            final int page_sz = 10;
            int page1 = 1,page2 = 1;
            String pageStr1 = request.getParameter("page1");
            String pageStr2 = request.getParameter("page2");
            if (pageStr1 != null) {
                page1 = Integer.parseInt(pageStr1);
            }
            if (pageStr2 != null) {
                page2 = Integer.parseInt(pageStr2);
            }
            int totalProducts1 = db.getTotalBillMonth();
            int totalPage1 = totalProducts1 / page_sz;
            if (totalProducts1 % page_sz != 0) {
                totalPage1 += 1;
            }
            ArrayList<Bill_Month_Day> billOnMonth = hdb.getBillOnMonth(page1, page_sz);
            if (billOnMonth.isEmpty()) {
                err1 = "Danh sách khách hàng rỗng";
                request.setAttribute("err1", err1);
            }
            
            
            int totalProducts2 = db.getTotalBillDay();
            int totalPage2 = totalProducts2 / page_sz;
            if (totalProducts2 % page_sz != 0) {
                totalPage2 += 1;
            }
            ArrayList<Bill_Month_Day> billOnDay = hdb.getBillOnDay(page1, page_sz);
            if (billOnMonth.isEmpty()) {
                err2 = "Danh sách khách hàng rỗng";
                request.setAttribute("err2", err2);
            }
            request.setAttribute("page1", page1);
            request.setAttribute("page2", page2);
            request.setAttribute("totalPage1", totalPage1);
            request.setAttribute("totalPage2", totalPage2);
            request.setAttribute("billOnDay", billOnDay);
            request.setAttribute("billOnMonth", billOnMonth);
            request.setAttribute("totalday", totalday);
            request.setAttribute("totalmonth", totalmonth);
            request.getRequestDispatcher("home.jsp").forward(request, response);

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
