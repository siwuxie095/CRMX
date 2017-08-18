package com.crm.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.crm.dao.CrmPwdxDao;
import com.crm.entity.extd.CrmPwdx;
import com.crm.utils.HibernateUtils;

public class CrmPwdxDaoImpl implements CrmPwdxDao {

	@Override
	public void save(CrmPwdx crmPwdx) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.save(crmPwdx);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	
	@Override
	public void delete(CrmPwdx crmPwdx) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.delete(crmPwdx);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	
	@Override
	public void deleteMul(CrmPwdx[] crmPwdx) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			for (CrmPwdx crmPwdx2 : crmPwdx) {
				session.delete(crmPwdx2);
			}

			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
	}

	
	@Override
	public void update(CrmPwdx crmPwdx) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.update(crmPwdx);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
	}

	
	@Override
	public boolean check(CrmPwdx crmPwdx) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			
			Query query=session.createQuery("from CrmPwdx where crmId=?");
			
			query.setParameter(0, crmPwdx.getCrmId());
			
			Object obj=query.uniqueResult();
			
			tx.commit();
			
			if (obj!=null) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			session.close();
		}
		
		return false;
	}

	
	@Override
	public boolean checkx(CrmPwdx crmPwdx) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CrmPwdx where crmId=? and crmPwd=?");
			
			query.setParameter(0, crmPwdx.getCrmId());
			query.setParameter(1, crmPwdx.getCrmPwd());
			
			Object obj=query.uniqueResult();
			
			
			tx.commit();
			
			if (obj!=null) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			session.close();
		}
		
		return false;
	}

	
	@Override
	public CrmPwdx get(CrmPwdx crmPwdx) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CrmPwdx where crmId=?");
			
			query.setParameter(0, crmPwdx.getCrmId());
			
			Object obj=query.uniqueResult();
			
			tx.commit();
			
			return (CrmPwdx) obj;
			
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			session.close();
		}
		
		return null;
	}

	
	@Override
	public List<CrmPwdx> getAll() {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CrmPwdx");
			
			@SuppressWarnings("unchecked")
			List<CrmPwdx> list=query.list();
			
			tx.commit();
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			session.close();
		}
		
		return null;
	}


	
	
	
}
