package net.dfrz.dao;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.persistence.Id;

import org.hibernate.Criteria;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

public abstract class BaseDao<T, ID extends Serializable> {
	@SuppressWarnings("unchecked")
	public BaseDao() {
		/**
		 * 获取当前Class为泛型超类的第一个类型参
		 */
		this.entity = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * 持久化对象的实际类型
	 */
	private Class<T> entity;

	/**
	 * @return 一个实体类
	 */
	public Class<T> getEntity() {
		return entity;
	}

	/**
	 * @return sessionFactory
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	protected Session getSession() {
		return this.getSessionFactory().getCurrentSession();
	}

	@SuppressWarnings("unchecked")
	public T findById(ID id) {
		return (T) this.getSession().get(entity, id);
	}

	@SuppressWarnings("unchecked")
	public T findById(Class<?> classZ, ID id) {
		return (T) this.getSession().get(classZ, id);
	}

	/**
	 * 悲观锁 :对数据被外界（包括本系统当前的其它事务和来自外部系统的事务处理）修改持保守态度
	 * 
	 * @param id
	 * @param lock
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public T findById(ID id, boolean lock) {
		if (lock) {
			return (T) this.getSession().get(entity, id, LockOptions.UPGRADE);
		} else {
			return findById(id);
		}
	}

	/**
	 * 查询全部数据 ：转化sql为：select * form table
	 * 
	 * @return 该表的全部数据
	 */
	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		String queryString = "from " + entity.getSimpleName();
		Query queryObject = getSession().createQuery(queryString);
		List<T> results = (List<T>) queryObject.list();
		return results;
	}

	/**
	 * 根据实体删除
	 * 
	 * @param entity
	 */
	public void delete(T entity) {
		this.getSession().delete(entity);
	}

	/**
	 * 
	 * 根据形如 delete from f_flow where flowId in(:flowId)的hql
	 * 和"id,id,id....,id"Map类型的Id参数来批量删除
	 * 
	 * @param hql
	 * @param map
	 * @return
	 * @throws Exception
	 */

