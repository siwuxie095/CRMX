package com.crm.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.crm.dao.CtcInfoDao;
import com.crm.entity.extd.CtcInfo;
import com.crm.utils.HibernateUtils;

public class CtcInfoDaoImpl implements CtcInfoDao {

	@Override
	public void save(CtcInfo ctcInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.save(ctcInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void delete(CtcInfo ctcInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.delete(ctcInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void deleteMul(CtcInfo[] ctcInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			for (CtcInfo ctcInfo2 : ctcInfo) {
				session.delete(ctcInfo2);
			}
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void update(CtcInfo ctcInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.update(ctcInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public boolean check(CtcInfo ctcInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CtcInfo where custName=?");
			
			query.setParameter(0, ctcInfo.getCustName());
			
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
	public List<CtcInfo> getFuzzyById(CtcInfo ctcInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CtcInfo where ctcId like ?");
			
			query.setParameter(0, "%"+ctcInfo.getCtcId()+"%");
			
			List<CtcInfo> list=query.list();
			
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
	public List<CtcInfo> getFuzzyByName(CtcInfo ctcInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CtcInfo where ctcName like ?");
			
			query.setParameter(0, "%"+ctcInfo.getCtcName()+"%");
			
			List<CtcInfo> list=query.list();
			
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
	public CtcInfo getDtlById(CtcInfo ctcInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CtcInfo where ctcId=?");
			
			query.setParameter(0, ctcInfo.getCtcId());
			
			Object obj=query.uniqueResult();
			
			tx.commit();
			
			return (CtcInfo) obj;
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public CtcInfo getDtlByName(CtcInfo ctcInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CtcInfo where ctcName=?");
			
			query.setParameter(0, ctcInfo.getCtcName());
			
			Object obj=query.uniqueResult();
			
			tx.commit();
			
			return (CtcInfo) obj;
			
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<CtcInfo> getAll() {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CtcInfo");
			
			List<CtcInfo> list=query.list();
			
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
			
			Query query=session.createQuery("select ctcId from CtcInfo");
			
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
	public List<Object> getAllName() {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("select ctcName from CtcInfo");
			
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
			
			Query query=session.createQuery("select count(ctcId) from CtcInfo");
			
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
