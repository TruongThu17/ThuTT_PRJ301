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
import model.ProductType;
import model.Supplier;

/**
 *
 * @author win
 */
public class ProductTypeDBContext extends DBContext {

    public ArrayList<ProductType> getProductType() {
        ArrayList<ProductType> producttypes = new ArrayList<>();
        try {
            String sql = "SELECT [ptId]\n"
                    + "      ,[ptName]\n"
                    + "  FROM [dbo].[ProductType]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ProductType p = new ProductType();
                p.setPtid(rs.getString("ptId"));
                p.setPtname(rs.getString("ptName"));
                producttypes.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return producttypes;
    }
}
