package com.wyj.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.wyj.pojo.House;

@Component
public interface HouseDao {
	public List<House> load(Map<String,Object> map);
	
	public House details(int hid);
	
	public int fabu(House h);
	
	public int update(House h);
	
	public int delete(int hid);
}
