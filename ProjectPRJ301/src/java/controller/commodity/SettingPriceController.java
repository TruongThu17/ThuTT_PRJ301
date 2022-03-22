/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.commodity;

import Login.BaseAuthenticationController;
import dal.InforProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Inventory;
import model.SetPrice;

/**
 *
 * @author win
 */
public class SettingPriceController extends BaseAuthenticationController {


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
        ArrayList<SetPrice> setting = new ArrayList<>();
        InforProductDBContext db = new InforProductDBContext();
        ArrayList<Inventory> inventory = db.checkInventory();
        
        for (Inventory i : inventory) {
            String n = request.getParameter(i.getId());
            if (n != null) {
                SetPrice s = new SetPrice();
                s.setId(i.getId());
                s.setPrice(n);
                setting.add(s);
            }
        }
        
        db.setprices(setting);
        response.sendRedirect("settingprice");
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
