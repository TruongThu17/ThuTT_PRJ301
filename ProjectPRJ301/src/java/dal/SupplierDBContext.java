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
import model.Customer;
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

    public void deleteSupplier(String id) {

        PreparedStatement stm = null;
        try {
            String sql = "DELETE FROM [dbo].[Supplier]\n"
                    + "      WHERE Sid=?";

            stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void updateSupplier(Supplier s) {

        PreparedStatement stm = null;
        try {
            String sql = "UPDATE [dbo].[Supplier]\n"
                    + "   SET [SName] = ?\n"
                    + " WHERE Sid=?";

            stm = connection.prepareStatement(sql);
            stm.setString(2, s.getId());
            stm.setString(1, s.getName());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public Supplier getSupplierId(String id) {

        try {
            String sql = "SELECT [Sid]\n"
                    + "      ,[SName]\n"
                    + "  FROM [dbo].[Supplier] where Sid =?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Supplier s = new Supplier();
                s.setId(rs.getString("Sid"));
                s.setName(rs.getString("Sname"));

                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
