package entity;

import java.io.Serializable;

public class Item implements Serializable {


	private int amount;
	private float price;

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public void setM(Medicine m) {
		this.m = m;
	}






	private Medicine m;

	public Medicine getM() {
		return m;
	}

	public Item(Medicine m, int amount) {
		this.m = m;
		this.amount = amount;
	}
	public Item(Medicine m, int amount,float price) {
		this.m = m;
		this.amount = amount;
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public float getTotalPrice() {
		return m.getPrice()*amount;
	}


	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		Item item = (Item) o;

		return m.equals(item.m);
	}

	@Override
	public int hashCode() {
		return m.hashCode();
	}


}
