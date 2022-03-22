/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.commodity;

import Login.BaseAuthenticationController;
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
public class CheckInventory extends BaseAuthenticationController {

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
        InforProductDBContext db = new InforProductDBContext();
        ArrayList<Inventory> inventoris = new ArrayList<>();
        String raw_txt = request.getParameter("searchP");
        String err = null;
        final int page_sz = 10;
        int page = 1;
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }
        int totalProducts = db.getTotalProducts(raw_txt);
        int totalPage = totalProducts / page_sz;
        if (totalProducts % page_sz != 0) {
            totalPage += 1;
        }
        if (raw_txt != null) {
            //inventoris = db.checkInventoryByString(raw_txt);
            inventoris = db.checkInventoryByString(raw_txt, page, page_sz);
        } else {
            // inventoris = db.checkInventory();
            inventoris = db.checkInventori(page, page_sz);

        }
        if (inventoris.size() == 0) {
            err = "Không có sản phẩm bạn cần tìm ";
            request.setAttribute("err", err);
        }
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("searchP", raw_txt);
        request.setAttribute("inventoris", inventoris);
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


}
