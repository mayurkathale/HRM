package dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import pojo.User_detail;

import utils.HibernateUtils;

public class ModifyDao {

	@SuppressWarnings("unchecked")
	public User_detail modifyaccount(String accno) {
		User_detail moduser=null;
		Session hs = HibernateUtils.getSess();
		Transaction tx= null;
		tx = hs.beginTransaction();
		Query query = hs.createQuery("from User_detail where accno = ?");
		query.setString(0, accno);
		User_detail user = (User_detail) query.uniqueResult();
	/*	Iterator<User_detail> itr = user.listIterator();
		while(itr.hasNext())
		{
			moduser=itr.next();
		}
		System.out.println(moduser.getName());*/
		tx.commit();
		hs.close();
		return user;
	}
	
	public void modifyfinal(User_detail user, User_detail foracc_number)
	{
		user.setAccno(foracc_number.getAccno());
		User_detail founduser = new User_detail();
		Session hs = HibernateUtils.getSess();
		Transaction tx = null;
		tx= hs.beginTransaction();
		Query query = hs.createQuery("from User_detail where accno=?");
		query.setString(0, user.getAccno());
		
		founduser = (User_detail)query.uniqueResult();
		System.out.println(founduser);
		founduser.setAddress(user.getAddress());
		founduser.setContact(user.getContact());
		founduser.setName(user.getName());
		founduser.setPassword(user.getPassword());
		hs.update(founduser);
		tx.commit();
		hs.close();
	}
	
	public User_detail modify_depositcheck(String accno) {
		Session hs = HibernateUtils.getSess();
		User_detail user= new User_detail();
		Transaction tx=null;
		tx=hs.beginTransaction();
		Query query = hs.createQuery("from User_detail where accno=?");
		query.setString(0, accno);
		user= (User_detail) query.uniqueResult();
		tx.commit();
		hs.close();
		return user;
	}
	
	public String delete_last(User_detail user)
	{
		Session hs = HibernateUtils.getSess();
		Transaction tx = null;
		tx= hs.beginTransaction();
		System.out.println(user);
		hs.delete(user);
		tx.commit();
		hs.close();
		return "a";
	}
}
