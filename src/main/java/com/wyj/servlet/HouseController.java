package com.wyj.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.Page;
import com.wyj.pojo.House;
import com.wyj.pojo.User;
import com.wyj.service.HouseServiceImpl;

@Controller
public class HouseController {

	@Autowired
	private HouseServiceImpl us;

	@RequestMapping("/load")
	public ModelAndView dl(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User u = (User) session.getAttribute("loginUser");
		session.setAttribute("judgeMap", null);
		mv.addObject("house", us.load(null));
		mv.setViewName("index");
		Map<String, List<String>> map = new HashMap<>();
		map.put("长沙县",Arrays.asList(
				"安沙镇 北山镇 长龙街道 春华镇 福临镇 高桥镇 果园镇 黄花镇 黄兴镇 江背镇 金井镇 开慧镇 榔梨街道 路口镇 青山铺镇 泉塘街道 湘龙街道 星沙街道".split(" ")));
		map.put("芙蓉区", Arrays.asList(
				"朝阳街街道 定王台街道 东岸街道 东湖街道 东屯渡街道 荷花园街道 火星街道 韭菜园街道 隆平高科技园 马坡岭街道 马王堆街道 文艺路街道 五里牌街道 湘湖街道".split(" ")));
		map.put("开福区",
				Arrays.asList("东风路街道 芙蓉北路街道 洪山街道 捞刀河街道 浏阳河街道 街道 沙坪街道 通泰街街道 望麓园街道 街道 新河街道 秀峰街道 月湖街道".split(" ")));
		map.put("浏阳市", Arrays.asList(
				"北盛镇 柏加镇 枨冲镇 澄潭江镇 淳口镇 达浒镇 大围山镇 大瑶镇 洞阳镇 高坪镇 葛家乡 古港镇 官渡镇 关口街道 官桥镇 荷花街道 淮川街道 集里街道 蕉溪镇 金刚镇 龙伏镇 普迹镇 沙市镇 社港镇 文家市镇 小河乡 沿溪镇 永安镇 永和镇 张坊镇 镇头镇 中和镇"
						.split(" ")));
		map.put("宁乡市", Arrays.asList(
				"坝塘镇 白马桥乡 城郊街道 大成桥镇 大屯营镇 道林镇 东堂湖镇 横市镇 花明楼镇 黄材镇 回龙铺镇 灰汤镇 金洲镇 菁华铺乡 老粮仓镇 历经铺镇 流沙河镇 龙田镇 煤炭坝镇 青山桥镇 沙田乡 双凫铺镇 双江口镇 沩山乡 夏铎铺镇 巷子口镇 喻家坳乡 玉潭镇 资福镇"
						.split(" ")));
		map.put("天心区", Arrays.asList(
				"城南路街道 赤岭路街道 大托铺街道 桂花坪街道 黑石铺街道 金盆岭街道 暮云街道 南托街道 坡子街街道 青园街道 文源街道 先锋街道 新开铺街道 裕南街街道".split(" ")));
		map.put("望城区", Arrays.asList(
				"白箬铺镇 白沙洲街道 茶亭镇 大泽湖街道 丁字湾街道 高塘岭街道 黄金园街道 金山桥街道 靖港镇 雷锋街道 乔口镇 桥驿镇 铜官街道 乌山街道 月亮岛街道".split(" ")));
		map.put("雨花区", Arrays.asList(
				"洞井街道 东山街道 东塘街道 高桥街道 圭塘街道 侯家塘街道 井湾子街道 黎托街道 砂子塘街道 跳马镇 同升街道 雨花亭街道 长沙雨花经济开发区 左家塘街道".split(" ")));
		map.put("岳麓区", Arrays.asList(
				"观沙岭街道 含浦街道 桔子洲街道 莲花镇 麓谷街道 梅溪湖街道 坪塘街道 天顶街道 望城坡街道 望月湖街道 望岳街道 西湖街道 咸嘉湖街道 学士街道 洋湖街道 银盆岭街道 雨敞坪镇 岳麓街道"
						.split(" ")));
		map.put("不限", new ArrayList<>());
		session.setAttribute("map", map);
		if (u!=null&&u.getAdmin() != null && u.getUid() == u.getAdmin().getUid()) {
			mv.setViewName("guanli");
		}
		
		return mv;
	}

