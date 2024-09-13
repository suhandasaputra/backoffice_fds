/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mdw.db;

import com.mdw.model.Model_200;
import com.mdw.model.Model_400;
import com.mdw.model.Model_800;
import com.mdw.model.Model_Bank;
import com.mdw.model.Model_Conn;
import com.mdw.model.Model_Iso;
import com.mdw.model.Model_Product;
import com.mdw.model.Model_Report;
import com.mdw.model.Model_User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;

public class DatabaseProcess {

    private void clearStatment(PreparedStatement stat) {
        if (stat != null) {
            try {
                stat.clearBatch();
                stat.clearParameters();
                stat.close();
                stat = null;
            } catch (SQLException ex) {
            }
        }
    }

    private void clearDBConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
                conn = null;
            } catch (SQLException ex) {
            }
        }
    }

    private void clearResultset(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
                rs = null;
            } catch (SQLException ex) {
            }
        }
    }

    private void clearAllConnStatRS(Connection conn, PreparedStatement stat, ResultSet rs) {
        clearResultset(rs);
        clearStatment(stat);
        clearDBConnection(conn);
    }

    //proses login
    public HashMap validate(String user, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        HashMap result = new HashMap();
        String present = "0";
        String pass = "0";

        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("select * from fds_user where user_id=?");
            stat.setString(1, user);
            rs = stat.executeQuery();
            while (rs.next()) {
                present = "1";
                result.put("user_status", rs.getString("user_status"));
                result.put("status_login", rs.getString("status_login"));
                stat = conn.prepareStatement("select * from fds_user where user_id=? and password=?");
                stat.setString(1, user);
                stat.setString(2, password);
                rs = stat.executeQuery();
                while (rs.next()) {
                    pass = "1";
                }
                result.put("pass", pass);
            }
            result.put("present", present);

        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return result;
    }

