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
import model.Refaud;

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
}
