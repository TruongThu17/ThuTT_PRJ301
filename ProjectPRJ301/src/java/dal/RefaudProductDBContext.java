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
import model.InfRefaudProduct;
import model.RefaudProduct;

/**
 *
 * @author win
 */
public class RefaudProductDBContext extends DBContext {

    public ArrayList<RefaudProduct> getRefaud() {
        ArrayList<RefaudProduct> refaudproducts = new ArrayList<>();
        try {
            String sql = "select * from RefaudProduct";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                RefaudProduct rp = new RefaudProduct();
                rp.setRpid(rs.getString("rpid"));
                rp.setDaterefaud(rs.getDate("daterefaud"));
                rp.setTotal(rs.getFloat("total"));
                rp.setSid(rs.getString("sid"));
                ArrayList<InfRefaudProduct> inf = getAll(rs.getString("rpid"));
                rp.setInf(inf);
                refaudproducts.add(rp);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RefaudProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return refaudproducts;
    }

    private ArrayList<InfRefaudProduct> getAll(String string) {
        ArrayList<InfRefaudProduct> inf = new ArrayList<>();
        try {
            String sql = "select * from InfRefaudProduct where rpid = ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                InfRefaudProduct i = new InfRefaudProduct();
                i.setCode(rs.getString("code"));
                i.setQuantity(rs.getInt("quantity"));
                i.setImportprice(rs.getFloat("importprice"));
                inf.add(i);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RefaudProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return inf;
    }

    public void deleteRefaudProduct(String id) {
        PreparedStatement stm = null;
        try {
            String sql = "DELETE FROM [dbo].[RefaudProduct]\n"
                    + "      WHERE rpid=?";

            stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RefaudProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RefaudProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RefaudProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void deleteInfRefaudProduct(String id) {
        PreparedStatement stm = null;
        try {
            String sql = "DELETE FROM [dbo].[InfRefaudProduct]\n"
                    + "      WHERE rpid=?";

            stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RefaudProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RefaudProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public int Count() {
        try {
            String sql = "  select count(*) from RefaudProduct";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) +1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
