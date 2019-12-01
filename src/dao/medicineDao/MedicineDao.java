package dao.medicineDao;

import java.util.HashMap;
import java.util.List;

import entity.Medicine;

public interface MedicineDao {
	
	public List<Medicine> getAll();
	public Medicine getByID(int id);
	public HashMap<Integer,String> getDirectory(String d, String col,String id);
	public void changeMedicine(int id,String name,float price,int amount,int idC,int idP,int idS);



}
