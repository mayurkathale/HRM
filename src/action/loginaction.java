package action;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import pojo.User_detail;
import dao.LoginUser;

public class loginaction implements SessionAware, ServletRequestAware{

	String accno;
	String password;
	Map<String, Object> sessioMap = null;
	HttpServletRequest request;
	

	public String auth()
	{
		LoginUser dao = new LoginUser();
		User_detail user = dao.userlogin(accno, password);
		if(user!=null)
		{
			sessioMap.put("currentuser", user);
			sessioMap.put("logintype","user");
			return "success";
		}
		else {
			sessioMap.put("loginmsg", "Record not Found");
			return "failure";
		}
	
	}
	
	public String adminlogin()
	{
		if(accno.equals("manager") && password.equals("manager"))
		{
			System.out.println("in auth Sucess");
			sessioMap.put("logintype", "manager");
			return "success";
		}
		else
		{
			return "failure";
		}
	}
	
	public String logout()
	{
		System.out.println("in logout");
		Set<String> keys =  sessioMap.keySet();
		for(String str : keys)
		{
			sessioMap.remove(str);
		}
		HttpSession hs = request.getSession();
		hs.invalidate();
		return "success";
	}
	
	//-------------------------------------
	
	public String homeaction()
	{
		return "success";	
	}
	
	public String contactaction()
	{
		return "success";	
	}
	
	public String aboutusaction()
	{
		return "success";	
	}
	
	public String intc()
	{
		return "success";	
	}
	
	
	public String adminss()
	{
		return "success";	
	}
	
	public String login_page()
	{
		return "success";	
	}
	
	public String withdrawpage() {
		return "success";	
	}
	
	//---------------------------------
	
	public void setAccno(String accno) {
		this.accno = accno;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	public void setSession(Map<String, Object> arg0) {
		this.sessioMap=arg0;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		this.request=arg0;
	}

	
}
