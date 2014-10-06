package interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class UserAuth implements Interceptor{
	private static final long serialVersionUID = 1L;
	public String intercept(ActionInvocation invocation) throws Exception {
		Map<String, Object> sessionMap = (Map<String, Object>) invocation.getInvocationContext().getSession();
		String currentlogin = (String) sessionMap.get("logintype");
		System.out.println("out of if "+currentlogin);
		
		if(currentlogin.equals("manager"))
		{
			System.out.println("print failure");
			return "intfailure";
		}
		else if (sessionMap.get("logintype").equals("user")) {
			System.out.println("print success in invoke");
			invocation.invoke();
		}
		else {
				return "intfailure";
		}
		System.out.println("print failure");
		return "intfailure";
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void init() {
		// TODO Auto-generated method stub
	}
}
