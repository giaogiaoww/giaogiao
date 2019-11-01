package com.wyj.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.wyj.dao.HouseDao;
import com.wyj.pojo.House;

@Service
public class HouseServiceImpl {
	@Autowired
	@Qualifier("houseDao")
	private HouseDao hd;
	
	
	
	public HouseDao getHd() {
		return hd;
	}

	public void setHd(HouseDao hd) {
		this.hd = hd;
	}

	public Page<Object> load(Map<String,Object> map){
		Page<Object> startPage = PageHelper.startPage(map==null?1:map.get("index")==null?1:Integer.valueOf(map.get("index").toString()), 7);
		
		hd.load(map);
		return startPage;
	}
	
	public House details(int hid) {
		return hd.details(hid);
	}
	
	public boolean fabu(House h) {
		return hd.fabu(h)>0?true:false;
	}
	
	public boolean update(House h) {
		return hd.update(h)>0?true:false;
	}
	
	public boolean delete(int hid) {
		return hd.delete(hid)>0?true:false;
	}
}
