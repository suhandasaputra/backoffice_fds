
import com.mdw.db.DatasourceEntry;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author matajari
 */
public class tesbro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        System.out.println("start cuy...");
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        String status;
        try {
            conn = DatasourceEntry.getInstance().getPostgreDS().getConnection();
            stat = conn.prepareStatement("INSERT INTO socketconn (todirect, host, statusopen, port, headertype, bankcode, lengthincl, typeapp, conname, packagename, autosignon, needsignon, typeconn, package_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            stat.setString(1, "web");
            stat.setString(2, "198.168.0.1");
            //statusopen jika sbg server = true, jika sbg client = false
            stat.setBoolean(3, false);
            stat.setInt(4, 14500);
            //  headertype
            //	1 : 4 length byte
            //	2 : STX/ETX
            //	3 : 2 hexa byte hi-low
            //	4 : 2 hexa byte low-hi
            stat.setInt(5, 1);
            stat.setString(6, "bca");
            //length include = true and false
            stat.setBoolean(7, false);
            //typeapp = C as client, S as server
            stat.setString(8, "C");
            stat.setString(9, "bank bca");
            //packagename = iso,json,xml
            stat.setString(10, "iso");
            //autosignon = false untuk web, true untuk iso
            stat.setBoolean(11, true);
            //needsignon = false jika tidak butuhsignon, true jika butuh signon
            stat.setBoolean(12, false);
            //typeconn = web/socket
            stat.setString(13, "socket");
            stat.setString(14, "BCA");

            stat.executeUpdate();
            stat.clearParameters();

        } catch (SQLException e) {
            System.out.println(e);
        } finally {
        }
    }

}
