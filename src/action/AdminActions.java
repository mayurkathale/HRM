package action;

import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import pojo.User_detail;
import com.opensymphony.xwork2.ModelDriven;

import dao.DepositDao;
import dao.ModifyDao;
import dao.RegisterDao;
import dao.WithdrawDao;

public class AdminActions implements SessionAware, ModelDriven<User_detail>{
	User_detail user = new User_detail();
	Map<String, Object> sessionMap=null;
	String to_deposit;

	public void setTo_deposit(String to_deposit) {
		this.to_deposit = to_deposit;
	}

	public String createaccount() {
		return "Fialed sads one 2";
	}
	
	public String modifypage() {
		return "success";
	}
	
	public String depositpage() {
		return "success";
	}
	
	public String admindeposit_check() {
		
		ModifyDao dao = new ModifyDao();
		User_detail user_depo = new User_detail();
		user_depo=dao.modify_depositcheck(user.getAccno());
		sessionMap.put("todeposit",user_depo );
		if(user_depo!=null)
			return "success";
		else
			return "failure";
	}
	
	public String modifyacc() {
		System.out.println("in modifyacc action");
		String acc = user.getAccno();
		ModifyDao dao = new ModifyDao();
		System.out.println(acc);
		User_detail userlist= dao.modifyaccount(acc);
		if (userlist!=null) {
			sessionMap.put("tomodify", userlist);
			return "success";
		}
		else
			return "failure";
	}
	
	public String modifyfinal() {
		User_detail foracc_number= (User_detail) sessionMap.get("tomodify");
		sessionMap.remove("tomodify");
		ModifyDao dao = new ModifyDao();
		System.out.println("in modifyfinal action");
		dao.modifyfinal(user,foracc_number);
		return "success";
	}
	
	
	public String registration() {
		RegisterDao dao = new RegisterDao();
		System.out.println(user);
		dao.insertdetails(user);
		return "success";
	}

	public User_detail getModel() {
		return user;
	}
	
	public String view() {
		
		System.out.println("in view action");
		RegisterDao dao = new RegisterDao();
		List<User_detail> u = dao.viewaccount();
		sessionMap.put("viewlist", u);
		return "success";
	}
	
	public String deposit_money() {
		System.out.println("in deposit money");
		System.out.println(to_deposit);
		DepositDao dao = new DepositDao();
		User_detail userdeposit = (User_detail) sessionMap.get("todeposit");
		dao.depositby_admin(to_deposit,userdeposit);
		return "success";
	}
	
	public String withdrwal_check() {
		ModifyDao dao = new ModifyDao();
		User_detail userdep = dao.modify_depositcheck(user.getAccno());
		sessionMap.put("towithdraw", userdep);
		if(userdep!=null)
			return "success";
		else 
			return "failure";
	}
	
	public String withdraw_money() {
		WithdrawDao dao = new WithdrawDao();
		User_detail u = (User_detail) sessionMap.get("towithdraw");
		sessionMap.remove("towithdraw");
		System.out.println(u+""+to_deposit);
		boolean status = dao.withdraw_byadmin(u,to_deposit);
		System.out.println("withrwal complete");
		if(status)
			return "success";
		else 
			return "failure";

	}
	
	public String deletepage() {
		
		return "success";
	}
public String deleteaccount_display() {
		ModifyDao dao = new ModifyDao();
		User_detail userdep = dao.modify_depositcheck(user.getAccno());
		sessionMap.put("todelete", userdep);
		if(userdep!=null)
			return "success";
		else 
			return "failure";
	}

public String delete_last() {
	ModifyDao dao = new ModifyDao();
	User_detail user1 = (User_detail) sessionMap.get("todelete");
	sessionMap.remove("todelete");
	dao.delete_last(user1);
	return "success";
}

	public void setSession(Map<String, Object> arg0) {
		this.sessionMap=arg0;
	}
}
