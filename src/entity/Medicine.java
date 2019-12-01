package entity;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;



public class Medicine implements Serializable {
	

	private static final long serialVersionUID = 1L;

	private int id_medicine;
	private String name;
	private float price;
	private int amount;
	private String category;
	private String producer;
	private String storage_mod;
	
	public Medicine() {}
	
	public Medicine(int id_medicine,String name,int amount,float price,String category,String producer,String storage_mod) {
		this.id_medicine = id_medicine;
		this.name = name;
		this.amount = amount;
		this.price = price;
		this.category = category;
		this.producer = producer;
		this.storage_mod = storage_mod;
		
	}

	public Medicine(int id_medicine,String name,String category,String producer,String storage_mod) {
		this.id_medicine = id_medicine;
		this.name = name;
		this.category = category;
		this.producer = producer;
		this.storage_mod = storage_mod;

	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getProducer() {
		return producer;
	}
	public void setProducer(String producer) {
		this.producer = producer;
	}
	public String getStorage_mod() {
		return storage_mod;
	}
	public void setStorage_mod(String storage_mod) {
		this.storage_mod = storage_mod;
	}
	public int getId_medicine() {
		return id_medicine;
	}
	public void setId_medicine(int id_medicine) {
		this.id_medicine = id_medicine;
	}
	




	@Override
	public String toString() {
		return "Medicine [id_medicine=" + id_medicine + ", name=" + name + ", price=" + price + ", amount=" + amount
				+ ", category=" + category + ", producer=" + producer + ", storage_mod=" + storage_mod + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((producer == null) ? 0 : producer.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Medicine other = (Medicine) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (producer == null) {
			if (other.producer != null)
				return false;
		} else if (!producer.equals(other.producer))
			return false;
		return true;
	}
	
	
	
	
	
	

}
