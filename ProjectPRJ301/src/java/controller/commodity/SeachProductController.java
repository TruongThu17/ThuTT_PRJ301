/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.commodity;

import Login.BaseAuthenticationController;
import dal.InforProductDBContext;
import dal.ProductDBContext;
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

/**
 *
 * @author win
 */
public class SeachProductController extends BaseAuthenticationController {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SeachProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SeachProductController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        response.setContentType("text/html;charset=UTF-8");
        ProductDBContext db = new ProductDBContext();
        InforProductDBContext idb = new InforProductDBContext();
        
        String searchKey = request.getParameter("searchKey");
        PrintWriter writer = response.getWriter();
        String result = "";
        if (searchKey != null) {
            Product p = db.getProductById(searchKey);
            Inventory in = null;
            ArrayList<Inventory> inforProduct = idb.checkInventory();
            for (Inventory info : inforProduct) {
                if (info.getId().equals(p.getProid())) {
                    in = info;
                    break;
                }
            }
            result += p.getProid() + "|";
            result += p.getPname() + "|";
            result += in.getUnit() + "|";
            result += in.getPrice();
        }
        writer.print(result);

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
        response.setContentType("text/html;charset=UTF-8");
        ProductDBContext db = new ProductDBContext();
        InforProductDBContext idb = new InforProductDBContext();
        String searchKey = request.getParameter("searchKey");
        PrintWriter writer = response.getWriter();
        String result = "";
        if (searchKey != null) {
            Product p = db.getProductById(searchKey);
            if (p != null) {
                InforProduct in = null;
                ArrayList<InforProduct> inforProduct = idb.getInforProduct();
                for (InforProduct info : inforProduct) {
                    if (info.getPid().equals(p.getProid())) {
                        in = info;
                        break;
                    }
                }
                result += "<div onclick=\"addToCart('" + p.getProid() + "')\" class=\"row\" id =\"" + p.getProid() + "\">";
                result += "<span>" + p.getProid() + "</span>";
                result += "<span>" + p.getPname() + "</span>";
                result += "<span>" + in.getUnit() + "</span>";
                result += "<span>" + in.getSaleprice() + "</span>";
                result += "</div>";
            } else {
                result = "Không tìm thấy sản phẩm";
            }
        }
        
        result.trim();
        writer.print(result);
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
