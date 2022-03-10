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
            String sql = "select a.bid, b.total, b.prepayment, b.debt,\n"
                    + "a.cid, a.dateinvoice\n"
                    + "from Bill a inner join InfBill b\n"
                    + "on a.bid = b.bid\n"
                    + "group by a.bid, b.total, b.prepayment, b.debt,\n"
                    + "a.cid,a.dateinvoice";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Billed b = new Billed();
                b.setBid(rs.getString("bid"));
                b.setCid(rs.getString("cid"));
                b.setTotal(rs.getFloat("total"));
                b.setPrepayment(rs.getFloat("prepayment"));
                b.setDebt(rs.getFloat("debt"));
                b.setDate(rs.getDate("dateinvoice"));
                billed.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return billed;
    }

    public float getTotalDay() {

        try {
            String sql = "select sum(total) as totalday from Bill where dateinvoice= CONVERT(date, GETDATE())";
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
            String sql = "select sum(total) as totalmonth from Bill where MONTH(dateinvoice)=  MONTH(GETDATE())\n"
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
