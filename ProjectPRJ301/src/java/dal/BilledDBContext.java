/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import controller.transaction.DetailOrder;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Billed;
import model.Detail;
import model.InfoBilled;

/**
 *
 * @author win
 */
public class BilledDBContext extends DBContext {

    public ArrayList<Billed> getAllBilled() {
        ArrayList<Billed> billed = new ArrayList<>();
        try {
            String sql = "select bid, cid, total, prepayment, debt, dateinvoice, date, note from Billed where unit = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Billed b = new Billed();
                b.setBid(rs.getString("bid"));
                b.setCid(rs.getString("cid"));
                b.setTotal(rs.getFloat("total"));
                b.setPrepayment(rs.getFloat("prepayment"));
                b.setDebt(rs.getFloat("debt"));
                b.setDate(rs.getDate("date"));
                b.setDateinvoice(rs.getDate("dateinvoice"));
                b.setNote(rs.getString("note"));
                billed.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return billed;
    }

    public ArrayList<InfoBilled> getAllProductInBilled(String bid) {
        ArrayList<InfoBilled> billed = new ArrayList<>();
        try {
            String sql = "select a.bid, a.pid,b.pname,a.quantity,a.unitprice from InfBilled a  inner join Prod b on a.pid = b.pid\n"
                    + "\n"
                    + "where a.bid =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, bid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                InfoBilled b = new InfoBilled();
                b.setBid(rs.getString("bid"));
                b.setPid(rs.getString("pid"));
                b.setPname(rs.getString("pname"));
                b.setPrice(rs.getFloat("unitprice"));
                b.setQuantity(rs.getInt("quantity"));
                billed.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return billed;
    }

    public ArrayList<Billed> getBilled() {
        ArrayList<Billed> billed = new ArrayList<>();
        try {
            String sql = "select bid, cid, total, prepayment, debt, dateinvoice, date, note from Billed  where unit =1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Billed b = new Billed();
                b.setBid(rs.getString("bid"));
                b.setCid(rs.getString("cid"));
                b.setTotal(rs.getFloat("total"));
                b.setPrepayment(rs.getFloat("prepayment"));
                b.setDebt(rs.getFloat("debt"));
                b.setDate(rs.getDate("date"));
                b.setDateinvoice(rs.getDate("dateinvoice"));
                b.setNote(rs.getString("note"));
                billed.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return billed;
    }

    public int getTotalBilled() {
        try {
            String sql = "select count(*) from Billed";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public float getTotalDay() {

        try {
            String sql = "select sum(total)as totalday from Billed  where dateinvoice= CONVERT(date, GETDATE())";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getFloat("totalday");
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public float getTotalMonth() {

        try {
            String sql = "select sum(total) as totalmonth from Billed where MONTH(dateinvoice)=  MONTH(GETDATE())\n"
                    + "and YEAR(dateinvoice) = Year(GETDATE())";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getFloat("totalmonth");
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int getTotalBillMonth() {
        try {
            String sql = "select count(*) from Billed a\n"
                    + "inner join Customer b on a.cid = b.cid\n"
                    + "where MONTH(dateinvoice)=  MONTH(GETDATE())\n"
                    + "and YEAR(dateinvoice) = Year(GETDATE()) ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int getTotalBillDay() {
        try {
            String sql = "select count(*) from Billed a\n"
                    + "inner join Customer b on a.cid = b.cid\n"
                    + "where dateinvoice = CONVERT(date, GETDATE())";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void insertBilled(String bid, String totalamount, String total, String discount, String payment, Date date, String cid) {
        try {
            String sql = "INSERT INTO [dbo].[Billed]\n"
                    + "           ([bid]\n"
                    + "           ,[cid]\n"
                    + "           ,[total]\n"
                    + "           ,[prepayment]\n"
                    + "           ,[debt]\n"
                    + "           ,[dateinvoice]\n"
                    + "           ,[unit]\n"
                    + "           ,[date]\n"
                    + "           ,[discount]\n"
                    + "           ,[note])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,getdate()\n"
                    + "           ,0\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,'')";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, bid);
            stm.setString(2, cid);
            stm.setFloat(3, Float.parseFloat(totalamount));
            stm.setFloat(4, Float.parseFloat(payment));
            stm.setFloat(5, Float.parseFloat(total));
            stm.setDate(6, date);
            stm.setFloat(7, Float.parseFloat(discount));
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertInfBilled(String bid, String[] pid, String[] quantity, String[] price) {
        String sql = "INSERT INTO [dbo].[InfBilled]\n"
                + "           ([bid]\n"
                + "           ,[pid]\n"
                + "           ,[quantity]\n"
                + "           ,[unitprice])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        for (int i = 0; i < pid.length; i++) {
            try {
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(2, pid[i]);
                stm.setString(1, bid);
                stm.setInt(3, Integer.parseInt(quantity[i]));
                stm.setFloat(4, Float.parseFloat(price[i]));
                stm.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(BilledDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public Billed getBilledById(String id) {
        try {
            String sql = "select bid, b.cname, total, prepayment, debt, dateinvoice, date, a.note from Billed a\n"
                    + "inner join Customer b on a.cid = b.cid where bid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Billed b = new Billed();
                b.setBid(rs.getString("bid"));
                b.setCid(rs.getString("cname"));
                b.setTotal(rs.getFloat("total"));
                b.setPrepayment(rs.getFloat("prepayment"));
                b.setDebt(rs.getFloat("debt"));
                b.setDate(rs.getDate("date"));
                b.setDateinvoice(rs.getDate("dateinvoice"));
                b.setNote(rs.getString("note"));
                return b;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Detail> getDetailOrder(String id) {
        ArrayList<Detail> detail = new ArrayList<>();
        try {
            String sql = "select a.pid, b.pname, a.quantity, a.unitprice from InfBilled a inner join Prod b\n"
                    + "on a.pid = b.pid\n"
                    + "where bid = ?";
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

}