//    public ArrayList<Model_Product> getAllProduct() throws ParseException {
//        Connection conn = null;
//        PreparedStatement stat = null;
//        ResultSet rs = null;
//        ArrayList<Model_Product> listProduct = new ArrayList<>();
//        try {
//            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
//            stat = conn.prepareStatement("Select * from trancode");
//            rs = stat.executeQuery();
//            while (rs.next()) {
//                Model_Product reportyabes = new Model_Product();
//                reportyabes.setTrancodeid(rs.getString("trancodeid"));
//                reportyabes.setBankcode(rs.getString("bankcode"));
//                reportyabes.setTrancodename(rs.getString("trancodename"));
//                reportyabes.setTcbiller(rs.getString("tcbiller"));
//                reportyabes.setFeebeli(rs.getString("feebeli"));
//                reportyabes.setFeejual(rs.getString("feejual"));
//                reportyabes.setFeebpd(rs.getString("feebpd"));
//                reportyabes.setFeebank(rs.getString("feebank"));
//                reportyabes.setFeeskema(rs.getString("feeskema"));
//                listProduct.add(reportyabes);
//            }
//        } catch (SQLException e) {
//        } finally {
//            clearAllConnStatRS(conn, stat, rs);
//        }
//        return listProduct;
//    }
//    public String addProduct(Model_Product pro) {
//        Connection conn = null;
//        PreparedStatement stat = null;
//        ResultSet rs = null;
//        String status;
//        try {
//            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
//            boolean status1 = false;
//            stat = conn.prepareStatement("select * from trancode where trancodeid=?");
//            stat.setString(1, pro.getTrancodeid());
//            rs = stat.executeQuery();
//            status1 = rs.next();
//            if (status1 == true) {
//                return status = "01";
//            } else {
//                stat = conn.prepareStatement("INSERT INTO trancode(trancodeid, bankcode, trancodename, tcbiller, feebeli, feejual, feebpd, feebank, feeskema) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
//                stat.setString(1, pro.getTrancodeid());
//                stat.setString(2, pro.getBankcode());
//                stat.setString(3, pro.getTrancodename());
//                stat.setString(4, pro.getTcbiller());
//                stat.setInt(5, Integer.valueOf(pro.getFeebeli()));
//                stat.setInt(6, Integer.valueOf(pro.getFeejual()));
//                stat.setInt(7, Integer.valueOf(pro.getFeebpd()));
//                stat.setInt(8, Integer.valueOf(pro.getFeebank()));
//                stat.setString(9, pro.getFeeskema());
//                stat.executeUpdate();
//            }
//        } catch (SQLException e) {
//            return status = e.getMessage();
//        } finally {
//            clearAllConnStatRS(conn, stat, rs);
//        }
//        return status = "00";
//    }
//    public Model_Product getproductDetail(String trancodeid) {
//        Connection conn = null;
//        PreparedStatement stat = null;
//        ResultSet rs = null;
//        Model_Product mp = new Model_Product();
//        try {
//            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
//            stat = conn.prepareStatement("select * from trancode where trancodeid=?");
//            stat.setString(1, trancodeid);
//            rs = stat.executeQuery();
//            if (rs.next()) {
//                mp.setTrancodeid(rs.getString("trancodeid"));
//                mp.setBankcode(rs.getString("bankcode"));
//                mp.setTrancodename(rs.getString("trancodename"));
//                mp.setTcbiller(rs.getString("tcbiller"));
//                mp.setFeebeli(rs.getString("feebeli"));
//                mp.setFeejual(rs.getString("feejual"));
//                mp.setFeebpd(rs.getString("feebpd"));
//                mp.setFeebank(rs.getString("feebank"));
//                mp.setFeeskema(rs.getString("feeskema"));
//            }
//        } catch (SQLException e) {
//        } finally {
//            clearAllConnStatRS(conn, stat, rs);
//        }
//        return mp;
//    }
//    public String deleteproduct(String trancodeid) {
//        Connection conn = null;
//        PreparedStatement stat = null;
//        ResultSet rs = null;
//        String status = "01";
//        try {
//            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
//            stat = conn.prepareStatement("delete from trancode where trancodeid=?");
//            stat.setString(1, trancodeid);
//            stat.executeUpdate();
//            status = "00";
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return status;
//        } finally {
//            clearAllConnStatRS(conn, stat, rs);
//        }
//        return status;
//    }
//    public String updateProduk(String trancodeid, String bankcode, String trancodename, String tcbiller, String feebeli, String feejual, String feebpd, String feebank, String feeskema) {
//        Connection conn = null;
//        PreparedStatement stat = null;
//        ResultSet rs = null;
//        String status = "01";
//        try {
//            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
//            stat = conn.prepareStatement("UPDATE trancode SET bankcode=?, trancodename=?, tcbiller=?, feebeli=?, feejual=?, feebpd=?, feebank=?, feeskema=? WHERE trancodeid=?");
//            stat.setString(1, bankcode);
//            stat.setString(2, trancodename);
//            stat.setString(3, tcbiller);
//            stat.setInt(4, Integer.valueOf(feebeli));
//            stat.setInt(5, Integer.valueOf(feejual));
//            stat.setInt(6, Integer.valueOf(feebpd));
//            stat.setInt(7, Integer.valueOf(feebank));
//            stat.setString(8, feeskema);
//            stat.setString(9, trancodeid);
//            stat.executeUpdate();
//            status = "00";
//            stat.clearParameters();
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return status = e.getMessage();
//        } finally {
//            clearAllConnStatRS(conn, stat, rs);
//        }
//        return status;
//    }
    public ArrayList<Model_Report> getAllTrx() throws ParseException {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Model_Report> listTrx = new ArrayList<>();
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("select * from (\n"
                    + "select requesttime,responsetime,noref,cardno,bankcode,fromaccount,toaccount,amount,proccode,transactionid,productcode,rcinternal,custno,mti,terminalid,merchanttype,responsecode from tempmsg \n"
                    + "union all \n"
                    + "select requesttime,responsetime,noref,cardno,bankcode,fromaccount,toaccount,amount,proccode,transactionid,productcode,rcinternal,custno,mti,terminalid,merchanttype,responsecode from tempmsg_backup order by requesttime desc\n"
                    + ") AS tempmsg");
            rs = stat.executeQuery();
            while (rs.next()) {
                Model_Report reportyabes = new Model_Report();
                reportyabes.setRequesttime(rs.getString("requesttime"));
                reportyabes.setMti(rs.getString("mti"));
                reportyabes.setNoref(rs.getString("noref"));
                reportyabes.setCardno(rs.getString("cardno"));
                reportyabes.setBankcode(rs.getString("bankcode"));
                reportyabes.setFromaccount(rs.getString("fromaccount"));
                reportyabes.setToaccount(rs.getString("toaccount"));
                reportyabes.setAmount(rs.getString("amount"));
                reportyabes.setProccode(rs.getString("proccode"));
                reportyabes.setProductcode(rs.getString("productcode"));
                reportyabes.setResponsecode(rs.getString("responsecode"));
                listTrx.add(reportyabes);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return listTrx;
    }

//    public ArrayList<Model_Bank> getAllBank() throws ParseException {
//        Connection conn = null;
//        PreparedStatement stat = null;
//        ResultSet rs = null;
//        ArrayList<Model_Bank> listBank = new ArrayList<>();
//        try {
//            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
//            stat = conn.prepareStatement("Select * from listbank");
//            rs = stat.executeQuery();
//            while (rs.next()) {
//                Model_Bank mb = new Model_Bank();
//                mb.setBankcode(rs.getString("bankcode"));
//                mb.setBankname(rs.getString("bankname"));
//                listBank.add(mb);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            clearAllConnStatRS(conn, stat, rs);
//        }
//        return listBank;
//    }
//    public String addBank(Model_Bank pro) {
//        Connection conn = null;
//        PreparedStatement stat = null;
//        ResultSet rs = null;
//        String status;
//        try {
//            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
//            boolean status1 = false;
//            stat = conn.prepareStatement("select * from listbank where bankcode=?");
//            stat.setString(1, pro.getBankcode());
//            rs = stat.executeQuery();
//            status1 = rs.next();
//            if (status1 == true) {
//                return status = "01";
//            } else {
//                stat = conn.prepareStatement("INSERT INTO listbank(bankcode, bankname) VALUES (?, ?)");
//                stat.setString(1, pro.getBankcode());
//                stat.setString(2, pro.getBankname());
//                stat.executeUpdate();
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return status = e.getMessage();
//        } finally {
//            clearAllConnStatRS(conn, stat, rs);
//        }
//        return status = "00";
//    }
//    public String deletebank(String bankcode) {
//        Connection conn = null;
//        PreparedStatement stat = null;
//        ResultSet rs = null;
//        String status = "01";
//        try {
//            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
//            stat = conn.prepareStatement("delete from listbank where bankcode=?");
//            stat.setString(1, bankcode);
//            stat.executeUpdate();
//            status = "00";
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return status;
//        } finally {
//            clearAllConnStatRS(conn, stat, rs);
//        }
//        return status;
//    }
//    public String updateBank(String bankcode, String bankname) {
//        Connection conn = null;
//        PreparedStatement stat = null;
//        ResultSet rs = null;
//        String status = "01";
//        try {
//            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
//            stat = conn.prepareStatement("UPDATE listbank SET bankname=? WHERE bankcode=?");
//            stat.setString(1, bankname);
//            stat.setString(2, bankcode);
//            stat.executeUpdate();
//            status = "00";
//            stat.clearParameters();
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return status = e.getMessage();
//        } finally {
//            clearAllConnStatRS(conn, stat, rs);
//        }
//        return status;
//    }
    public ArrayList<Model_User> getAllUser() throws ParseException {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Model_User> listUser = new ArrayList<>();
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("select * from fds_user");
            rs = stat.executeQuery();
            while (rs.next()) {
                Model_User mu = new Model_User();
                mu.setUser_id(rs.getString("user_id"));
                mu.setUser_name(rs.getString("user_name"));
//                mu.setBankcode(rs.getString("bankcode"));
//                mu.setStatususer(rs.getString("statususer"));
                listUser.add(mu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return listUser;
    }

    public String addUser(Model_User pro) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status;
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            boolean status1 = false;
            stat = conn.prepareStatement("select * from loginpanel where bankcode=?");
            stat.setString(1, pro.getBankcode());
            rs = stat.executeQuery();
            status1 = rs.next();
            if (status1 == true) {
                return status = "01";
            } else {
                stat = conn.prepareStatement("INSERT INTO loginpanel(username, password, bankcode, statususer) VALUES (?, ?, ?, ?)");
//                stat.setString(1, pro.getUsername());
                stat.setString(2, pro.getPassword());
                stat.setString(3, pro.getBankcode());
                stat.setString(4, pro.getStatususer());
                stat.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return status = e.getMessage();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status = "00";
    }

    public String deleteuser(String bankcode) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status = "01";
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("delete from loginpanel where bankcode=?");
            stat.setString(1, bankcode);
            stat.executeUpdate();
            status = "00";
        } catch (SQLException e) {
            e.printStackTrace();
            return status;
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status;
    }

    public String updateUser(String bankcode, String username, String statususer) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status = "01";
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("UPDATE loginpanel SET username=?, statususer=? WHERE bankcode=?");
            stat.setString(1, username);
            stat.setString(2, statususer);
            stat.setString(3, bankcode);
            stat.executeUpdate();
            status = "00";
            stat.clearParameters();
        } catch (SQLException e) {
            e.printStackTrace();
            return status = e.getMessage();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status;
    }

    public ArrayList<Model_Conn> getAllConn() throws ParseException {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Model_Conn> listConn = new ArrayList<>();
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("Select * from socketconn");
            rs = stat.executeQuery();
            while (rs.next()) {
                Model_Conn mu = new Model_Conn();
                mu.setSeq(rs.getString("seq"));
                mu.setTodirect(rs.getString("todirect"));
                mu.setHost(rs.getString("host"));
                mu.setStatusopen(rs.getString("statusopen"));
                mu.setStatusstart(rs.getString("statusstart"));
                mu.setPort(rs.getString("port"));
                mu.setStatusconnect(rs.getString("statusconnect"));
                mu.setHeadertype(rs.getString("headertype"));
                mu.setBankcode(rs.getString("bankcode"));
                mu.setLengthincl(rs.getString("lengthincl"));
                mu.setTypeapp(rs.getString("typeapp"));
                mu.setConname(rs.getString("conname"));
                mu.setPackagename(rs.getString("packagename"));
                mu.setAutosignon(rs.getString("autosignon"));
                mu.setNeedsignon(rs.getString("needsignon"));
                mu.setPackagerpath(rs.getString("packagerpath"));
                mu.setLoadbalancing(rs.getString("loadbalancing"));
                mu.setLbgroup(rs.getString("lbgroup"));
                listConn.add(mu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return listConn;
    }

    public String addConn(Model_Conn pro) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        PreparedStatement stat1 = null;
        ResultSet rs1 = null;
        String status;
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("select max(seq) as seq from socketconn");
            rs = stat.executeQuery();
            while (rs.next()) {
                stat = conn.prepareStatement("INSERT INTO socketconn (todirect, host, statusopen, port, headertype, bankcode, lengthincl, typeapp, conname, packagename, autosignon, needsignon, packagerpath, loadbalancing, lbgroup, seq) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                stat.setString(1, pro.getTodirect());
                stat.setString(2, pro.getHost());
                //statusopen jika sbg server = true, jika sbg client = false
                if (pro.getStatusopen().equals("1")) {
                    stat.setBoolean(3, true);
                } else if (pro.getStatusopen().equals("0")) {
                    stat.setBoolean(3, false);
                }
                stat.setInt(4, Integer.valueOf(pro.getPort()));
                //  headertype
                //	1 : 4 length byte
                //	2 : STX/ETX
                //	3 : 2 hexa byte hi-low
                //	4 : 2 hexa byte low-hi
                stat.setInt(5, Integer.valueOf(pro.getHeadertype()));
                stat.setString(6, pro.getBankcode());
                //length include = true and false
                if (pro.getLengthincl().equals("1")) {
                    stat.setBoolean(7, true);
                } else if (pro.getStatusopen().equals("0")) {
                    stat.setBoolean(7, false);
                }
                //typeapp = C as client, S as server
                stat.setString(8, pro.getTypeapp());
                stat.setString(9, pro.getConname());
                //packagename = iso,json,xml
                stat.setString(10, pro.getPackagename());
                //autosignon = false untuk web, true untuk iso
                if (pro.getAutosignon().equals("1")) {
                    stat.setBoolean(11, true);
                } else if (pro.getStatusopen().equals("0")) {
                    stat.setBoolean(11, false);
                }
                //needsignon = false jika tidak butuhsignon, true jika butuh signon
                if (pro.getNeedsignon().equals("1")) {
                    stat.setBoolean(12, true);
                } else if (pro.getStatusopen().equals("0")) {
                    stat.setBoolean(12, false);
                }
                //typeconn = web/socket
                stat.setString(13, pro.getPackagerpath());
                if (pro.getLoadbalancing().equals("1")) {
                    stat.setBoolean(14, true);
                } else if (pro.getStatusopen().equals("0")) {
                    stat.setBoolean(14, false);
                }
                stat.setString(15, pro.getLbgroup());
                if (rs.getString("seq") == null) {
                    stat.setInt(16, 1);
                } else {
                    int gg = Integer.valueOf(rs.getString("seq"));
                    stat.setInt(16, gg + 1);
                }
                stat.executeUpdate();
                stat.clearParameters();
                stat.clearBatch();

                stat = conn.prepareStatement("CREATE TABLE public.opt_iso_table_" + pro.getBankcode() + "\n"
                        + "(\n"
                        + "    field numeric(3,0) NOT NULL,\n"
                        + "    name_of_field character varying(100) COLLATE pg_catalog.\"default\",\n"
                        + "    format character varying(15) COLLATE pg_catalog.\"default\",\n"
                        //                        + "    \"char\" character varying(5) COLLATE pg_catalog.\"default\",\n"
                        + "    length numeric(3,0),\n"
                        + "    CONSTRAINT opt_iso_table_" + pro.getBankcode() + "_pkey PRIMARY KEY (field)\n"
                        + ");\n"
                        + "\n"
                        + "CREATE TABLE public.opt_200_" + pro.getBankcode() + "\n"
                        + "(\n"
                        + "    field numeric(3,0) NOT NULL,\n"
                        + "    name_of_field character varying(100) COLLATE pg_catalog.\"default\",\n"
                        + "    \"200\" character varying(2) COLLATE pg_catalog.\"default\",\n"
                        + "    \"210\" character varying(2) COLLATE pg_catalog.\"default\",\n"
                        + "    CONSTRAINT opt_200_" + pro.getBankcode() + "_pkey PRIMARY KEY (field)\n"
                        + ");\n"
                        + "\n"
                        + "CREATE TABLE public.opt_400_" + pro.getBankcode() + "\n"
                        + "(\n"
                        + "    field numeric(3,0) NOT NULL,\n"
                        + "    name_of_field character varying(100) COLLATE pg_catalog.\"default\",\n"
                        + "    \"400\" character varying(2) COLLATE pg_catalog.\"default\",\n"
                        + "    \"410\" character varying(2) COLLATE pg_catalog.\"default\",\n"
                        + "    CONSTRAINT opt_400_" + pro.getBankcode() + "_pkey PRIMARY KEY (field)\n"
                        + ");\n"
                        + "\n"
                        + "CREATE TABLE public.opt_800_" + pro.getBankcode() + "\n"
                        + "(\n"
                        + "    name_of_field character varying(100) COLLATE pg_catalog.\"default\",\n"
                        + "    field numeric(3,0) NOT NULL,\n"
                        + "    \"800\" character varying(2) COLLATE pg_catalog.\"default\",\n"
                        + "    \"810\" character varying(2) COLLATE pg_catalog.\"default\",\n"
                        + "    CONSTRAINT opt_800_" + pro.getBankcode() + "_pkey PRIMARY KEY (field)\n"
                        + ")");
                stat.executeUpdate();
                stat.clearParameters();
                stat.clearBatch();

            }
        } catch (SQLException e) {
            e.printStackTrace();
            return status = e.getMessage();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status = "00";
    }

    public String deleteconn(String seq, String todir, String bankcode) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status = "01";
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("delete from socketconn where todirect=? and seq=?");
            stat.setString(1, todir);
            stat.setInt(2, Integer.valueOf(seq));
            stat.executeUpdate();
            stat.clearParameters();
            stat.clearBatch();
            stat = conn.prepareStatement("DROP TABLE opt_iso_table_" + bankcode + ", opt_200_" + bankcode + ", opt_400_" + bankcode + ", opt_800_" + bankcode + "");
            stat.executeUpdate();
            status = "00";
        } catch (SQLException e) {
            e.printStackTrace();
            return status;
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status;
    }

    public String updateConn(String seq, String todirect, String host, String port, String statusopen,
            String headertype, String bankcode, String lengthincl, String typeapp, String conname, String packagename,
            String autosignon, String needsignon, String packagerpath, String loadbalancing, String lbgroup) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status = "01";
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("UPDATE socketconn SET host=?, port=?, statusopen=?, headertype=?, bankcode=?, lengthincl=?, typeapp=?, conname=?, packagename=?, "
                    + "autosignon=?, needsignon=?, packagerpath=?, loadbalancing=?, lbgroup=? WHERE seq=? and todirect=?");
            stat.setString(1, host);
            stat.setInt(2, Integer.valueOf(port));
//            stat.setString(3, statusopen);
            if (statusopen.equals("1")) {
                stat.setBoolean(3, true);
            } else if (statusopen.equals("0")) {
                stat.setBoolean(3, false);
            }
            stat.setInt(4, Integer.valueOf(headertype));
            stat.setString(5, bankcode);
//            stat.setString(6, lengthincl);
            if (lengthincl.equals("1")) {
                stat.setBoolean(6, true);
            } else if (lengthincl.equals("0")) {
                stat.setBoolean(6, false);
            }
            stat.setString(7, typeapp);
            stat.setString(8, conname);
            stat.setString(9, packagename);
//            stat.setString(10, autosignon);
            if (autosignon.equals("1")) {
                stat.setBoolean(10, true);
            } else if (autosignon.equals("0")) {
                stat.setBoolean(10, false);
            }
//            stat.setString(11, needsignon);
            if (needsignon.equals("1")) {
                stat.setBoolean(11, true);
            } else if (needsignon.equals("0")) {
                stat.setBoolean(11, false);
            }
            stat.setString(12, packagerpath);
//            stat.setString(13, loadbalancing);
            if (loadbalancing.equals("1")) {
                stat.setBoolean(13, true);
            } else if (loadbalancing.equals("0")) {
                stat.setBoolean(13, false);
            }
            stat.setString(14, lbgroup);
            stat.setInt(15, Integer.valueOf(seq));
            stat.setString(16, todirect);
            stat.executeUpdate();
            status = "00";
            stat.clearParameters();
        } catch (SQLException e) {
            e.printStackTrace();
            return status = e.getMessage();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status;
    }

    public ArrayList<Model_Iso> getAllIso(String bankcode) throws ParseException {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Model_Iso> listIso = new ArrayList<>();
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("Select * from opt_iso_table_" + bankcode + "");
            rs = stat.executeQuery();
            while (rs.next()) {
                Model_Iso mu = new Model_Iso();
                mu.setField(rs.getString("field"));
                mu.setName_of_field(rs.getString("name_of_field"));
                mu.setFormat(rs.getString("format"));
//                mu.setChars(rs.getString("char"));
                mu.setLength(rs.getString("length"));
                listIso.add(mu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return listIso;
    }

    public String addField(String bankcode, String field, String name, String format, String length) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status;
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            boolean status1 = false;
            HashMap resp = new HashMap();
            stat = conn.prepareStatement("select * from opt_iso_table_" + bankcode + " where field=?");
            stat.setInt(1, Integer.valueOf(field));
            rs = stat.executeQuery();
            status1 = rs.next();
            if (status1 == true) {
                return status = "01";
            } else {
                stat = conn.prepareStatement("INSERT INTO opt_iso_table_" + bankcode + "(field, name_of_field, format, length) VALUES (?, ?, ?, ?)");
                stat.setInt(1, Integer.valueOf(field));
                stat.setString(2, name);
                stat.setString(3, format);
//                stat.setString(4, chars);
                stat.setInt(4, Integer.valueOf(length));
                stat.executeUpdate();
                status = "00";
            }
        } catch (SQLException e) {
            return status = e.getMessage();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status = "00";
    }

    public String deletefield(String field, String bankcode) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status = "01";
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("delete from opt_iso_table_" + bankcode + " where field=?");
            stat.setInt(1, Integer.valueOf(field));
            stat.executeUpdate();
            stat.clearParameters();
            stat.clearBatch();
            status = "00";
        } catch (SQLException e) {
            e.printStackTrace();
            return status;
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status;
    }

    public String updateField(String field, String name, String format, String length, String bankcode) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status = "01";
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("UPDATE opt_iso_table_" + bankcode + " SET name_of_field=?, format=?, length=? WHERE field=?");
            stat.setString(1, name);
            stat.setString(2, format);
//            stat.setString(3, chars);
            stat.setInt(3, Integer.valueOf(length));
            stat.setInt(4, Integer.valueOf(field));
            stat.executeUpdate();
            status = "00";
            stat.clearParameters();
        } catch (SQLException e) {
            e.printStackTrace();
            return status = e.getMessage();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status;
    }

    public ArrayList<Model_800> getAll800(String bankcode) throws ParseException {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Model_800> listIso = new ArrayList<>();
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("Select * from opt_800_" + bankcode + "");
            rs = stat.executeQuery();
            while (rs.next()) {
                Model_800 mu = new Model_800();
                mu.setField(rs.getString("field"));
                mu.setName_of_field(rs.getString("name_of_field"));
                mu.setDelapanratus(rs.getString("800"));
                mu.setDelapansepuluh(rs.getString("810"));
                listIso.add(mu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return listIso;
    }

    public String addField800(String bankcode, String field, String name, String m800, String m810) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status;
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            boolean status1 = false;
            stat = conn.prepareStatement("select * from opt_800_" + bankcode + " where field=?");
            stat.setInt(1, Integer.valueOf(field));
            rs = stat.executeQuery();
            status1 = rs.next();
            if (status1 == true) {
                return status = "01";
            } else {
                stat = conn.prepareStatement("INSERT INTO opt_800_" + bankcode + "(field, name_of_field,  \"800\", \"810\") VALUES (?, ?, ?, ?)");
                stat.setInt(1, Integer.valueOf(field));
                stat.setString(2, name);
                stat.setString(3, m800);
                stat.setString(4, m810);
                stat.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return status = e.getMessage();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status = "00";
    }

    public String deletefield800(String field, String bankcode) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status = "01";
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("delete from opt_800_" + bankcode + " where field=?");
            stat.setInt(1, Integer.valueOf(field));
            stat.executeUpdate();
            stat.clearParameters();
            stat.clearBatch();
            status = "00";
        } catch (SQLException e) {
            e.printStackTrace();
            return status;
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status;
    }

    public String updateField800(String field, String name, String delapanratus, String delapansepuluh, String bankcode) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status = "01";
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("UPDATE opt_800_" + bankcode + " SET name_of_field=?, \"800\"=?, \"810\"=? WHERE field=?");
            stat.setString(1, name);
            stat.setString(2, delapanratus);
            stat.setString(3, delapansepuluh);
            stat.setInt(4, Integer.valueOf(field));
            stat.executeUpdate();
            status = "00";
            stat.clearParameters();
        } catch (SQLException e) {
            e.printStackTrace();
            return status = e.getMessage();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status;
    }

    public ArrayList<Model_400> getAll400(String bankcode) throws ParseException {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Model_400> listIso = new ArrayList<>();
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("Select * from opt_400_" + bankcode + "");
            rs = stat.executeQuery();
            while (rs.next()) {
                Model_400 mu = new Model_400();
                mu.setField(rs.getString("field"));
                mu.setName_of_field(rs.getString("name_of_field"));
                mu.setEmpatratus(rs.getString("400"));
                mu.setEmpatsepuluh(rs.getString("410"));
                listIso.add(mu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return listIso;
    }

    public String addField400(String bankcode, String field, String name, String m400, String m410) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status;
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            boolean status1 = false;
            stat = conn.prepareStatement("select * from opt_400_" + bankcode + " where field=?");
            stat.setInt(1, Integer.valueOf(field));
            rs = stat.executeQuery();
            status1 = rs.next();
            if (status1 == true) {
                return status = "01";
            } else {
                stat = conn.prepareStatement("INSERT INTO opt_400_" + bankcode + "(field, name_of_field,  \"400\", \"410\") VALUES (?, ?, ?, ?)");
                stat.setInt(1, Integer.valueOf(field));
                stat.setString(2, name);
                stat.setString(3, m400);
                stat.setString(4, m410);
                stat.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return status = e.getMessage();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status = "00";
    }

    public String deletefield400(String field, String bankcode) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status = "01";
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("delete from opt_400_" + bankcode + " where field=?");
            stat.setInt(1, Integer.valueOf(field));
            stat.executeUpdate();
            stat.clearParameters();
            stat.clearBatch();
            status = "00";
        } catch (SQLException e) {
            e.printStackTrace();
            return status;
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status;
    }

    public String updateField400(String field, String name, String empatratus, String empatsepuluh, String bankcode) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status = "01";
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("UPDATE opt_400_" + bankcode + " SET name_of_field=?, \"400\"=?, \"410\"=? WHERE field=?");
            stat.setString(1, name);
            stat.setString(2, empatratus);
            stat.setString(3, empatsepuluh);
            stat.setInt(4, Integer.valueOf(field));
            stat.executeUpdate();
            status = "00";
            stat.clearParameters();
        } catch (SQLException e) {
            e.printStackTrace();
            return status = e.getMessage();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status;
    }

    public ArrayList<Model_200> getAll200(String bankcode) throws ParseException {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Model_200> listIso = new ArrayList<>();
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("Select * from opt_200_" + bankcode + "");
            rs = stat.executeQuery();
            while (rs.next()) {
                Model_200 mu = new Model_200();
                mu.setField(rs.getString("field"));
                mu.setName_of_field(rs.getString("name_of_field"));
                mu.setDuaratus(rs.getString("200"));
                mu.setDuasepuluh(rs.getString("210"));
                listIso.add(mu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return listIso;
    }

    public String addField200(String bankcode, String field, String name, String m200, String m210) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status;
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            boolean status1 = false;
            stat = conn.prepareStatement("select * from opt_200_" + bankcode + " where field=?");
            stat.setInt(1, Integer.valueOf(field));
            rs = stat.executeQuery();
            status1 = rs.next();
            if (status1 == true) {
                return status = "01";
            } else {
                stat = conn.prepareStatement("INSERT INTO opt_200_" + bankcode + "(field, name_of_field,  \"200\", \"210\") VALUES (?, ?, ?, ?)");
                stat.setInt(1, Integer.valueOf(field));
                stat.setString(2, name);
                stat.setString(3, m200);
                stat.setString(4, m210);
                stat.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return status = e.getMessage();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status = "00";
    }

    public String deletefield200(String field, String bankcode) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status = "01";
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("delete from opt_200_" + bankcode + " where field=?");
            stat.setInt(1, Integer.valueOf(field));
            stat.executeUpdate();
            stat.clearParameters();
            stat.clearBatch();
            status = "00";
        } catch (SQLException e) {
            e.printStackTrace();
            return status;
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status;
    }

    public String updateField200(String field, String name, String duaratus, String duasepuluh, String bankcode) {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status = "01";
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("UPDATE opt_200_" + bankcode + " SET name_of_field=?, \"200\"=?, \"210\"=? WHERE field=?");
            stat.setString(1, name);
            stat.setString(2, duaratus);
            stat.setString(3, duasepuluh);
            stat.setInt(4, Integer.valueOf(field));
            stat.executeUpdate();
            status = "00";
            stat.clearParameters();
        } catch (SQLException e) {
            e.printStackTrace();
            return status = e.getMessage();
        } finally {
            clearAllConnStatRS(conn, stat, rs);
        }
        return status;
    }

