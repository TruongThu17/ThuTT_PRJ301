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
import model.Detail;
import model.Refaud;
import model.RefaudProduct;

/**
 *
 * @author win
 */
public class RefaudDBContext extends DBContext {

    public ArrayList<Refaud> getRefaud() {
        ArrayList<Refaud> refauds = new ArrayList<>();
        try {
            String sql = "with x as(\n"
                    + "select a.bid,a.rid,a.date, b.cid  from Refund a inner join  Billed b on a.bid = b.bid ),\n"
                    + "y as(\n"
                    + "select sum(quantity*unitprice) as total, rid from InfRefund group by rid)\n"
                    + "select x.bid,x.cid,x.date, x.rid, y.total from x inner join y on x.rid = y.rid";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Refaud r = new Refaud();
                r.setBid(rs.getString("bid"));
                r.setCid(rs.getString("cid"));
                r.setRid(rs.getString("rid"));
                r.setTotal(rs.getFloat("total"));
                r.setDaterefaud(rs.getDate("date"));
                refauds.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return refauds;
    }

    public ArrayList<Refaud> getRefaudByName(String raw_txt) {
        ArrayList<Refaud> refauds = new ArrayList<>();
        try {
            String sql = "with x as(\n"
                    + "select a.bid,a.rid,a.date, b.cid, c.cname  from Refund a inner join  Billed b on a.bid = b.bid \n"
                    + "inner join Customer c on b.cid= c.cid\n"
                    + "),\n"
                    + "y as(\n"
                    + "select sum(quantity*unitprice) as total, rid from InfRefund group by rid)\n"
                    + "select x.bid,x.cid,x.date, x.rid, y.total, x.cname from x inner join y on x.rid = y.rid where x.cname like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + raw_txt + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Refaud r = new Refaud();
                r.setBid(rs.getString("bid"));
                r.setCid(rs.getString("cid"));
                r.setRid(rs.getString("rid"));
                r.setTotal(rs.getFloat("total"));
                r.setDaterefaud(rs.getDate("date"));
                refauds.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return refauds;
    }

    public void deleteRefaud(String id) {
        PreparedStatement stm = null;
        try {
            String sql = "DELETE FROM [dbo].[Refund]\n"
                    + "      WHERE rid=?";

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
                    Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void deleteInfRefaud(String id) {
        PreparedStatement stm = null;
        try {
            String sql = "DELETE FROM [dbo].[InfRefund]\n"
                    + "      WHERE rid=?";

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
                    Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public int Count() {
        try {
            String sql = "SELECT count(*)\n"
                    + "  FROM [dbo].[Refund]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public String getIDCustomer(String bid) {
        try {
            String sql = "select cid from Billed where bid =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, bid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public String getNameCustomer(String bid) {
        try {
            String sql = "select cname from Billed a\n"
                    + "inner join Customer b on a.cid = b.cid\n"
                    + "where bid =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, bid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertRefad(String bid, String rid) {
        try {
            String sql = "INSERT INTO[Refund]\n"
                    + "           ([rid]\n"
                    + "           ,[bid]\n"
                    + "           ,[date])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,getdate())";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, rid);
            stm.setString(2, bid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertInfoRefaud(String[] pid, String[] quantity, String[] price, String rid) {
        try {
            String sql = "INSERT INTO [InfRefund]\n"
                    + "           ([rid]\n"
                    + "           ,[pid]\n"
                    + "           ,[quantity]\n"
                    + "           ,[unitprice])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            for (int i = 0; i < pid.length; i++) {
                if (Integer.parseInt(quantity[i]) > 0) {
                    PreparedStatement stm = connection.prepareStatement(sql);
                    stm.setString(1, rid);
                    stm.setString(2, pid[i]);
                    stm.setInt(3, Integer.parseInt(quantity[i]));
                    stm.setFloat(4, Float.parseFloat(price[i]));
                    stm.executeUpdate();
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateInfoBilled(String bid) {
        try {
            String sql = "UPDATE [InfBilled]\n"
                    + "   SET [quantity] = a.quantity - b.quantity\n"
                    + " from InfBilled a inner join InfRefund b on a.pid = b.pid\n"
                    + " where a.bid =?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, bid);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateBilled(String bid) {
        try {
            String sql = "update Billed set total  = a.total - b.t, prepayment = a.total - b.t\n"
                    + "from Billed a inner join (select b.bid,sum(quantity*unitprice) as t from InfRefund a inner join Refund b \n"
                    + "							on a.rid = b.rid \n"
                    + "							group by b.bid) b on a.bid = b.bid where a.bid = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, bid);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Refaud getRefaudByID(String id) {
        try {
            String sql = "with x as(select a.bid,a.rid,a.date, b.cid  from Refund a inner join  Billed b on a.bid = b.bid ),\n"
                    + "y as(select sum(quantity*unitprice) as total, rid from InfRefund group by rid)\n"
                    + "select x.bid,x.date,x.rid, r.cname, y.total from x inner join y on x.rid = y.rid \n"
                    + "inner join Customer r on x.cid = r.cid where x.rid =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Refaud r = new Refaud();
                r.setBid(rs.getString("bid"));
                r.setCid(rs.getString("cname"));
                r.setRid(rs.getString("rid"));
                r.setTotal(rs.getFloat("total"));
                r.setDaterefaud(rs.getDate("date"));
                return r;
            }

        } catch (SQLException ex) {
            Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Detail> getDetailRefaud(String id) {
        ArrayList<Detail> detail = new ArrayList<>();
        try {
            String sql = "select a.pid, b.pname, a.quantity, a.unitprice from InfRefund a inner join Prod b on a.pid = b.pid\n"
                    + "where a.rid =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Detail d = new Detail();
                d.setPid(rs.getString("pid"));
                d.setPname(rs.getString("pname"));
                d.setQuantity(rs.getInt("quantity"));
                d.setUnitprice(rs.getFloat("unitprice"));
                detail.add(d);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detail;
    }

    public RefaudProduct getRefaudProductByID(String id) {
        try {
            String sql = "  select a.rpid, a.total, a.daterefaud, b.SName from RefaudProduct a inner join Supplier b  on a.sid = b.Sid  where a.rpid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                RefaudProduct r = new RefaudProduct();
                r.setRpid(rs.getString("rpid"));
                r.setSid(rs.getString("SName"));
                r.setTotal(rs.getFloat("total"));
                r.setDaterefaud(rs.getDate("daterefaud"));
                return r;
            }

        } catch (SQLException ex) {
            Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Detail> getDetailRefaudProduct(String id) {
        ArrayList<Detail> detail = new ArrayList<>();
        try {
            String sql = "  select a.code,c.pname, a.quantity, a.importprice from InfRefaudProduct a inner join InforProduct b on a.code = b.code inner join Prod c on b.pid = c.pid\n"
                    + "where a.rpid =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Detail d = new Detail();
                d.setPid(rs.getString("code"));
                d.setPname(rs.getString("pname"));
                d.setQuantity(rs.getInt("quantity"));
                d.setUnitprice(rs.getFloat("importprice"));
                detail.add(d);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detail;
    }

    public void insertRefaudProduct(String sid, String rpid, float pr) {
        try {
            String sql = "INSERT INTO [dbo].[RefaudProduct]\n"
                    + "           ([rpid]\n"
                    + "           ,[daterefaud]\n"
                    + "           ,[total]\n"
                    + "           ,[sid])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,getdate()\n"
                    + "           ,?\n"
                    + "           ,?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, rpid);
            stm.setString(3, sid);
            stm.setFloat(2, pr);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertInfoRefaudProduct(String[] id, String[] quantity, String[] price, String rpid) {
        try {
            String sql = "INSERT INTO [dbo].[InfRefaudProduct]\n"
                    + "           ([rpid]\n"
                    + "           ,[code]\n"
                    + "           ,[quantity]\n"
                    + "           ,[importprice])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            for (int i = 0; i < id.length; i++) {
                if (Integer.parseInt(quantity[i]) > 0) {
                    PreparedStatement stm = connection.prepareStatement(sql);
                    stm.setString(1, rpid);
                    stm.setString(2, id[i]);
                    stm.setInt(3, Integer.parseInt(quantity[i]));
                    stm.setFloat(4, Float.parseFloat(price[i]));
                    stm.executeUpdate();
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateInfoProduct(String[] id, String[] quantity) {
        try {
            String sql = "UPDATE [dbo].[InforProduct]\n"
                    + "   SET [quantityinstock] = quantityinstock -?\n"
                    + "      \n"
                    + " WHERE <Search Conditions,,>";

            PreparedStatement stm = connection.prepareStatement(sql);
            for (int i = 0; i < id.length; i++) {
                stm.setString(1,quantity[i]);
                stm.setString(2, id[i]);
                stm.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(RefaudDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
