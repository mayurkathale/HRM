package pojo;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@SuppressWarnings("serial")
@Entity
public class User_detail implements Serializable{
	@Id @GeneratedValue
	int id;
	@Id
	String accno;
	String password;
	String name;
	String address;
	String contact;

	Long balance;
	@Column(length='1')
	String acctype;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccno() {
		return accno;
	}

	public void setAccno(String accno) {
		this.accno = accno;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public Long getBalance() {
		return balance;
	}

	public void setBalance(Long balance) {
		this.balance = balance;
	}

	public String getAcctype() {
		return acctype;
	}

	public void setAcctype(String acctype) {
		this.acctype = acctype;
	}

	@Override
	public String toString() {
		return "User_detail [id=" + id + ", accno=" + accno + ", password="
				+ password + ", name=" + name + ", address=" + address
				+ ", contact=" + contact + ", balance=" + balance
				+ ", acctype=" + acctype + "]";
	}
	
}
