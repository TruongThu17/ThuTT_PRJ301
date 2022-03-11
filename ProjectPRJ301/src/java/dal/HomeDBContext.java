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
import model.Bill_Month_Day;
import model.Billed;

/**
 *
 * @author win
 */
public class HomeDBContext extends DBContext {

    public ArrayList<Bill_Month_Day> getBillOnMonth() {
        ArrayList<Bill_Month_Day> billed = new ArrayList<>();
        try {
            String sql = "select a.bid, b.cname, total, dateinvoice from Billed a\n"
                    + "inner join Customer b on a.cid = b.cid\n"
                    + "where MONTH(dateinvoice)=  MONTH(GETDATE())\n"
                    + "and YEAR(dateinvoice) = Year(GETDATE())\n"
                    + "group by a.bid, b.cname, total, dateinvoice ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Bill_Month_Day b = new Bill_Month_Day();
                b.setBid(rs.getString("bid"));
                b.setCname(rs.getString("cname"));
                b.setTotal(rs.getFloat("total"));
                b.setDate(rs.getDate("dateinvoice"));
                billed.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return billed;
    }

    public ArrayList<Bill_Month_Day> getBillOnDay() {
        ArrayList<Bill_Month_Day> billed = new ArrayList<>();
        try {
            String sql = "select a.bid, b.cname, total, dateinvoice from Billed a\n"
                    + "inner join Customer b on a.cid = b.cid\n"
                    + "where dateinvoice = CONVERT(date, GETDATE())\n"
                    + "	group by a.bid, b.cname, total, dateinvoice";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Bill_Month_Day b = new Bill_Month_Day();
                b.setBid(rs.getString("bid"));
                b.setCname(rs.getString("cname"));
                b.setTotal(rs.getFloat("total"));
                b.setDate(rs.getDate("dateinvoice"));
                billed.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return billed;
    }
}
