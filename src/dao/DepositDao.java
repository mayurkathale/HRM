package dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.BankTransaction;
import pojo.User_detail;
import utils.HibernateUtils;

public class DepositDao {

	public void depositby_admin(String amt, User_detail userdeposit)
	{
		BankTransaction trans = new BankTransaction();
		User_detail  userd = new User_detail();
		Session hs = HibernateUtils.getSess();
		Transaction tx = null;
		tx=hs.beginTransaction();
		Query query = hs.createQuery("from User_detail where accno=?");
		query.setString(0, userdeposit.getAccno());
		userd= (User_detail) query.uniqueResult();
		Long i = Integer.parseInt(amt) + userd.getBalance();
		userd.setBalance(i);
		hs.update(userd);
		
		Long number = Long.parseLong(amt);
		trans.setAmount(number);
		trans.setAccno2("manager");
		trans.setAccno(userd.getAccno());
		trans.setTtype("d");
		System.out.println(userd);
		System.out.println(trans);
		hs.save(trans);
		tx.commit();
		hs.clear();
	}
}
