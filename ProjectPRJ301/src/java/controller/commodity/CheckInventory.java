/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.commodity;

import dal.InforProductDBContext;
import dal.ProductDBContext;
import dal.ProductTypeDBContext;
import dal.SupplierDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.InforProduct;
import model.Inventory;
import model.Product;
import model.ProductType;
import model.Supplier;

/**
 *
 * @author win
 */
public class CheckInventory extends HttpServlet {

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

        String raw_did = request.getParameter("did");
        if (raw_did == null || raw_did.length() == 0||"-1".equals(raw_did)) {
            InforProductDBContext db = new InforProductDBContext();
            ArrayList<Inventory> inventoris = db.checkInventory();
            request.setAttribute("inventoris", inventoris);
        } else {
            request.setAttribute("did", raw_did);
            InforProductDBContext db = new InforProductDBContext();
            ArrayList<Inventory> inventoris = db.checkInventoryByID(raw_did);
            request.setAttribute("inventoris", inventoris);
        }
        ProductTypeDBContext ptdb = new ProductTypeDBContext();
        ArrayList<ProductType> producttypes = ptdb.getProductType();
        request.setAttribute("producttypes", producttypes);
        request.getRequestDispatcher("commodity/checkInventory.jsp").forward(request, response);
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
