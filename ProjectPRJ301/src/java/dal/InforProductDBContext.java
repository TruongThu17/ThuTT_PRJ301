/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.InforProduct;

/**
 *
 * @author win
 */
public class InforProductDBContext extends DBContext{
    public ArrayList<InforProduct> getInforProduct() {
        ArrayList<InforProduct> products = new ArrayList<>();
        try {
            String sql = "select * from InforProduct";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                InforProduct p = new InforProduct();
                p.setId(rs.getString("code"));
                p.setPid(rs.getString("pid"));
                p.setImportprice(rs.getFloat("importprice"));
                p.setSaleprice(rs.getFloat("saleprice"));
                p.setDateexp(rs.getDate("dateexpiry"));
                p.setNsx(rs.getString("nsx"));
                p.setQuantity(rs.getInt("quantityinstock"));
                p.setUnit(rs.getString("unit"));
                p.setStatus(rs.getBoolean("status"));
                p.setSid(rs.getString("sid"));
                p.setNote(rs.getString("Note"));
                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

}
