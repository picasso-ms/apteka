package dao;

import dao.medicineDao.MedicineMySqlDao;
import dao.orderDao.OrderMySqlDao;
import dao.userDao.UserMySqlDao;

public class MySqlDAOFactory {
	
	public static MedicineMySqlDao getMedecineMySqlDao() {
		return new MedicineMySqlDao();
	}
	public static UserMySqlDao getUserMySqlDao(){return new UserMySqlDao();}
	public static OrderMySqlDao getOrderMySqlDao(){return new OrderMySqlDao();}
}
