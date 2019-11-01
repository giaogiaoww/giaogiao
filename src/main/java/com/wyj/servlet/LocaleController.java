package com.wyj.servlet;



import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class LocaleController {

	
	
	@RequestMapping("/i18n")
	public String testi18n(Locale locale) {
		System.out.println(locale);
		return "login";
	}
	
	@RequestMapping("/i18n2")
	public String testi18n2(Locale locale) {
		System.out.println(locale);
		return "regs";
	}
}
