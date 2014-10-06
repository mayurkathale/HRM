package utils;

import org.hibernate.cfg.*;
import org.hibernate.*;
import org.hibernate.service.*;

//role --- to set up Hibernate configuration
//attach singleton immutable inst SF to the same
//add method to get hib session
public class HibernateUtils {
	private static SessionFactory sf;
	//private static Session sess;
	static {
		System.out.println("in init block....");
		Configuration cfg = new Configuration().configure();
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(
				cfg.getProperties()).buildServiceRegistry();
		sf=cfg.buildSessionFactory(reg);
	}

	public static SessionFactory getSf() {
		return sf;
	}

	public static Session getSess() {
		return sf.openSession();
	}

}