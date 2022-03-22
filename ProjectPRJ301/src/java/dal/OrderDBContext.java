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
import model.Billed;

/**
 *
 * @author win
 */
public class OrderDBContext extends DBContext {

    public ArrayList<Billed> getOrder() {
        ArrayList<Billed> billed = new ArrayList<>();
        try {
            String sql = "select bid, cid, total, prepayment, debt, dateinvoice, date, note from Billed  where unit =0";
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
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return billed;
    }

    public ArrayList<Billed> getAllOrder() {
        ArrayList<Billed> billed = new ArrayList<>();
        try {
            String sql = "select bid, b.cname, total, prepayment, debt, dateinvoice, date, a.note from Billed a\n"
                    + "  inner join Customer b on a.cid = b.cid\n"
                    + "  where unit =0";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Billed b = new Billed();
                b.setBid(rs.getString("bid"));
                b.setCid(rs.getString("cname"));
                b.setTotal(rs.getFloat("total"));
                b.setPrepayment(rs.getFloat("prepayment"));
                b.setDebt(rs.getFloat("debt"));
                b.setDate(rs.getDate("date"));
                b.setDateinvoice(rs.getDate("dateinvoice"));
                b.setNote(rs.getString("note"));
                billed.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return billed;
    }

    public void deleteOrder(String id) {
        PreparedStatement stm = null;
        try {
            String sql = "DELETE FROM [dbo].[Billed]\n"
                    + "      WHERE bid=?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteInfOrder(String id) {
        PreparedStatement stm = null;
        try {
            String sql = "DELETE FROM [InfBilled]\n"
                    + "      WHERE bid =?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    public int getTotalOrder(String search) {
        try {
            String sql = "select count(*) from Billed  where unit =0";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Billed> getOrderByCustomerName(String search) {
        ArrayList<Billed> billed = new ArrayList<>();
        try {
            String sql = "select bid, b.cname, total, prepayment, debt, dateinvoice, date, a.note from Billed a\n"
                    + "  inner join Customer b on a.cid = b.cid\n"
                    + "  where unit =0 and b.cname=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, search);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Billed b = new Billed();
                b.setBid(rs.getString("bid"));
                b.setCid(rs.getString("cname"));
                b.setTotal(rs.getFloat("total"));
                b.setPrepayment(rs.getFloat("prepayment"));
                b.setDebt(rs.getFloat("debt"));
                b.setDate(rs.getDate("date"));
                b.setDateinvoice(rs.getDate("dateinvoice"));
                b.setNote(rs.getString("note"));
                billed.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return billed;
    }
}
