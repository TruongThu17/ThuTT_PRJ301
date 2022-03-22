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
import model.Customer;

/**
 *
 * @author win
 */
public class CustomerDBContext extends DBContext {

    public ArrayList<Customer> getCustomers() {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "select cid, cname, cphone, caddress, Note from Customer";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getString("cid"));
                c.setName(rs.getString("cname"));
                c.setPhone(rs.getString("cphone"));
                c.setAddress(rs.getString("caddress"));
                c.setNote(rs.getString("Note"));
                customers.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public ArrayList<Customer> getCustomerInOrder() {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "select a.cid, cname, cphone, caddress, a.Note from Customer a inner join Billed b\n"
                    + "on a.cid = b.cid where b.unit=0";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getString("cid"));
                c.setName(rs.getString("cname"));
                c.setPhone(rs.getString("cphone"));
                c.setAddress(rs.getString("caddress"));
                c.setNote(rs.getString("Note"));
                customers.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public Customer getCustomerbyId(String id) {

        try {
            String sql = "select cid, cname, cphone, caddress, Note from Customer where cid =?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getString("cid"));
                c.setName(rs.getString("cname"));
                c.setPhone(rs.getString("cphone"));
                c.setAddress(rs.getString("caddress"));
                c.setNote(rs.getString("Note"));
                return c;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Customer> getCustomerbyNameInOrder(String raw_txt) {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "select a.cid, cname, cphone, caddress, a.Note from Customer a inner join Billed b\n"
                    + "on a.cid = b.cid where b.unit=0 and cname like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + raw_txt + "%");
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getString("cid"));
                c.setName(rs.getString("cname"));
                c.setPhone(rs.getString("cphone"));
                c.setAddress(rs.getString("caddress"));
                c.setNote(rs.getString("Note"));
                customers.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public void insertCustomer(Customer c) {

        PreparedStatement stm = null;
        try {
            String sql = "INSERT INTO [dbo].[Customer]\n"
                    + "           ([cid]\n"
                    + "           ,[cname]\n"
                    + "           ,[cphone]\n"
                    + "           ,[caddress]\n"
                    + "           ,[Note])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";

            stm = connection.prepareStatement(sql);
            stm.setString(1, c.getId());
            stm.setString(2, c.getName());
            stm.setString(3, c.getPhone());
            stm.setString(4, c.getAddress());
            stm.setString(5, c.getNote());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
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

    public void updateCustomer(Customer c) {
        PreparedStatement stm = null;
        try {
            String sql = "UPDATE [dbo].[Customer]\n"
                    + "   SET[cname] = N?\n"
                    + "      ,[cphone] = ?\n"
                    + "      ,[caddress] = N?\n"
                    + "      ,[Note] = N?\n"
                    + " WHERE cid =?";

            stm = connection.prepareStatement(sql);
            stm.setString(5, c.getId());
            stm.setString(1, c.getName());
            stm.setString(2, c.getPhone());
            stm.setString(3, c.getAddress());
            stm.setString(4, c.getNote());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    public void deleteCustomer(String id) {

        PreparedStatement stm = null;
        try {
            String sql = "DELETE FROM [dbo].[Customer]\n"
                    + "      WHERE cid =?";

            stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
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

    public ArrayList<Customer> getCustomersByName(String raw_txt) {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "select cid, cname, cphone, caddress, Note from Customer where cname like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + raw_txt + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getString("cid"));
                c.setName(rs.getString("cname"));
                c.setPhone(rs.getString("cphone"));
                c.setAddress(rs.getString("caddress"));
                c.setNote(rs.getString("Note"));
                customers.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public ArrayList<Customer> getCustomerInOrder(int page, int page_sz) {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "select a.cid, cname, cphone, caddress, a.Note from Customer a inner join Billed b\n"
                    + "on a.cid = b.cid where b.unit=0 order by a.cid offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, page);
            stm.setInt(2, page_sz);
            stm.setInt(3, page_sz);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getString("cid"));
                c.setName(rs.getString("cname"));
                c.setPhone(rs.getString("cphone"));
                c.setAddress(rs.getString("caddress"));
                c.setNote(rs.getString("Note"));
                customers.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public ArrayList<Customer> getCustomerbyNameInOrder(String search, int page, int page_sz) {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "select a.cid, cname, cphone, caddress, a.Note from Customer a inner join Billed b\n"
                    + "on a.cid = b.cid where b.unit=0 and cname like ? order by a.cid offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            stm.setInt(2, page);
            stm.setInt(3, page_sz);
            stm.setInt(4, page_sz);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getString("cid"));
                c.setName(rs.getString("cname"));
                c.setPhone(rs.getString("cphone"));
                c.setAddress(rs.getString("caddress"));
                c.setNote(rs.getString("Note"));
                customers.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public int getTotalCustomer() {
        try {
            String sql = "select count(*) from Customer";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Customer> getCustomersByName(String raw_txt, int page, int page_sz) {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "select cid, cname, cphone, caddress, Note from Customer where cname like ?"
                    + " order by cid offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + raw_txt + "%");
            stm.setInt(2, page);
            stm.setInt(3, page_sz);
            stm.setInt(4, page_sz);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getString("cid"));
                c.setName(rs.getString("cname"));
                c.setPhone(rs.getString("cphone"));
                c.setAddress(rs.getString("caddress"));
                c.setNote(rs.getString("Note"));
                customers.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public ArrayList<Customer> getCustomers(int page, int page_sz) {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "select cid, cname, cphone, caddress, Note from Customer order by cid offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, page);
            stm.setInt(2, page_sz);
            stm.setInt(3, page_sz);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getString("cid"));
                c.setName(rs.getString("cname"));
                c.setPhone(rs.getString("cphone"));
                c.setAddress(rs.getString("caddress"));
                c.setNote(rs.getString("Note"));
                customers.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

}
