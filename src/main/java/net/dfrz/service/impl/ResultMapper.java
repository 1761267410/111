package net.dfrz.service.impl;

import java.util.HashMap;
import java.util.Map;

public class ResultMapper {

	public static Map<String, Object> success(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
		Object[] objs = { obj };
		map.put("total", 1);
		map.put("rows", objs);
		return map;
	}

	// public static Map<String, Object> success(Object[] obj) {
	// Map<String, Object> map = new HashMap<String, Object>();
	// Object[] objs = obj;
	// map.put("total", objs.length);
	// map.put("rows", objs);
	// return map;
	// }
	//
	// public static Map<String, Object> success(List<Object> obj) {
	// Map<String, Object> map = new HashMap<String, Object>();
	// Object[] objs = obj.toArray();
	// map.put("total", 1);
	// map.put("rows", objs);
	// return map;
	// }
}
