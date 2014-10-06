package dao;



import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import pojo.BankTransaction;
import pojo.User_detail;
import utils.HibernateUtils;

public class RegisterDao {

	public void insertdetails(User_detail user) {
		BankTransaction trans = new BankTransaction();
		Session hs = HibernateUtils.getSess();
		Transaction tx = null;
		tx= hs.beginTransaction();
		hs.save(user);
		trans.setAccno(user.getAccno());
		trans.setAccno2("manager");
		trans.setTtype("d");
		trans.setAmount(user.getBalance());
		hs.save(trans);
		tx.commit();
		hs.close();
	}
	
	@SuppressWarnings("unchecked")
	public List<User_detail> viewaccount()
	{
		List<User_detail> user= null;
		System.out.println("in view dao");
		Session hs = HibernateUtils.getSess();
		Transaction tx = null;
		tx= hs.beginTransaction();
		user  =  hs.createQuery("from User_detail").list();
		tx.commit();
		hs.close();
		return user;
	}
	
}
