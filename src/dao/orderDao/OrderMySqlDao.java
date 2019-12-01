package dao.orderDao;

import dao.Database;
import entity.Item;
import entity.Medicine;
import entity.Order;
import entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderMySqlDao implements OrderDao {


    @Override
    public Order getOrderById(int id)
    {
        Order o = null;
        Connection con = null;
        PreparedStatement stmt = null;


        try {
            con = Database.getInstance().getConnection();
            stmt = con.prepareStatement("SELECT * FROM apteka.orders where apteka.orders.id_order =? ");
            stmt.setInt(1,id);



            ResultSet rs = stmt.executeQuery();
            if(rs.next())
                o = new Order( rs.getInt("id.order"),rs.getInt("id_order_status"),rs.getString("login"),rs.getString("order_status"),
                        rs.getString("name"),rs.getString("phone"),rs.getString("date"));

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {

            Database.close(stmt);
            Database.close(con);
        }

        return o;
    }

    @Override
    public List<Order> getOrders() {
        List<Order> list = new ArrayList<Order>();
        Connection con = null;
        PreparedStatement stmt = null;
        con = Database.getInstance().getConnection();

        try {
            stmt = con.prepareStatement("SELECT * FROM apteka.orders  ");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()){



                Order o  = new Order( rs.getInt("id_order"),rs.getInt("id_order_status"),rs.getString("login"),rs.getString("order_status"),
                        rs.getString("name"),rs.getString("phone"),rs.getString("date"));



                stmt = con.prepareStatement("SELECT * FROM apteka.ordercart where apteka.ordercart.id_order = ?");
                stmt.setInt(1,o.getId_order());
                ResultSet rsN = stmt.executeQuery();
                while (rsN.next())
                {
                    Medicine m = new Medicine(rsN.getInt("id_medicine"),rsN.getString("name"),rsN.getString("category"),
                            rsN.getString("producer"),rsN.getString("storage_mode"));
                    o.getCartI().add( new Item(m,rsN.getInt("amount"),rsN.getFloat("price")));
                }
                list.add(o);

            }




        } catch (SQLException e) {
            e.printStackTrace();
        }


        return list;
    }

    @Override
    public void addOrder(Order o)
    {
        Connection con = null;
        PreparedStatement stmt = null;
        //System.out.println(u.getLogin()+"!  !"+u.getPassword()+"   "+u.getStatus());

        con = Database.getInstance().getConnection();
        try {
            stmt = con.prepareStatement("INSERT INTO `apteka`.`order_info` (`name`, `phone`, `date`) VALUES ( ?, ?, ?)");
            stmt.setString(1,o.getName());
            stmt.setString(2,o.getPhone());
            stmt.setString(3,o.getDate());
            stmt.executeUpdate();




            stmt = con.prepareStatement("SELECT max(id) as id FROM apteka.order_info");

            ResultSet rs =  stmt.executeQuery();
            rs.next();
            int idInfo = rs.getInt("id");

            stmt = con.prepareStatement("INSERT INTO `apteka`.`order` (`id_user`, `id_order_status`, `id_info`) VALUES ( ?, ?, ?)");
            stmt.setInt(1,o.getId_user());
            stmt.setInt(2,o.getId_order_status());
            stmt.setInt(3,idInfo);
            stmt.executeUpdate();

            stmt = con.prepareStatement("SELECT max(id_order) as id_order FROM apteka.order");

            rs =  stmt.executeQuery();
            rs.next();
            int idOrder = rs.getInt("id_order");
            o.setId_order(idOrder);

            for(Item i : o.getCartI())
            {
                stmt = con.prepareStatement("INSERT INTO `apteka`.`cart` (`id_medicine`, `id_order`, `amount`, `price`) VALUES ( ?, ?, ?,?)");
                stmt.setInt(1,i.getM().getId_medicine());
                stmt.setInt(2,idOrder);
                stmt.setInt(3,i.getAmount());
                stmt.setFloat(4,i.getTotalPrice());
                stmt.executeUpdate();

                stmt = con.prepareStatement("UPDATE `apteka`.`medicine` SET `amount` = minus(?,?) WHERE (`id_medicine` = ?)");
                stmt.setInt(1,i.getM().getId_medicine());
                stmt.setInt(2,i.getAmount());
                stmt.setInt(3,i.getM().getId_medicine());
                stmt.executeUpdate();
            }





        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {

            Database.close(stmt);
            Database.close(con);
        }


    }

    @Override
    public void changeStatus(int id, int status) {

        Connection con = null;
        PreparedStatement stmt = null;
        con = Database.getInstance().getConnection();

        try {
            stmt = con.prepareStatement("UPDATE `apteka`.`order` SET `id_order_status` = ? WHERE (`id_order` = ?)");
            stmt.setInt(1,status);
            stmt.setInt(2,id);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
