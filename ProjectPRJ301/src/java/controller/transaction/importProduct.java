/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.transaction;

import Login.BaseAuthenticationController;
import dal.InforProductDBContext;
import dal.ProductDBContext;
import dal.ProductTypeDBContext;
import dal.SupplierDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.InforProduct;
import model.Producer;
import model.Product;
import model.ProductType;
import model.Supplier;

/**
 *
 * @author win
 */
public class importProduct extends BaseAuthenticationController {


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
        InforProductDBContext db = new InforProductDBContext();
        ArrayList<InforProduct> products = db.getInforProduct();
        request.setAttribute("products", products);
        SupplierDBContext sdb = new SupplierDBContext();
        ArrayList<Supplier> suppliers = sdb.getSupplier();
        request.setAttribute("suppliers", suppliers);
        ProductTypeDBContext ptdb = new ProductTypeDBContext();
        ArrayList<ProductType> producttypes = ptdb.getProductType();
        request.setAttribute("producttypes", producttypes);
        String raw = request.getParameter("raw");
        if(raw!=null){
        request.setAttribute("raw", raw);}
        request.getRequestDispatcher("transaction/importProduct.jsp").forward(request, response);
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
        String id = request.getParameter("id");
        String barcode = request.getParameter("code");
        String name = request.getParameter("name");
        String price = request.getParameter("importprice");
        float pricep = Float.parseFloat(price);
        String nsx = request.getParameter("nsx");
        String hsd = request.getParameter("hsd");
        Date hsdp = null;
        if(hsd!=null){
         hsdp= Date.valueOf(hsd);}
        String sl = request.getParameter("sl");
        int slp = Integer.parseInt(sl);
        String unit = request.getParameter("unit");
        String sid = request.getParameter("sid");
        String note= request.getParameter("note");
        String ptid = request.getParameter("ptid");
        long millis=System.currentTimeMillis(); 
        java.sql.Date date=new java.sql.Date(millis);
        Product p = new Product(id, name, nsx, ptid);
        InforProduct infp = new InforProduct(id, barcode, pricep, 0, hsdp, slp, unit, true, date, sid, note);
        ProductDBContext pdb = new ProductDBContext();
        InforProductDBContext idb = new InforProductDBContext();
        pdb.insertProduct(p);
        idb.insertInforProduct(infp);
        response.sendRedirect("importproduct?raw=1");
        
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
