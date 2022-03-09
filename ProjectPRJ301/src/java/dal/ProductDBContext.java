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
                    + "      ,[nsx]\n"
                    + "      ,[ptid]\n"
                    + "  FROM [dbo].[Prod]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProid(rs.getString("pid"));
                p.setPname(rs.getString("pname"));
                p.setNsx(rs.getString("nsx"));
                p.setPtid(rs.getString("ptid"));
                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    public ArrayList<Product> getProductByPTid(String ptid) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT [pid]\n"
                    + "      ,[pname]\n"
                    + "      ,[nsx]\n"
                    + "      ,[ptid]\n"
                    + "  FROM [dbo].[Prod] where ptid =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, ptid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProid(rs.getString("pid"));
                p.setPname(rs.getString("pname"));
                p.setNsx(rs.getString("nsx"));
                p.setPtid(rs.getString("ptid"));
                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public void insertProduct(Product p) {
        PreparedStatement stm = null;
        try {
            String sql1 = "INSERT INTO [dbo].[Prod]\n"
                    + "           ([pid]\n"
                    + "           ,[pname]\n"
                    + "           ,[nsx]\n"
                    + "           ,[ptid])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            stm = connection.prepareStatement(sql1);
            stm.setString(1, p.getProid());
            stm.setString(2, p.getPname());
            stm.setString(3, p.getNsx());
            stm.setString(4, p.getPtid());
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

    public void deleteProduct(String id) {
        PreparedStatement stm = null;
        try {
            String sql1 = "DELETE FROM [dbo].[Prod]\n"
                    + "      WHERE pid =?";
            stm = connection.prepareStatement(sql1);
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

    public void deleteInforProduct(String id) {
        PreparedStatement stm = null;
        try {
            String sql1 = "DELETE FROM [dbo].[InforProduct]\n"
                    + "      WHERE pid =?";
            stm = connection.prepareStatement(sql1);
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
}
