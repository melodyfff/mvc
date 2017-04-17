package com.xinchen.mvc.core.cache;

import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("defaultCacheManager")
public class EhcacheManagerImpl implements CacheManager {

	private static final Log LOG = LogFactory.getLog(EhcacheManagerImpl.class);

	private transient net.sf.ehcache.CacheManager ehCacheManager;

	/**
	 * @param ehCacheManager ehCacheManager
	 */
//	@Resource(name = "cacheManager")
	public void setEhCacheManager(net.sf.ehcache.CacheManager ehCacheManager) {
		this.ehCacheManager = ehCacheManager;
	}

	/**
	 * 获取指定Cache中指定key的对象，如果名称为空，返回采用缺省 cache中对象，缺省cache名为"TJF.CACHE.DEFAULT"
	 *
	 * @param cacheName String
	 * @param key String
	 * @return Object 指定key的对象
	 */
	@Override
	public Object get(String cacheName, String key){
			Element element = getCacheByName(cacheName).get(key);
			if (element != null) {
				return element.getObjectValue();
			}
		return null;
	}

	/**
	 * 把value对象，以key为关键字放到指定名称的cache中。如果名称为空，放到缺省
	 * cache中，缺省cache名为"TJF.CACHE.DEFAULT"
	 *
	 * @param cacheName String
	 * @param key String
	 * @param value Object
	 */
	@Override
	public void put(String cacheName, String key, Object value){
			Element element = new Element(key, value);
			this.getCacheByName(cacheName).put(element);
	}

	/**
	 * 清空指定cache中指定关键字的数据，如果名称为空，清空缺省 cache中指定数据，缺省cache名为"TJF.CACHE.DEFAULT"
	 *
	 * @param cacheName String
	 * @param key String
	 */
	@Override
	public void remove(String cacheName, String key){
			this.getCacheByName(cacheName).remove(key);
	}

	/**
	 * 清空指定cache中所有数据，如果名称为空，清空缺省 cache中所有数据，缺省cache名为"TJF.CACHE.DEFAULT"
	 *
	 * @param cacheName String
	 */
	@Override
	public void removeAll(String cacheName){
			this.getCacheByName(cacheName).removeAll();


	}

	/**
	 * 获取指定名称的cache，如果名称为空，返回采用缺省配置的 cache
	 *
	 * @param name String
	 * @return Cache 指定名称的cache
	 */
	@Override
	public Cache getCacheByName(String name){
		if (name != null) {

			if (ehCacheManager.getCache(name) == null) {
				ehCacheManager.addCache(name);
			}
			return ehCacheManager.getCache(name);
		} else {

		    // 获取缺省的cache
			if (ehCacheManager.getCache("UserCache") == null) {
				ehCacheManager.addCache("UserCache");
			}
			return ehCacheManager.getCache("UserCache");

		}
	}

}
