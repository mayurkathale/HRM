package dao;

import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.Session;
import pojo.User_detail;
import utils.HibernateUtils;

public class LoginUser {

	public User_detail userlogin(String username, String pwd)
	{
		Session hs= HibernateUtils.getSess();
		Transaction tx = null;		
		tx = hs.beginTransaction();
		Query query = hs.createQuery("from User_detail where accno=? and password=?");
		query.setString(0, username);
		query.setString(1, pwd);
		User_detail user = (User_detail) query.uniqueResult();
		tx.commit();
		hs.close();
		return user;
	}
}
