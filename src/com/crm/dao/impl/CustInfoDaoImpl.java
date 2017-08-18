package com.crm.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.crm.dao.CustInfoDao;
import com.crm.entity.extd.CustInfo;
import com.crm.utils.HibernateUtils;

public class CustInfoDaoImpl implements CustInfoDao {

	@Override
	public void save(CustInfo custInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.save(custInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public void delete(CustInfo custInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.delete(custInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public void deleteMul(CustInfo[] custInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			for (CustInfo custInfo2 : custInfo) {
				session.delete(custInfo2);
			}
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public void update(CustInfo custInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			session.update(custInfo);
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
	}
	
	@Override
	public boolean check(CustInfo custInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CustInfo where custName=?");
			
			query.setParameter(0, custInfo.getCustName());
			
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
	public List<CustInfo> getFuzzyById(CustInfo custInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CustInfo where custId like ?");
			
			query.setParameter(0, "%"+custInfo.getCustId()+"%");
			
			List<CustInfo> list=query.list();
			
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
	public List<CustInfo> getFuzzyByName(CustInfo custInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CustInfo where custName like ?");
			
			query.setParameter(0, "%"+custInfo.getCustName()+"%");
			
			List<CustInfo> list=query.list();
			
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
	public CustInfo getDtlById(CustInfo custInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CustInfo where custId=?");
			
			query.setParameter(0, custInfo.getCustId());
			
			Object obj=query.uniqueResult();
			
			tx.commit();
			
			return (CustInfo) obj;
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		
		return null;
	}

	@Override
	public CustInfo getDtlByName(CustInfo custInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CustInfo where custName=?");
			
			query.setParameter(0, custInfo.getCustName());
			
			Object obj=query.uniqueResult();
			
			tx.commit();
			
			return (CustInfo) obj;
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<CustInfo> getByStatus(CustInfo custInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CustInfo where custStatus=?");
			
			query.setParameter(0, custInfo.getCustStatus());
			
			List<CustInfo> list=query.list();
			
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
	public List<CustInfo> getByType(CustInfo custInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CustInfo where custType=?");
			
			query.setParameter(0, custInfo.getCustType());
			
			List<CustInfo> list=query.list();
			
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
	public List<CustInfo> getByLvl(CustInfo custInfo) {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CustInfo where custLvl=?");
			
			query.setParameter(0, custInfo.getCustLvl());
			
			List<CustInfo> list=query.list();
			
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
	public List<CustInfo> getAll() {
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try {
			
			sessionFactory = HibernateUtils.getSessionFactory();
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			
			Query query=session.createQuery("from CustInfo");
			
			List<CustInfo> list=query.list();
			
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
			
			Query query=session.createQuery("select custId from CustInfo");
			
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
			
			Query query=session.createQuery("select custName from CustInfo");
			
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
			
			Query query=session.createQuery("select count(custId) from CustInfo");
			
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
