/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.service;

import dal.BilledDBContext;
import dal.InforProductDBContext;
import dal.ProductDBContext;
import dal.RefaudDBContext;
import dal.RefaudProductDBContext;
import dal.SupplierDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Billed;
import model.InfoBilled;
import model.InforProduct;
import model.Product;
import model.Supplier;

/**
 *
 * @author win
 */
public class SupplierRefaud extends HttpServlet {

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
        RefaudProductDBContext db = new RefaudProductDBContext();
        // mã trả hàng nhập
        String rpid ="rp"+ db.Count();
        request.setAttribute("rpid", rpid);
        // lấy tất cả các sản phẩm 
        ProductDBContext pdb = new ProductDBContext();
        ArrayList<Product> product = pdb.getProduct();
        request.setAttribute("product", product);
        // lấy mã bill từ request 
        String pid = request.getParameter("pid");
        
        // mã, tên nhà cung cấp
        SupplierDBContext sdb = new SupplierDBContext();
        ArrayList<Supplier> Supplier = sdb.getSupplier();
        request.setAttribute("Supplier", Supplier);
        // lấy mã nhà cung cấp 
        String sid = request.getParameter("sid");
        // lấy các sản phẩm có code và nhà cung cấp cần tìm
        InforProductDBContext idb = new InforProductDBContext();
        ArrayList<InforProduct> InforProduct = new ArrayList<>();
        if(pid!=null && sid!=null){
            InforProduct = idb.getInforProductByPidAndSid(pid, sid);
        }
        request.setAttribute("InforProduct", InforProduct);
        request.setAttribute("pid", pid);
        request.setAttribute("sid", sid);
        request.getRequestDispatcher("service/refaudproduct.jsp").forward(request, response);
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