	public int delete(String hql, Map<String, List<Object>> map) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery(hql);
		if (map != null && map.size() > 0) {
			for (Map.Entry<String, List<Object>> entry : map.entrySet()) {
				query.setParameterList(entry.getKey(), entry.getValue());
			}
		}
		return query.executeUpdate();
	}

	/**
	 * 根据主键删除实体
	 * 
	 * @param id
	 */
	public void deleteById(ID id) {
		T entity = this.findById(id);
		if (entity != null) {
			this.delete(entity);
		}
	}

	/**
	 * 保存实体
	 * 
	 * @param entity
	 * @return 保存对象
	 */
	public T save(T entity) {
		this.getSession().save(entity);
		return entity;
	}

	/**
	 * 更新实体
	 * 
	 * @param entity
	 * @return
	 */
	public T update(T entity) {
		this.getSession().update(entity);
		return entity;
	}

	/**
	 * 通过ID和不为空的字段更新数
	 * 
	 * @param id
	 *            主键数据
	 * @param entity
	 *            待更新的不为空的字段
	 * @return 原数
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	@SuppressWarnings("unchecked")
	public T updateNotNull(ID id, T entity) throws IllegalArgumentException, IllegalAccessException {
		T old = (T) getSession().get(entity.getClass(), id);
		for (Field field : entity.getClass().getDeclaredFields()) {
			if (field.getDeclaredAnnotations().length < 1) {
				continue;
			}
			field.setAccessible(true);
			Object value = field.get(entity);
			if (value == null) {
				continue;
			}
			// 忽略主键赋值
			if (field.getAnnotation(Id.class) != null) {
				continue;
			}
			field.set(old, value);
		}
		getSession().update(old);
		return old;
	}

	/**
	 * 如有主键则更新，如果主键为null则保存
	 * 
	 * @param entity
	 * @return 保存实体
	 */
	public T saveOrUpdate(T entity) {
		this.getSession().saveOrUpdate(entity);
		return entity;
	}

	/**
	 * 根据属值查询对
	 * 
	 * @param propName
	 * @param propValue
	 */
	@SuppressWarnings("unchecked")
	public List<T> findByProperty(String propName, Object propValue) {
		Assert.hasText(propName, propName + "=" + propValue);
		DetachedCriteria dc = DetachedCriteria.forClass(getEntity());
		dc.add(Restrictions.eq(propName, propValue));
		Criteria criteria = dc.getExecutableCriteria(getSession());
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	public List<T> findByProperty(String[] propNames, Object[] propvalues) {
		Assert.notNull(propvalues, "propvalues is null");
		Assert.notNull(propNames, "propNames is null");
		int i = 0;
		DetachedCriteria dc = DetachedCriteria.forClass(getEntity());
		for (String propName : propNames) {
			if (propName != null) {
				if (propvalues.length > i)
					dc.add(Restrictions.eq(propName, propvalues[i]));
				else {
					System.out.println("propNames are more than propValues' size!");
					break;
				}
			}
			i++;
		}
		Criteria criteria = dc.getExecutableCriteria(getSession());
		return criteria.list();
	}

	/**
	 * hql语句查询
	 * 
	 * @param hql
	 * @param values
	 * @return
	 */
	protected Query createQuery(String hql, Object... values) {
		Assert.hasText(hql, "hql is null");
		Query query = this.getSession().createQuery(hql);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return query;
	}

	/**
	 * HQL单一查询，例如select count(*)/sum(property) from ...
	 */
	protected Object findUnique(final String hql, final Object... values) {
		return createQuery(hql, values).uniqueResult();
	}

	/**
	 * 执行count查询获得本次Hql查询结构 只能处理简单的hql语句<br>
	 * 不支持union等复杂的hql查询 复杂的查询语句请通过建立视图或重构数据库设计解决<br>
	 * 
	 * @param hql
	 * @param values
	 * @return 查询列数
	 */
	public Integer countHqlResult(final String hql, final Object... values) {
		// 剔除语句中select部分和order by部分
		String s = hql.toUpperCase();
		int i = s.indexOf("FROM ");
		if (i > -1) {
			i = i + 5;
		} else {
			i = 0;
		}
		int j = s.indexOf(" ORDER BY");
		if (j == -1) {
			j = s.length();
		}
		s = hql.substring(i, j);
		// 拼装成select count(*)语句
		String countHql = "SELECT COUNT(*) FROM " + s;
		Long count = (Long) findUnique(countHql, values);
		return count == null ? 0 : count.intValue();
	}

	/**
	 * HQL查询，支持变参列查询
	 * 
	 * @param hql
	 * @param values
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> find(final String hql, final Object... values) {
		Query query = this.createQuery(hql, values);
		return query.list();
	}

	/**
	 * limt 查询
	 * 
	 * @param hql
	 * @param startIndex
	 * @param pageSize
	 * @param values
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> findList(final String hql, final int startIndex, final int pageSize, final Object... values) {
		Query query = createQuery(hql, values);
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);
		return query.list();
	}

	/**
	 * 通过条件对象返回对象列表
	 * 
	 * @param instance字段不为空的都视为条件
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> find(T instance) {
		Criteria criteria = getSession().createCriteria(instance.getClass());
		criteria.add(Example.create(instance));
		List<T> list = (List<T>) criteria.list();
		return list;
	}

	/**
	 * 处理范围类的扩展条件<br>
	 * 
	 * @param criteria
	 *            条件集合
	 * @param conditions
	 *            外部条件
	 * @param field
	 *            字段
	 */
	@SuppressWarnings("unused")
	private void addContintion(Criteria criteria, Map<String, Object> conditions, Field field) {
		Object value = null;
		String key = field.getName() + "_begin";
		if (conditions.containsKey(key)) {
			value = conditions.get(key);
			criteria.add(Restrictions.ge(field.getName(), value));
		}
		key = field.getName() + "_end";
		if (conditions.containsKey(key)) {
			value = conditions.get(key);
			criteria.add(Restrictions.lt(field.getName(), value));
		}

		key = field.getName() + "_in";
		if (conditions.containsKey(key)) {
			value = conditions.get(key);
			Object[] list = (Object[]) value;
			criteria.add(Restrictions.in(field.getName(), list));
		}
	}

	/**
	 * 执行HQL语句，限用于批量修改/删除操作
	 * 
	 * @param hql
	 * @param values
	 * @return 返回删除/更新记录数
	 */
	protected int excute(final String hql, final Object... values) {
		Query query = createQuery(hql, values);
		return query.executeUpdate();
	}

	// =================================================sql查询============================================//

	/**
	 * 以下新增支持sql原生查询
	 * 
	 * @param sql
	 * @param values
	 *            变参条件
	 * @return 查询结构
	 */
	protected SQLQuery createSQLQuery(String sql, Object... values) {
		SQLQuery query = this.getSession().createSQLQuery(sql);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				Object value = values[i];
				// query.setParameter(i, values[i]);
				if (value instanceof Array) {
					query.setParameterList("list", (Object[]) value);

				} else if (value instanceof Collection) {
					query.setParameterList("list", (Collection<?>) value);

				} else {
					query.setParameter(i, value);
				}
			}
		}
		return query;
	}

	/**
	 * SQL单一查询，例如select count(*)/sum(property) from ...
	 */
	protected Object findUniqueBySql(final String sql, final Object... values) {
		return createSQLQuery(sql, values).uniqueResult();
	}

	/**
	 * count查询获得本次sql查询获得的对象
	 * 
	 * @param sql
	 * @param values
	 * @return
	 */
	protected Integer countSqlResult(final String sql, final Object... values) {
		// 剔除语句中select部分和order by部分
		String s = sql.toUpperCase();
		String countSql = "";
		int count = 0;
		try {
			int j = s.indexOf(" ORDER BY");
			if (j > -1) {
				countSql = sql.substring(0, j);
			} else {
				countSql = sql;
			}
			countSql = "SELECT COUNT(*) FROM (" + countSql + ") as javacsru";
			count = Integer.parseInt(findUniqueBySql(countSql, values).toString());
		} catch (Exception e) {
		}
		return count == 0 ? 0 : count;
	}

	/**
	 * groupBy sql查询 cutFromCountSqlResult:(除去from前面的select，直接条件查拼接sql). <br/>
	 * 
	 * @param sql
	 * @param values
	 * @return
	 */
	protected int cutFromCountGroupBySqlResult(final String sql, final Object... values) {
		// 剔除语句中select部分和GROUP by部分
		String s = sql.toUpperCase();
		String countSql = "";
		int count = 0;
		try {
			int j = s.indexOf(" FROM ");
			if (j > -1) {
				countSql = sql.substring(j, s.length());
			} else {
				countSql = sql;
			}
			int z = countSql.indexOf(" GROUP BY");
			if (z > -1) {
				countSql = countSql.substring(0, z);
			}
			countSql = "SELECT COUNT(*)  " + countSql;
			count = Integer.parseInt(findUniqueBySql(countSql, values).toString());
		} catch (Exception e) {
		}
		return count == 0 ? 0 : count;
	}

	/**
	 * orderby查询条数
	 * 
	 * @param sql
	 * @param values
	 * @return
	 */
	protected int cutFromCountOrderBySqlResult(final String sql, final Object... values) {
		// 剔除语句中select部分和GROUP by部分
		String s = sql;
		String countSql = "";
		int count = 0;
		try {
			int j = s.indexOf(" FROM ");
			if (j > -1) {
				countSql = sql.substring(j, s.length());
			} else {
				countSql = sql;
			}
			int z = countSql.indexOf(" ORDER BY");
			if (z > -1) {
				countSql = countSql.substring(0, z);
			}
			countSql = "SELECT COUNT(*)  " + countSql;
			count = Integer.parseInt(findUniqueBySql(countSql, values).toString());
		} catch (Exception e) {
		}
		return count == 0 ? 0 : count;
	}

	/**
	 * count查询获得本次sql查询获得的对象
	 * 
	 * @param sql
	 * @param values
	 * @return
	 */
	protected int countSqlFitOrder(final String sql, final Object... values) {
		String countSql = "";
		int count = 0;
		try {
			countSql = sql;
			countSql = "SELECT COUNT(*) FROM (" + countSql + ") as javacsru";
			count = Integer.parseInt(findUniqueBySql(countSql, values).toString());
		} catch (Exception e) {
		}
		return count == 0 ? 0 : count;
	}

	/**
	 * SQL查询 ，支持变参列
	 */
	@SuppressWarnings("unchecked")
	public List<T> findBySql(final String sql, final Object... values) {
		SQLQuery query = createSQLQuery(sql, values).addEntity(entity);
		return query.list();
	}

	/**
	 * 原生sql分页查询
	 * 
	 * @param sql
	 * @param startIndex
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> findBySql(final String sql, final int startIndex, final int pageSize, final Object... values) {
		// 查分页数据，先创建分页对象是为了对startIndex和pageSize进行容错处理
		SQLQuery query = createSQLQuery(sql, values).addEntity(entity);
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);
		List<T> list = query.list();
		return list;
	}

	/**
	 * 变参查询并封装成一个map 当我们不加这个方法时，查出来的list是一个没有跟字段对应，即["a","b","c"]，<br>
	 * 如果加上setResultTransformer这个方法，<br>
	 * list里面的元素就会成为一个跟数据库字段对应的数据集[a:"a",b:"b"]<br>
	 * 所以查出来是个一条纪录（元祖）是一个map对象
	 * 
	 * @param sql
	 * @param values
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findMaps(String sql, Object... values) {
		SQLQuery query = createSQLQuery(sql, values);
		// 这个不懂去百度下Transformers.ALIAS_TO_ENTITY_MAP
		query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		List<Map<String, Object>> list = (List<Map<String, Object>>) query.list();
		return list;
	}

	/**
	 * 变参查询并封装成一个map并执行 groupBy查询当 当我们不加这个方法时，查出来的list是一个没有跟字段对应，即["a","b","c"]，
	 * <br>
	 * 如果加上setResultTransformer这个方法，<br>
	 * list里面的元素就会成为一个跟数据库字段对应的数据集[a:"a",b:"b"]<br>
	 * 所以查出来是个一条纪录（元祖）是一个map对象
	 *
	 * @param sql
	 * @param startIndex
	 * @param pageSize
	 * @param values
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findCutFromGroupByMaps(String sql, final int startIndex, final int pageSize,
			Object... values) {
		SQLQuery query = createSQLQuery(sql, values);
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);
		// 这个不懂去百度下Transformers.ALIAS_TO_ENTITY_MAP
		query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		List<Map<String, Object>> list = (List<Map<String, Object>>) query.list();
		return list;
	}

	/**
	 * 变参查询并封装成一个map并执行OrderBy查询 当我们不加这个方法时，查出来的list是一个没有跟字段对应，即["a","b","c"]，
	 * <br>
	 * 如果加上setResultTransformer这个方法，<br>
	 * list里面的元素就会成为一个跟数据库字段对应的数据集[a:"a",b:"b"]<br>
	 * 所以查出来是个一条纪录（元祖）是一个map对象
	 *
	 * @param sql
	 * @param startIndex
	 * @param pageSize
	 * @param values
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findCutFromOrderByMaps(String sql, final int startIndex, final int pageSize,
			Object... values) {
		SQLQuery query = createSQLQuery(sql, values);
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);
		// 这个不懂去百度下Transformers.ALIAS_TO_ENTITY_MAP
		query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		List<Map<String, Object>> list = (List<Map<String, Object>>) query.list();
		return list;
	}

	/**
	 * 执行SQL语句，限用于批量修改/删除操作
	 * 
	 * @param SQL
	 * @param values
	 * @return 返回删除/更新记录
	 */
	public int excuteBySql(final String sql, final Object... values) {
		SQLQuery query = createSQLQuery(sql, values);
		return query.executeUpdate();
	}

}
