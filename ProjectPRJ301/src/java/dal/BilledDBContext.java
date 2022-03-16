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
import model.Customer;

/**
 *
 * @author win
 */
public class BilledDBContext extends DBContext {

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

}
