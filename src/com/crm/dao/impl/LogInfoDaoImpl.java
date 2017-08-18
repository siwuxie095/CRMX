package com.crm.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.crm.dao.LogInfoDao;
import com.crm.entity.extd.LogInfo;
import com.crm.utils.HibernateUtils;

public class LogInfoDaoImpl implements LogInfoDao {

	@Override
	public void save(LogInfo logInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.save(logInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void delete(LogInfo logInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.delete(logInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void deleteMul(LogInfo[] logInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			for (LogInfo logInfo2 : logInfo) {
				session.delete(logInfo2);
			}
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void update(LogInfo logInfo) {
	
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.update(logInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public boolean check(LogInfo logInfo) {
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from OppInfo where custName=? and ctcName=? and oppId=? and crmName=?");
			
			query.setParameter(0, logInfo.getCustName());
			query.setParameter(1, logInfo.getCtcName());
			query.setParameter(2, logInfo.getOppId());
			query.setParameter(3, logInfo.getCrmName());
			
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
	public LogInfo getDtlById(LogInfo logInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from LogInfo where logId=?");
			
			query.setParameter(0, logInfo.getLogId());
			
			Object obj=query.uniqueResult();
			
			tx.commit();
			
			
			return (LogInfo) obj;
			
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
		return null;
	}

	@Override
	public LogInfo getDtlByName(LogInfo logInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from LogInfo where logThm=?");
			
			query.setParameter(0, logInfo.getLogThm());
			
			Object obj=query.uniqueResult();
			
			tx.commit();
			
			return (LogInfo) obj;
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<LogInfo> getAll() {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from LogInfo");
			
			List<LogInfo> list=query.list();
			
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
			
			Query query=session.createQuery("select logId from LogInfo");
			
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
			
			Query query=session.createQuery("select count(logId) from LogInfo");
			
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
	public List<LogInfo> getAllByName(LogInfo logInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from LogInfo where crmName=?");
			
			query.setParameter(0, logInfo.getCrmName());
			
			List<LogInfo> list=query.list();
			
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
