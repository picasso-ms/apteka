package entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;

public class Order implements Serializable {


    int id_order;
    int id_user;
    int id_order_status;
    int id_info;
    String login;
    String status;
    String name;
    String phone;
    String date;
    HashSet<Item> cartI;

    public Order(int id_order, String login, String status, String name, String phone) {
        this.id_order = id_order;
        this.login = login;
        this.status = status;
        this.name = name;
        this.phone = phone;
        this.date = new SimpleDateFormat("yyyy-MM-dd").format(new Date()) ;
    }

    public Order(int id_order,int id_order_status, String login, String status, String name, String phone, String date) {
        this.id_order = id_order;
        this.id_order_status = id_order_status;
        this.login = login;
        this.status = status;
        this.name = name;
        this.phone = phone;
        this.date = date;
        this.cartI = new HashSet<Item>();
    }

    public Order(int id_user, int id_order_status,HashSet<Item> cartI,  String name, String phone) {
        this.id_user = id_user;
        this.id_order_status = id_order_status;
        this.cartI = cartI;
        this.name = name;
        this.phone = phone;
        this.date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    }

    public int getId_order() {
        return id_order;
    }

    public void setId_order(int id_order) {
        this.id_order = id_order;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getId_order_status() {
        return id_order_status;
    }

    public void setId_order_status(int id_order_status) {
        this.id_order_status = id_order_status;
    }

    public int getId_info() {
        return id_info;
    }

    public void setId_info(int id_info) {
        this.id_info = id_info;
    }

    public HashSet<Item> getCartI() {
        return cartI;
    }

    public void setCartI(HashSet<Item> cartI) {
        this.cartI = cartI;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Order order = (Order) o;

        return id_order == order.id_order;
    }

    @Override
    public int hashCode() {
        return id_order;
    }
}
