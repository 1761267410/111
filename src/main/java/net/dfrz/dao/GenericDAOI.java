package net.dfrz.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface GenericDAOI<Obj, Id extends Serializable> {
	int ADD = 1;
	int DEL = 2;
	int UPT = 3;

	public boolean addObj(Obj obj) throws Exception;

	public boolean delObj(Id id) throws Exception;

	public int delObjs(String hql, Map<String, List<Object>> map) throws Exception;

	public boolean uptObj(Obj obj) throws Exception;

	public Obj getObjById(Id id) throws Exception;

	// 带分页的getObjs
	public List<Obj> getObjs(String hql, Map<String, Object> params, int pageNO, int pageSize) throws Exception;

	// 不带分页的getObjs
	public List<Obj> getObjs(String hql, Map<String, Object> params) throws Exception;

}
