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
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
     public ArrayList<InforProduct> getInforProductByPidAndSid(String pid, String sid) {
        ArrayList<InforProduct> products = new ArrayList<>();
        try {
            String sql = "select * from InforProduct where pid =? and sid =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pid);
            stm.setString(2, sid);
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
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
                    + "           ,[dateimport]\n"
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
                    + "           ,getDate()\n"
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
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void setprices(ArrayList<SetPrice> prices) {
        PreparedStatement stm = null;

        try {
            for (SetPrice p : prices) {
                String sql = "UPDATE [InforProduct]\n"
                        + "   SET  [saleprice] = ?\n"
                        + "   where pid =?";
                stm = connection.prepareStatement(sql);
                stm.setFloat(1, Float.parseFloat(p.getPrice()));
                stm.setString(2, p.getId());
                stm.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

    }

    public ArrayList<Inventory> checkInventoryByName(String txt, int page, int page_sz) {
        ArrayList<Inventory> inventorys = new ArrayList<>();
        try {
            String sql = "select a.pid, a.pname,a.nsx, b.saleprice, sum(b.quantityinstock) as qt, b.status, b.unit, c.ptName  from Prod a inner join InforProduct b on a.pid = b.pid\n"
                    + "inner join ProductType c on a.ptid = c.ptId where b.status = 1 and a.pname like ?\n"
                    + "group by a.pid, a.pname, b.saleprice,a.nsx, b.status, b.unit, a.ptid, c.ptName\n"
                    + "order by a.pid"
                    + "offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, txt);
            stm.setInt(2, page);
            stm.setInt(3, page_sz);
            stm.setInt(4, page_sz);
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
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return inventorys;
    }

    public ArrayList<Inventory> checkInventoryByString(String raw_txt) {
        ArrayList<Inventory> inventorys = new ArrayList<>();
        try {
            String sql = "select a.pid, a.pname,a.nsx, b.saleprice, sum(b.quantityinstock) as qt, b.status, b.unit, c.ptName  from Prod a inner join InforProduct b on a.pid = b.pid\n"
                    + "inner join ProductType c on a.ptid = c.ptId where b.status = 1 and a.pname like ?\n"
                    + "group by a.pid, a.pname, b.saleprice,a.nsx, b.status, b.unit, a.ptid, c.ptName\n"
                    + "order by a.pid";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + raw_txt + "%");
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
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return inventorys;
    }

    public ArrayList<Inventory> checkInventoryByIDandName(String raw_did, String raw_txt) {
        ArrayList<Inventory> inventorys = new ArrayList<>();
        try {
            String sql = "select a.pid, a.pname,a.nsx, b.saleprice, sum(b.quantityinstock) as qt, b.status, b.unit, c.ptName  from Prod a inner join InforProduct b on a.pid = b.pid\n"
                    + "inner join ProductType c on a.ptid = c.ptId where b.status = 1 and a.pname like ? and c.ptid=?\n"
                    + "group by a.pid, a.pname, b.saleprice,a.nsx, b.status, b.unit, a.ptid, c.ptName\n"
                    + "order by a.pid";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + raw_txt + "%");
            stm.setString(2, raw_did);

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
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return inventorys;
    }

    public ArrayList<Inventory> checkInventoryByID(String raw_did) {
        ArrayList<Inventory> inventorys = new ArrayList<>();
        try {
            String sql = "select a.pid, a.pname,a.nsx, b.saleprice, sum(b.quantityinstock) as qt, b.status, b.unit, c.ptName  from Prod a inner join InforProduct b on a.pid = b.pid\n"
                    + "inner join ProductType c on a.ptid = c.ptId where b.status = 1 and c.ptid=?\n"
                    + "group by a.pid, a.pname, b.saleprice,a.nsx, b.status, b.unit, a.ptid, c.ptName\n"
                    + "order by a.pid";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, raw_did);

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
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return inventorys;
    }

    public ArrayList<InforProduct> getInforProductByPname(String raw_txt) {
        ArrayList<InforProduct> products = new ArrayList<>();
        try {
            String sql = "select * from InforProduct a inner join Prod b on a.pid = b.pid where b.pname like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + raw_txt + "%");
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
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<InforProduct> getInforProductByPTid(String raw_did) {
        ArrayList<InforProduct> products = new ArrayList<>();
        try {
            String sql = "select a.* from InforProduct a inner join Prod b on a.pid = b.pid where b.ptid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, raw_did);
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
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<InforProduct> getProductByPTidandName(String raw_txt, String raw_did) {
        ArrayList<InforProduct> products = new ArrayList<>();
        try {
            String sql = "select a.* from InforProduct a inner join Prod b on a.pid = b.pid where b.ptid = ? and b.pname like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, raw_did);
            stm.setString(2, "%" + raw_txt + "%");
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
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public int getTotalProducts(String raw_txt) {
        try {
            String sql = "";

            ResultSet rs;
            if (raw_txt != null) {
                sql += "with a as(select a.pid, a.pname,a.nsx, b.saleprice, sum(b.quantityinstock) as qt, b.status, b.unit, c.ptName \n"
                        + "from Prod a inner join InforProduct b on a.pid = b.pid\n"
                        + "inner join ProductType c on a.ptid = c.ptId where b.status = 1 and a.pname like ?\n"
                        + "group by a.pid, a.pname, b.saleprice,a.nsx, b.status, b.unit, a.ptid, c.ptName)\n"
                        + "\n"
                        + "select count(*) from a";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(1, "%" + raw_txt + "%");
                rs = stm.executeQuery();
            } else {
                sql += "with a as(select a.pid, a.pname,a.nsx, b.saleprice, sum(b.quantityinstock) as qt, b.status, b.unit, c.ptName \n"
                        + "from Prod a inner join InforProduct b on a.pid = b.pid\n"
                        + "inner join ProductType c on a.ptid = c.ptId where b.status = 1 \n"
                        + "group by a.pid, a.pname, b.saleprice,a.nsx, b.status, b.unit, a.ptid, c.ptName)\n"
                        + "\n"
                        + "select count(*) from a ";
                PreparedStatement stm = connection.prepareStatement(sql);
                rs = stm.executeQuery();
            }
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Inventory> checkInventoryByString(String raw_txt, int page, int page_sz) {
        ArrayList<Inventory> inventorys = new ArrayList<>();
        try {
            String sql = "select a.pid, a.pname,a.nsx, b.saleprice, sum(b.quantityimport) as qt, b.status, b.unit, c.ptName \n"
                    + "from Prod a inner join InforProduct b on a.pid = b.pid\n"
                    + "inner join ProductType c on a.ptid = c.ptId where b.status = 1 and a.pname like ?\n"
                    + "group by a.pid, a.pname, b.saleprice,a.nsx, b.status, b.unit, a.ptid, c.ptName\n"
                    + "order by a.pid\n"
                    + "offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + raw_txt + "%");
            stm.setInt(2, page);
            stm.setInt(3, page_sz);
            stm.setInt(4, page_sz);
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
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return inventorys;
    }

    public ArrayList<Inventory> checkInventory(int page, int page_sz) {
        ArrayList<Inventory> inventorys = new ArrayList<>();
        try {
            String sql = "select a.pid, a.pname,a.nsx, b.saleprice, sum(b.quantityinstock) as qt, b.status, b.unit, c.ptName  from Prod a inner join InforProduct b on a.pid = b.pid\n"
                    + "inner join ProductType c on a.ptid = c.ptId where b.status = 1\n"
                    + "group by a.pid, a.pname, b.saleprice,a.nsx, b.status, b.unit, a.ptid, c.ptName\n"
                    + "order by a.pid "
                    + "offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, page);
            stm.setInt(2, page_sz);
            stm.setInt(3, page_sz);
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
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return inventorys;
    }
    public ArrayList<Inventory> checkInventori(int page, int page_sz) {
        ArrayList<Inventory> inventorys = new ArrayList<>();
        try {
            String sql = "select a.pid, a.pname,a.nsx, b.saleprice, sum(b.quantityimport) as qt, b.status, b.unit, c.ptName  from Prod a inner join InforProduct b on a.pid = b.pid\n"
                    + "inner join ProductType c on a.ptid = c.ptId where b.status = 1\n"
                    + "group by a.pid, a.pname, b.saleprice,a.nsx, b.status, b.unit, a.ptid, c.ptName\n"
                    + "order by a.pid "
                    + "offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, page);
            stm.setInt(2, page_sz);
            stm.setInt(3, page_sz);
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
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return inventorys;
    }

    public ArrayList<InforProduct> getInforProduct(int page, int page_sz) {
        ArrayList<InforProduct> products = new ArrayList<>();
        try {
            String sql = "select * from InforProduct order by code offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, page);
            stm.setInt(2, page_sz);
            stm.setInt(3, page_sz);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                InforProduct p = new InforProduct();
                p.setId(rs.getString("code"));
                p.setPid(rs.getString("pid"));
                p.setImportprice(rs.getFloat("importprice"));
                p.setSaleprice(rs.getFloat("saleprice"));
                p.setDateexp(rs.getDate("dateexpiry"));
                p.setDateimport(rs.getDate("dateimport"));
                p.setQuantity(rs.getInt("quantityimport"));
                p.setUnit(rs.getString("unit"));
                p.setStatus(rs.getBoolean("status"));
                p.setSid(rs.getString("sid"));
                p.setNote(rs.getString("Note"));
                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<InforProduct> getInforProductByPname(String raw_txt, int page, int page_sz) {
       ArrayList<InforProduct> products = new ArrayList<>();
        try {
            String sql = "select * from InforProduct a inner join Prod b on a.pid = b.pid where b.pname like ? order by code offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + raw_txt + "%");
            stm.setInt(2, page);
            stm.setInt(3, page_sz);
            stm.setInt(4, page_sz);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                InforProduct p = new InforProduct();
                p.setId(rs.getString("code"));
                p.setPid(rs.getString("pid"));
                p.setImportprice(rs.getFloat("importprice"));
                p.setSaleprice(rs.getFloat("saleprice"));
                p.setDateexp(rs.getDate("dateexpiry"));
                p.setDateimport(rs.getDate("dateimport"));
                p.setQuantity(rs.getInt("quantityimport"));
                p.setUnit(rs.getString("unit"));
                p.setStatus(rs.getBoolean("status"));
                p.setSid(rs.getString("sid"));
                p.setNote(rs.getString("Note"));
                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<InforProduct> getInforProductByPTid(String raw_did, int page, int page_sz) {
        ArrayList<InforProduct> products = new ArrayList<>();
        try {
            String sql = "select a.* from InforProduct a inner join Prod b on a.pid = b.pid where b.ptid = ? order by code offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, raw_did);
            stm.setInt(2, page);
            stm.setInt(3, page_sz);
            stm.setInt(4, page_sz);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                InforProduct p = new InforProduct();
                p.setId(rs.getString("code"));
                p.setPid(rs.getString("pid"));
                p.setImportprice(rs.getFloat("importprice"));
                p.setSaleprice(rs.getFloat("saleprice"));
                p.setDateexp(rs.getDate("dateexpiry"));
                p.setDateimport(rs.getDate("dateimport"));
                p.setQuantity(rs.getInt("quantityimport"));
                p.setUnit(rs.getString("unit"));
                p.setStatus(rs.getBoolean("status"));
                p.setSid(rs.getString("sid"));
                p.setNote(rs.getString("Note"));
                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<InforProduct> getProductByPTidandName(String raw_txt, String raw_did, int page, int page_sz) {
       ArrayList<InforProduct> products = new ArrayList<>();
        try {
            String sql = "select a.* from InforProduct a inner join Prod b on a.pid = b.pid where b.ptid = ? and b.pname like ?"
                    + " order by code offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, raw_did);
            stm.setString(2, "%" + raw_txt + "%");
            stm.setInt(3, page);
            stm.setInt(4, page_sz);
            stm.setInt(5, page_sz);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                InforProduct p = new InforProduct();
                p.setId(rs.getString("code"));
                p.setPid(rs.getString("pid"));
                p.setImportprice(rs.getFloat("importprice"));
                p.setSaleprice(rs.getFloat("saleprice"));
                p.setDateexp(rs.getDate("dateexpiry"));
                p.setDateimport(rs.getDate("dateimport"));
                p.setQuantity(rs.getInt("quantityimport"));
                p.setUnit(rs.getString("unit"));
                p.setStatus(rs.getBoolean("status"));
                p.setSid(rs.getString("sid"));
                p.setNote(rs.getString("Note"));
                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(InforProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }


}