//    public String CreateConnection() {
//        Connection conn = null;
//        PreparedStatement stat = null;
//        ResultSet rs = null;
//        String status;
//        try {
//            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
//            boolean status1 = false;
//            stat = conn.prepareStatement("select max(seq) as seq from socketcon");
//            rs = stat.executeQuery();
//            status1 = rs.next();
//            while (rs.next()) {
//
//            }
//
//            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
//            stat = conn.prepareStatement("INSERT INTO socketconn (todirect, host, statusopen, port, headertype, bankcode, lengthincl, typeapp, conname, packagename, autosignon, needsignon, typeconn, package_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
//            stat.setString(1, "web");
//            stat.setString(2, "198.168.0.1");
//            //statusopen jika sbg server = true, jika sbg client = false
//            stat.setBoolean(3, false);
//            stat.setInt(4, 14500);
//            //  headertype
//            //	1 : 4 length byte
//            //	2 : STX/ETX
//            //	3 : 2 hexa byte hi-low
//            //	4 : 2 hexa byte low-hi
//            stat.setInt(5, 1);
//            stat.setString(6, "bca");
//            //length include = true and false
//            stat.setBoolean(7, false);
//            //typeapp = C as client, S as server
//            stat.setString(8, "C");
//            stat.setString(9, "bank bca");
//            //packagename = iso,json,xml
//            stat.setString(10, "iso");
//            //autosignon = false untuk web, true untuk iso
//            stat.setBoolean(11, true);
//            //needsignon = false jika tidak butuhsignon, true jika butuh signon
//            stat.setBoolean(12, false);
//            //typeconn = web/socket
//            stat.setString(13, "socket");
//            stat.setString(14, "BCA");
//
//            stat.executeUpdate();
//            stat.clearParameters();
//
//        } catch (SQLException e) {
//            System.out.println(e);
//            e.printStackTrace();
//            return status = e.getMessage();
//        } finally {
//            clearAllConnStatRS(conn, stat, rs);
//        }
//        return status = "0000";
//    }
}
