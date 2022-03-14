/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.transaction;

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
public class importProducts extends HttpServlet {

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
        ArrayList<InforProduct> products = new ArrayList<>();
        String raw_did = request.getParameter("did");
        String raw_txt = request.getParameter("searchP");
        String err = null;
        ProductDBContext pdb = new ProductDBContext();
        ArrayList<Product> product = new ArrayList<>();
        if (raw_did == null || raw_did.length() == 0 || "-1".equals(raw_did)) {
            if (raw_txt == null) {
                product = pdb.getProduct();
                products =db.getInforProduct();
            } else {
                product = pdb.getProductByString(raw_txt);
                products = db.getInforProductByPname(raw_txt);
            }
        } else {
            if (raw_txt == null) {
                product = pdb.getProductByPTid(raw_did);
                products = db.getInforProductByPTid(raw_did);
            } else {
                product = pdb.getProductByPTidandName(raw_txt, raw_did);
                products = db.getProductByPTidandName(raw_txt, raw_did);
            }
        }
        if (product.isEmpty()) {
            err = "Danh sách sản phẩm rỗng";
            request.setAttribute("err", err);
        }
         request.setAttribute("did", raw_did);
        request.setAttribute("products", products);
        SupplierDBContext sdb = new SupplierDBContext();
        request.setAttribute("product", product);
        ArrayList<Supplier> suppliers = sdb.getSupplier();
        request.setAttribute("suppliers", suppliers);
        ProductTypeDBContext ptdb = new ProductTypeDBContext();
        ArrayList<ProductType> producttypes = ptdb.getProductType();
        request.setAttribute("producttypes", producttypes);
        request.getRequestDispatcher("transaction/importProducts.jsp").forward(request, response);
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
