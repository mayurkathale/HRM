package dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.BankTransaction;
import pojo.User_detail;
import utils.HibernateUtils;

public class TransDao {

	@SuppressWarnings("unchecked")
	public List<BankTransaction> trasactionstmt(String accno)
	{
		List<BankTransaction> list = null;
		//List<BankTransaction> list2 = null;
		Session hs = HibernateUtils.getSess();
		Transaction tx = null;
		tx = hs.beginTransaction();
		Query query = hs.createQuery("from BankTransaction where accno=?");
		query.setString(0, accno);
		//Query query1 = hs.createQuery("from BankTransaction where accno2=?");
		//query1.setString(0, accno);
		list = query.list();
		//list2 = query1.list();
		//list.addAll(list2);
		tx.commit();
		hs.close();
		//System.out.println(list);
		return list;
	}
	
	public boolean transferfund(String from, String to , String amt) {
		boolean status = false;
		Session hs = HibernateUtils.getSess();
		Transaction tx = null;
		tx= hs.beginTransaction();
		Query query = hs.createQuery("from User_detail where accno=?");
		query.setString(0, from);
		User_detail userdetails = (User_detail) query.uniqueResult();
			
		if((userdetails.getBalance()-Long.parseLong(amt))>=1000)
		{
			Long from_bal=userdetails.getBalance(),froms_update;
			froms_update = (from_bal-Long.parseLong(amt));
			System.out.println("froms updated :"+froms_update);
			userdetails.setBalance(froms_update);
			System.out.println("before update : from user :"+userdetails);
			hs.update(userdetails);
			tx.commit();
			hs.close();
			
			Session hs2 = HibernateUtils.getSess();
			tx=hs2.beginTransaction();
			Query query2 = hs2.createQuery("from User_detail where accno=?");
			query2.setString(0, to);
			User_detail user2 = (User_detail) query2.uniqueResult();
			if(user2==null)
				return false;
			
			long cur_balance = user2.getBalance(); 
			user2.setBalance(cur_balance+Long.parseLong(amt));
			hs2.update(user2);
			tx.commit();
			hs2.close();
			
			Session hs3 = HibernateUtils.getSess();
			tx=hs3.beginTransaction();
			BankTransaction trans = new BankTransaction();
			trans.setAccno(userdetails.getAccno());
			trans.setAccno2(user2.getAccno());
			trans.setAmount(Long.parseLong(amt));
			trans.setTtype("w");
			hs3.save(trans);
			tx.commit();
			hs3.close();
			
			Session hs4 = HibernateUtils.getSess();
			tx=hs4.beginTransaction();
			BankTransaction trans2 = new BankTransaction();
			trans2.setAccno(user2.getAccno());
			trans2.setAccno2(userdetails.getAccno());
			trans2.setAmount(Long.parseLong(amt));
			trans2.setTtype("d");
			hs4.save(trans2);
			tx.commit();
			hs4.close();
			status= true;
		}
		else {
			tx.commit();
			hs.close();
		}
		
		return status;
	}
	
	
}
