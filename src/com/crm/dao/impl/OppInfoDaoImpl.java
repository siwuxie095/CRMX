package com.crm.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.crm.dao.OppInfoDao;
import com.crm.entity.extd.OppInfo;
import com.crm.utils.HibernateUtils;

public class OppInfoDaoImpl implements OppInfoDao {

	@Override
	public void save(OppInfo oppInfo) {
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.save(oppInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void delete(OppInfo oppInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.delete(oppInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void deleteMul(OppInfo[] oppInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			for (OppInfo oppInfo2 : oppInfo) {
				session.delete(oppInfo2);
			}
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void update(OppInfo oppInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.update(oppInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public boolean check(OppInfo oppInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CtcInfo where custName=? and ctcName=?");
			
			query.setParameter(0, oppInfo.getCustName());
			query.setParameter(1, oppInfo.getCtcName());

			Object obj=query.uniqueResult();
			
			tx.commit();
			
			if (obj!=null) {
				return true;
			}
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public OppInfo getDtlById(OppInfo oppInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from OppInfo where oppId=?");
			
			query.setParameter(0, oppInfo.getOppId());

			Object obj=query.uniqueResult();
			
			tx.commit();
			
			return (OppInfo) obj;
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public OppInfo getDtlByName(OppInfo oppInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from OppInfo where oppName=?");
			
			query.setParameter(0, oppInfo.getOppName());

			Object obj=query.uniqueResult();
			
			tx.commit();
			
			return (OppInfo) obj;
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<OppInfo> getAll() {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from OppInfo");
			
			List<OppInfo> list=query.list();
			
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
	public List<Object> getAllId() {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("select oppId from OppInfo");
			
			List<Object> list=query.list();
			
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
	public int getNum() {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("select count(oppId) from OppInfo");
			
			
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

	@Override
	public List<OppInfo> getAllByName(OppInfo oppInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from OppInfo where crmName=?");
			
			query.setParameter(0, oppInfo.getCrmName());
			
			List<OppInfo> list=query.list();
			
			tx.commit();
			
			return list;
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		return null;
	}

}
