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
import model.Account;
import model.Supplier;

/**
 *
 * @author win
 */
public class SupplierDBContext extends DBContext {

    public ArrayList<Supplier> getSupplier() {
        ArrayList<Supplier> suppliers = new ArrayList<>();
        try {
            String sql = "select Sid, SName from Supplier";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Supplier s = new Supplier();
                s.setId(rs.getString("Sid"));
                s.setName(rs.getString("SName"));
                suppliers.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return suppliers;
    }
}
