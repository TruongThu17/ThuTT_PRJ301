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
            String sql = "select Sid, SName, Phone, Email from Supplier";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Supplier s = new Supplier();
                s.setId(rs.getString("Sid"));
                s.setName(rs.getString("SName"));
                s.setPhone(rs.getString("Phone"));
                s.setEmail(rs.getString("Email"));
                suppliers.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger( SupplierDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger( SupplierDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger( SupplierDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger( SupplierDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void updateSupplier(Supplier s) {

        PreparedStatement stm = null;
        try {
            String sql = "UPDATE [dbo].[Supplier]\n"
                    + "   SET [SName] = ?\n"
                    + "      ,[Email] = ?\n"
                    + "      ,[Phone] = ?\n"
                    + " WHERE Sid =?";

            stm = connection.prepareStatement(sql);
            stm.setString(4, s.getId());
            stm.setString(1, s.getName());
            stm.setString(2, s.getEmail());
            stm.setString(3, s.getPhone());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger( SupplierDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger( SupplierDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger( SupplierDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public Supplier getSupplierId(String id) {

        try {
            String sql = "SELECT Sid, SName, Phone, Email"
                    + "  FROM [dbo].[Supplier] where Sid =?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Supplier s = new Supplier();
                s.setId(rs.getString("Sid"));
                s.setName(rs.getString("Sname"));
                s.setPhone(rs.getString("Phone"));
                s.setEmail(rs.getString("Email"));
                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger( SupplierDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertSupplier(Supplier s) {
        PreparedStatement stm = null;
        try {
            String sql = "INSERT INTO [dbo].[Supplier]\n"
                    + "           ([Sid]\n"
                    + "           ,[SName]\n"
                    + "           ,[Email]\n"
                    + "           ,[Phone])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";

            stm = connection.prepareStatement(sql);
            stm.setString(1, s.getId());
            stm.setString(2, s.getName());
            stm.setString(3, s.getEmail());
            stm.setString(4, s.getPhone());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger( SupplierDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger( SupplierDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger( SupplierDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public ArrayList<Supplier> getSupplierByName(String raw_txt) {
       ArrayList<Supplier> suppliers = new ArrayList<>();
        try {
            String sql = "select Sid, SName, Phone, Email from Supplier where SName like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%"+raw_txt+"%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Supplier s = new Supplier();
                s.setId(rs.getString("Sid"));
                s.setName(rs.getString("SName"));
                s.setPhone(rs.getString("Phone"));
                s.setEmail(rs.getString("Email"));
                suppliers.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger( SupplierDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return suppliers;
    }
}
