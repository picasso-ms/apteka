package dao.medicineDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.sql.SQLException;

import dao.Database;
import entity.Medicine;


public class MedicineMySqlDao implements MedicineDao {
	
	/*private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/apteka"+
            "?verifyServerCertificate=false"+
            "&useSSL=false"+
            "&requireSSL=false"+
            "&useLegacyDatetimeCode=false"+
            "&amp"+
            "&serverTimezone=UTC";
	private static final String NAME = "root";
	private static final String PASSWORD = "root";*/

	@Override
	public List<Medicine> getAll() {
		Connection con = null;
		PreparedStatement stmt = null;
		List<Medicine> list = new ArrayList<Medicine>();
		
		
		try {
			//con = getConnection(con);
			con = Database.getInstance().getConnection();
			stmt = con.prepareStatement("SELECT * FROM apteka.medicines order by id_medicine");
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next())
			{
				Medicine med = new Medicine();
				med.setId_medicine(rs.getInt("id_medicine"));
				med.setName(rs.getString("name"));
				med.setPrice(rs.getFloat("price"));
				med.setAmount(rs.getInt("amount"));
				med.setCategory(rs.getString("category"));
				med.setProducer(rs.getString("producer"));
				med.setStorage_mod(rs.getString("storage_mode"));
				
				list.add(med);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			Database.close(stmt);
			Database.close(con);
		}
		return list;
	}

	@Override
	public Medicine getByID(int id) {
		Connection con = null;
		PreparedStatement stmt = null;
		Medicine med = new Medicine();
		
		
		try {
			//con = getConnection(con);
			con = Database.getInstance().getConnection();
			stmt = con.prepareStatement("SELECT * FROM apteka.medicines where apteka.medicines.id_medicine =?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			
			rs.next();
							
			med.setId_medicine(rs.getInt("id_medicine"));
			med.setName(rs.getString("name"));
			med.setPrice(rs.getFloat("price"));
			med.setAmount(rs.getInt("amount"));
			med.setCategory(rs.getString("category"));
			med.setProducer(rs.getString("producer"));
			med.setStorage_mod(rs.getString("storage_mode"));
				
				
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			Database.close(stmt);
			Database.close(con);
		}
		return med;
	}

	@Override
	public HashMap<Integer,String> getDirectory(String d, String col,String id) {
		Connection con = null;
		PreparedStatement stmt = null;
		HashMap<Integer,String> hm = new HashMap<Integer,String>();


		try {
			//con = getConnection(con);
			con = Database.getInstance().getConnection();
			stmt = con.prepareStatement("SELECT * FROM"+d);

			ResultSet rs = stmt.executeQuery();

			while(rs.next())
			{
				hm.put(rs.getInt(id),rs.getString(col));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			Database.close(stmt);
			Database.close(con);
		}
		return hm;
	}

	@Override
	public void changeMedicine(int id,String name, float price, int amount, int idC, int idP, int idS) {
		Connection con = null;
		PreparedStatement stmt = null;


		con = Database.getInstance().getConnection();
		try {
			stmt = con.prepareStatement("UPDATE `apteka`.`medicine` SET `Name` = ?, `price` = ?, `amount` = ?, `id_category` =?, `id_producer` = ?, `id_storage_mod` = ? " +
					"WHERE (`id_medicine` = ?);");
			stmt.setString(1,name);
			stmt.setFloat(2,price);
			stmt.setInt(3,amount);
			stmt.setInt(4,idC);
			stmt.setInt(5,idP);
			stmt.setInt(6,idS);
			stmt.setInt(7,id);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {

			Database.close(stmt);
			Database.close(con);
		}


	}


}
