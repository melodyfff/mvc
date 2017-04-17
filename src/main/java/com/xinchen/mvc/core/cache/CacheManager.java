package com.xinchen.mvc.core.cache;

import net.sf.ehcache.Cache;
public interface CacheManager {
	/**
	 * 获取指定Cache中指定key的对象，如果名称为空，返回采用缺省 cache中对象，缺省cache名为"TJF.CACHE.DEFAULT"
	 *
	 * @param cacheName String
	 * @param key String
	 * @return Object 指定key的对象
	 */
	Object get(String cacheName, String key);

	/**
	 * 把value对象，以key为关键字放到指定名称的cache中。如果名称为空，放到缺省
	 * cache中，缺省cache名为"TJF.CACHE.DEFAULT"
	 *
	 * @param cacheName String
	 * @param key String
	 * @param value Object
	 */
	void put(String cacheName, String key, Object value);

	/**
	 * 清空指定cache中所有数据，如果名称为空，清空缺省 cache中所有数据，缺省cache名为"TJF.CACHE.DEFAULT"
	 *
	 * @param cacheName String
	 */
	void removeAll(String cacheName);

	/**
	 * 清空指定cache中指定关键字的数据，如果名称为空，清空缺省 cache中指定数据，缺省cache名为"TJF.CACHE.DEFAULT"
	 *
	 * @param cacheName String
	 * @param key String
	 */
	void remove(String cacheName, String key);


	/**
	 * 功能描述: 添加说明
	 * @param name String
 Exception
	 * @return Cache Cache
	 */
	Cache getCacheByName(String name);
}