package action;

import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

import dao.TransDao;

import pojo.BankTransaction;
import pojo.User_detail;


public class UserAction implements SessionAware{

	Map<String, Object> sessioMap;
	String acc_to,amt_tr;

	public String userdetails()
	{
		return "success";
	}
	
	public String transact_statement() {
		User_detail user = (User_detail) sessioMap.get("currentuser");
		TransDao dao = new TransDao();
		List<BankTransaction> listtrans = dao.trasactionstmt(user.getAccno());
		if(!(listtrans.isEmpty()))
		{	
			sessioMap.put("trlist", listtrans);
			return "success";
		}
		else 
			return "failure";
	}	
	
	
	public String transferfund() {
		User_detail users = (User_detail) sessioMap.get("currentuser");
		TransDao dao = new TransDao();
	
		if(dao.transferfund(users.getAccno(), acc_to, amt_tr))
		{
			long temp=users.getBalance()-Long.parseLong(amt_tr);
			users.setBalance(temp);
			sessioMap.put("currentuser", users);
			return "success";
		}
		else
			return "failure";
	}	

	public String transferpage() {
		return "success";
	}
	
	public void setSession(Map<String, Object> arg0) {
		this.sessioMap=arg0;
	}

	public void setAcc_to(String acc_to) {
		this.acc_to = acc_to;
	}

	public void setAmt_tr(String amt_tr) {
		this.amt_tr = amt_tr;
	}
	
}