	@PostMapping("/find")
	public ModelAndView find(HttpSession session, @RequestParam Map<String, String> map) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> judgeMap = (Map<String, Object>) session.getAttribute("judgeMap");
		if (judgeMap == null) {
			judgeMap = new HashMap<>();
		}
		judgeMap.put("title", map.get("title"));
		judgeMap.put("qx", map.get("qx").equals("不限") ? null : map.get("qx"));
		judgeMap.put("jd", map.get("jd").equals("不限") ? null : map.get("jd"));
		judgeMap.put("typeid", map.get("typeid").equals("不限") ? null : map.get("typeid"));
		judgeMap.put("price", map.get("price").equals("不限") ? null : map.get("price"));
		judgeMap.put("area", map.get("area").equals("不限") ? null : map.get("area"));
		judgeMap.put("index", 1);
		Page<Object> load = us.load(judgeMap);
		load.setPageNum(1);
		session.setAttribute("judgeMap", judgeMap);
		mv.addObject("house", load);
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping("/fy")
	public ModelAndView fy(String index, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = (Map<String, Object>) session.getAttribute("judgeMap");
		if (map == null) {
			map = new HashMap<>();
		}
		map.put("index", index);
		mv.addObject("house", us.load(map));
		session.setAttribute("judgeMap", map);
		User u = (User) session.getAttribute("loginUser");
		mv.setViewName("index");
		if (u!=null&&u.getAdmin() != null && u.getUid() == u.getAdmin().getUid()) {
			mv.setViewName("guanli");
		}
		return mv;
	}

	@RequestMapping("/details")
	public ModelAndView details(String hid, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("details", us.details(Integer.valueOf(hid)));
		User u = (User) session.getAttribute("loginUser");
		mv.setViewName("details");
		if (u!=null&&u.getAdmin() != null && u.getUid() == u.getAdmin().getUid()) {
			mv.setViewName("update");
		}
		return mv;
	}

	@RequestMapping("/fabu")
	public void fabu(@RequestParam("imgg") MultipartFile[] imggs, HttpServletRequest request,
			@RequestParam Map<String, String> map, HttpServletResponse response) throws IOException {
		House h = new House();
		h.setImg(fileupload(imggs, request));
		h.setTitle(map.get("title"));
		h.setTypeid(Integer.valueOf(map.get("type_id")));
		h.setArea(Integer.valueOf(map.get("floorage")));
		h.setPrice(Double.valueOf(map.get("price")));
		h.setHousedate(Date.valueOf(map.get("houseDate")));
		h.setAddress(map.get("district_id") + map.get("street_id"));
		h.setPhone(map.get("contact"));
		h.setDetailed(map.get("description"));
		int i = 2;
		String mess = "发布失败";
		String url = "fabu.jsp";
		if (us.fabu(h)) {
			i = 1;
			mess = "发布成功";
			url = "load";
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write("<script type='text/javascript' src='scripts/jquery-1.8.3.min.js'></script>");
		out.write("<script type='text/javascript' src='layer/layer.js'></script>");
		out.write("<script>");
		out.write("layer.open({content: '" + mess + "',btn:['了解！'],yes:function(){location.href='" + url
				+ "';layer.closeAll();},icon: " + i + ",skin: 'layui-layer-molv'});");
		out.write("</script>");
	}

	public String fileupload(MultipartFile[] imggs, HttpServletRequest request)
			throws IllegalStateException, IOException {
		String img = "";
		String realPath = request.getSession().getServletContext().getRealPath("/images");
		for (int i = 0; i < imggs.length; i++) {
			if (i != 0) {
				img += ",";
			}
			imggs[i].transferTo(new File(realPath + imggs[i].getOriginalFilename()));
			img += imggs[i].getOriginalFilename();
		}
		return img;
	}

	@RequestMapping("/update")
	public void update(@RequestParam("imgg") MultipartFile[] imggs, HttpServletRequest request,
			@RequestParam Map<String, String> map, HttpServletResponse response, House h1) throws IOException {
		House h = new House();
		h.setHid(h1.getHid());
		h.setImg(fileupload(imggs, request));
		h.setTitle(map.get("title"));
		h.setTypeid(Integer.valueOf(map.get("type_id")));
		h.setArea(Integer.valueOf(map.get("floorage")));
		h.setPrice(Double.valueOf(map.get("price")));
		h.setHousedate(Date.valueOf(map.get("houseDate")));
		h.setAddress(map.get("district_id") + map.get("street_id"));
		h.setPhone(map.get("contact"));
		h.setDetailed(map.get("description"));
		int i = 2;
		String mess = "修改失败";
		String url = "details?hid=" + h1.getHid();
		if (us.update(h)) {
			i = 1;
			mess = "修改成功";
			url = "load";
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write("<script type='text/javascript' src='scripts/jquery-1.8.3.min.js'></script>");
		out.write("<script type='text/javascript' src='layer/layer.js'></script>");
		out.write("<script>");
		out.write("layer.open({content: '" + mess + "',btn:['了解！'],yes:function(){location.href='" + url
				+ "';layer.closeAll();},icon: " + i + ",skin: 'layui-layer-molv'});");
		out.write("</script>");
	}

	@RequestMapping("/delete")
	public void delete(PrintWriter out, String hid) {
		String mess = "no";
		if (us.delete(Integer.valueOf(hid))) {
			mess = "ok";
		}
		out.write(mess);
	}
	
	@RequestMapping("/zhifu")
	public String zhifu() {
		return "alipay.trade.page.pay";
	}
}
