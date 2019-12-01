package dao.orderDao;

import entity.Order;

import java.util.List;

public interface OrderDao {

    public Order getOrderById(int id);
    public List<Order> getOrders();
    public void addOrder(Order o);
    public void changeStatus(int id,int status);

}
