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
import model.Inventory;
import model.SetPrice;

/**
 *
 * @author win
 */
public class InforProductDBContext extends DBContext {

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
                p.setDateimport(rs.getDate("dateimport"));
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

    public ArrayList<Inventory> checkInventory() {
        ArrayList<Inventory> inventorys = new ArrayList<>();
        try {
            String sql = "select a.pid, a.pname,a.nsx, b.saleprice, sum(b.quantityinstock) as qt, b.status, b.unit, c.ptName  from Prod a inner join InforProduct b on a.pid = b.pid\n"
                    + "inner join ProductType c on a.ptid = c.ptId where b.status = 1\n"
                    + "group by a.pid, a.pname, b.saleprice,a.nsx, b.status, b.unit, a.ptid, c.ptName\n"
                    + "order by a.pid";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Inventory i = new Inventory();
                i.setId(rs.getString("pid"));
                i.setName(rs.getString("pname"));
                i.setNsx(rs.getString("nsx"));
                i.setPrice(rs.getFloat("saleprice"));
                i.setSl(rs.getInt("qt"));
                i.setStatus(rs.getBoolean("status"));
                i.setUnit(rs.getString("unit"));
                i.setPtname(rs.getString("ptName"));
                inventorys.add(i);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return inventorys;
    }

    public void insertInforProduct(InforProduct infp) {
        PreparedStatement stm = null;
        try {
            String sql2 = "INSERT INTO [dbo].[InforProduct]\n"
                    + "           ([code]\n"
                    + "           ,[pid]\n"
                    + "           ,[importprice]\n"
                    + "           ,[saleprice]\n"
                    + "           ,[dateexpiry]\n"
                    + "           ,[quantityinstock]\n"
                    + "           ,[unit]\n"
                    + "           ,[status]\n"
                    + "           ,[sid]\n"
                    + "           ,[Note])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            stm = connection.prepareStatement(sql2);
            stm.setString(1, infp.getId());
            stm.setString(2, infp.getPid());
            stm.setFloat(3, infp.getImportprice());
            stm.setFloat(4, infp.getSaleprice());
            stm.setDate(5, infp.getDateexp());
            stm.setInt(6, infp.getQuantity());
            stm.setString(7, infp.getUnit());
            stm.setBoolean(8, infp.isStatus());
            stm.setString(9, infp.getSid());
            stm.setString(10, infp.getNote());
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

    public void setprices(ArrayList<SetPrice> prices) {
        PreparedStatement stm = null;
        for (SetPrice p : prices) {
            if (p.getPrice() != null) {
                try {
                    String sql = "UPDATE [InforProduct]\n"
                            + "   SET  [saleprice] = ?\n"
                            + "   where pid =?";
                    stm = connection.prepareStatement(sql);
                    stm.setFloat(1, Float.parseFloat(p.getPrice()));
                    stm.setString(2, p.getId());
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
    }

}
