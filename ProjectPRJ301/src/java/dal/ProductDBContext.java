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
import model.Producer;
import model.Product;
import model.ProductType;

/**
 *
 * @author win
 */
public class ProductDBContext extends DBContext {

    public ArrayList<Product> getProduct() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT [pid]\n"
                    + "      ,[pname]\n"
                    + "      ,[ptid]\n"
                    + "  FROM [dbo].[Prod]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProid(rs.getString("pid"));
                p.setPname(rs.getString("pname"));
                p.setPtid(rs.getString("ptid"));
                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
}
