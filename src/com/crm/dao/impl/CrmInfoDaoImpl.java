package com.crm.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.crm.dao.CrmInfoDao;
import com.crm.entity.extd.CrmInfo;
import com.crm.utils.HibernateUtils;

public class CrmInfoDaoImpl implements CrmInfoDao {

	@Override
	public void save(CrmInfo crmInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.save(crmInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void delete(CrmInfo crmInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.delete(crmInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void deleteMul(CrmInfo[] crmInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			for (CrmInfo crmInfo2 : crmInfo) {
				session.delete(crmInfo2);
			}
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void update(CrmInfo crmInfo) {
		
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.update(crmInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public boolean check(CrmInfo crmInfo) {
		
		return false;
	}

	@Override
	public CrmInfo get(CrmInfo crmInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CrmInfo where crmId=?");
			query.setParameter(0, crmInfo.getCrmId());
			@SuppressWarnings("unchecked")
			List<CrmInfo> list=query.list();
			
			tx.commit();
			
			if (!list.isEmpty()) {
				return list.get(0);
			}
			
			
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
		return null;
	}

	@Override
	public List<CrmInfo> getAll() {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CrmInfo");
			List<CrmInfo> list=query.list();
			
			tx.commit();
			
			return list;
			
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
		return null;
	}

	@Override
	public List<Object> getAllName() {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("select crmName from CrmInfo");
			
			List<Object> list=query.list();
			
			tx.commit();
			
			if (!list.isEmpty()) {
				return list;
			}
			
			
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
		return null;
	}

	@Override
	public int getNum() {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("select count(crmId) from CrmInfo");
			
			Object obj=query.uniqueResult();
			
			tx.commit();
			
			Long val=(Long) obj;
			int valx=val.intValue();
			
				return valx;
			
			
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
		return 0;
	}

}
