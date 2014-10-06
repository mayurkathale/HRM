package pojo;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
@SuppressWarnings("serial")
@Entity
public class BankTransaction implements Serializable{
	@Id @GeneratedValue
	int trans_id;
	String accno;
	String ttype;
	Long amount;
	String accno2;
	
	public int getTrans_id() {
		return trans_id;
	}
	public void setTrans_id(int trans_id) {
		this.trans_id = trans_id;
	}
	public String getAccno() {
		return accno;
	}
	public void setAccno(String accno) {
		this.accno = accno;
	}
	public String getTtype() {
		return ttype;
	}
	public void setTtype(String ttype) {
		this.ttype = ttype;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public String getAccno2() {
		return accno2;
	}
	public void setAccno2(String accno2) {
		this.accno2 = accno2;
	}
	@Override
	public String toString() {
		return "BankTransaction [trans_id=" + trans_id + ", accno=" + accno
				+ ", ttype=" + ttype + ", amount=" + amount + ", accno2="
				+ accno2 + "]";
	}

}
