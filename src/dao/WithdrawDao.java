package dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import pojo.BankTransaction;
import pojo.User_detail;

import utils.HibernateUtils;

public class WithdrawDao {

	public boolean withdraw_byadmin(User_detail u, String amt) {
		boolean status = false;
		BankTransaction trans = new BankTransaction();
		Session hs = HibernateUtils.getSess();
		Transaction tx = null;
		tx = hs.beginTransaction();
		System.out.println("before");
		 Query qry =  hs.createQuery("from User_detail where id=?");
		 qry.setInteger(0, u.getId());
		 User_detail user = (User_detail) qry.uniqueResult();
		System.out.println("before");
		Long i = user.getBalance()-Long.parseLong(amt);
		if(i>=1000)
		{
			user.setBalance(i);
			hs.update(user);
			trans.setAccno(user.getAccno());
			trans.setAccno2("manager");
			trans.setAmount(Long.parseLong(amt));
			trans.setTtype("w");
			hs.save(trans);
			status = true;
		}
		tx.commit();
		hs.close();
		return status;
	}
}
