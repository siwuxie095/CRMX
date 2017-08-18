package com.crm.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.crm.dao.OfrInfoDao;
import com.crm.entity.extd.OfrInfo;
import com.crm.utils.HibernateUtils;

public class OfrInfoDaoImpl implements OfrInfoDao {

	@Override
	public void save(OfrInfo ofrInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.save(ofrInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void delete(OfrInfo ofrInfo) {

		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.delete(ofrInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void deleteMul(OfrInfo[] ofrInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			for (OfrInfo ofrInfo2 : ofrInfo) {
				session.delete(ofrInfo2);
			}
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void update(OfrInfo ofrInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.update(ofrInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public boolean check(OfrInfo ofrInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from OppInfo where custName=? and ctcName=? and oppId=?");
			
			query.setParameter(0, ofrInfo.getCustName());
			query.setParameter(1, ofrInfo.getCtcName());
			query.setParameter(2, ofrInfo.getOppId());
			
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
	public OfrInfo getDtlById(OfrInfo ofrInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from OfrInfo where ofrId=?");
			
			query.setParameter(0, ofrInfo.getOfrId());
			
			Object obj=query.uniqueResult();
			
			tx.commit();
			
			return (OfrInfo) obj;
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public OfrInfo getDtlByName(OfrInfo ofrInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from OfrInfo where ofrName=?");
			
			query.setParameter(0, ofrInfo.getOfrName());
			
			Object obj=query.uniqueResult();
			
			tx.commit();
			
			return (OfrInfo) obj;
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<OfrInfo> getAll() {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from OfrInfo");
			
			List<OfrInfo> list=query.list();
			
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
			
			Query query=session.createQuery("select ofrId from OfrInfo");
			
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
			
			Query query=session.createQuery("select count(ofrId) from OfrInfo");
			
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
	public List<OfrInfo> getAllByName(OfrInfo ofrInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from OfrInfo where crmName=?");
			
			query.setParameter(0, ofrInfo.getCrmName());
			
			List<OfrInfo> list=query.list();
			
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
