package dao.userDao;

import dao.Database;
import entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMySqlDao implements UserDao {
    @Override
    public User getUserByLogin(String login) {
        User u = null;
        Connection con = null;
        PreparedStatement stmt = null;


        try {
            con = Database.getInstance().getConnection();
            stmt = con.prepareStatement("SELECT * FROM apteka.user where apteka.user.login =? ");
            stmt.setString(1,login);



            ResultSet rs = stmt.executeQuery();
            if(rs.next())
                u = new User(rs.getInt("id_user"),rs.getString("login"),rs.getString("password"),rs.getInt("id_user_status"));

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {

            Database.close(stmt);
            Database.close(con);
        }

        return u;

    }

    @Override
    public void addUserToDb(User u) {

        Connection con = null;
        PreparedStatement stmt = null;
        //System.out.println(u.getLogin()+"!  !"+u.getPassword()+"   "+u.getStatus());

        con = Database.getInstance().getConnection();
        try {
            stmt = con.prepareStatement("INSERT INTO `apteka`.`user` (`login`, `password`, `id_user_status`) VALUES ( ?, ?, ?)");
            stmt.setString(1,u.getLogin());
            stmt.setString(2,u.getPassword());
            stmt.setInt(3,u.getStatus());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {

            Database.close(stmt);
            Database.close(con);
        }

    }
}
