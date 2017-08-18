package com.crm.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
	
	static Configuration cfg=null;
	static SessionFactory sessionFactory=null;
	
	//或： 加上 private final 亦可，不过此时不能等于 null
//	private static final Configuration cfg;
//	private static final SessionFactory sessionFactory;
	
	//静态代码块
	static {
		//加载核心配置文件
		cfg=new Configuration();
		cfg.configure();
		sessionFactory=cfg.buildSessionFactory();
		
	}
	
	//提供方法返回 sessionFactory
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	
	//提供方法返回与本地线程绑定的 Session
	public static Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
}
