package com.design.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 * 通用的数据操作类
 * 
 * 
 * 
 */
public class BaseDAO {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/**
	 * 保存对象
	 * 
	 * @param entity
	 */
	public void saveObject(Object entity) throws Exception {
		sessionFactory.getCurrentSession().save(entity);
	}

	/**
	 * 删除对象
	 * 
	 * @param entityClass
	 * @param entityId
	 */
	public void deleteObject(Class<?> entityClass, Serializable entityId)
			throws Exception {
		Session session = sessionFactory.getCurrentSession();
		session.delete(session.load(entityClass, entityId));
	}

	/**
	 * 根据主键查询
	 * 
	 * @param entityClass
	 * @param entityId
	 * @return
	 */
	public Object findObjectById(Class<?> entityClass, Serializable entityId) {
		Session session = sessionFactory.getCurrentSession();
		session.clear();
		Transaction tran = session.beginTransaction();
		Object object = session.get(entityClass, entityId);
		tran.commit();
		//session.close();
		return object;
	}

	/**
	 * 更新对象
	 * 
	 * @param entity
	 */
	public void updateObject(Object entity) throws Exception {
		Session updateSession = sessionFactory.openSession();
		Transaction updateTS = updateSession.beginTransaction();
		updateSession.update(entity);
		updateTS.commit();
		updateSession.close();
	}

	/**
	 * 根据HQL语句更新对象
	 * 
	 * @param hql
	 *            更新语句
	 * @param values
	 *            条件数组
	 * @return
	 */
	public boolean updateObjectByHql(String hql, Object[] values) throws Exception {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		if (values != null) {
			int j = values.length;
			for (int i = 0; i < j; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return query.executeUpdate()>0;
	}

	/**
	 * 根据HQL语句查询对象
	 * 
	 * @param hql
	 *            查询语句
	 * @param values
	 *            条件数组
	 * @return
	 */
	public List<?> findObjectByHql(String hql, Object[] values) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		if (values != null) {
			int j = values.length;
			for (int i = 0; i < j; i++) {
				query.setParameter(i, values[i]);
			}
		}
		session.clear();
		Transaction tran = session.beginTransaction();
		List<?> list = query.list();
		tran.commit();
		session.close();;
		return list;
	}
	
	
	/**
	 * 根据sql查询
	 * 
	 * @param sql
	 * @return
	 */
	public List<?> findObjectBySQL(String sql) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery(sql);
		session.clear();
		Transaction tran = session.beginTransaction();
		List<?> list = query.list();
		tran.commit();
		//session.close();
		return list;
	}

	/**
	 * 查询单一结果
	 * 
	 * @param hql
	 *            查询语句
	 * @param values
	 *            条件数组
	 * @return
	 */
	public Object getSingletonResult(String hql, Object[] values) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		if (values != null) {
			int j = values.length;
			for (int i = 0; i < j; i++) {
				System.out.println(values[i]);
				query.setParameter(i, values[i]);
			}
		}
		session.clear();
		Transaction tran = session.beginTransaction();
		Object object = query.uniqueResult();
		tran.commit();
		//session.close();
		return object;
	}
	
	/**
	 * 查询单一结果--模糊查询
	 * 
	 * @param hql
	 *            查询语句
	 * @param values
	 *            条件数组
	 * @return
	 */
	public Object getSingletonResultVague(String hql, Object[] values) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		if (values != null) {
			int j = values.length;
			for (int i = 0; i < j; i++) {
				System.out.println(values[i]);
				query.setParameter(i, "%" +values[i]+ "%");
			}
		}
		session.clear();
		Transaction tran = session.beginTransaction();
		Object object = query.uniqueResult();
		tran.commit();
		//session.close();
		return object;
	}

	
	
	
	/**
	 * 分页查询
	 * 
	 * @param hql
	 *            查询语句
	 * @param offset
	 *            从哪一行开始查询
	 * @param pageSize
	 *            查询多少行
	 * @param values
	 *            条件数组
	 * @param vague 
	 * 			     是否模糊查询           
	 * @return
	 */
	public List<?> findObjectByPage(String hql, int offset, int pageSize,
			Object[] values, boolean vague) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		if (values != null && vague == false) {
			int j = values.length;
			for (int i = 0; i < j; i++) {
				query.setParameter(i, values[i]);
			}
		}
		if (values != null && vague == true) {
			int j = values.length;
			for (int i = 0; i < j; i++) {
				query.setParameter(i, "%" +values[i]+ "%");
			}
		}
		query.setFirstResult(offset);
		query.setMaxResults(pageSize);
		session.clear();
		Transaction tran = session.beginTransaction();
		List<?> list = query.list();
		tran.commit();
		//session.close();
		return list;
	}
	
	
	
	
}