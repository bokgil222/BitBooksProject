package org.bitbooks.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String registerForm() {
		logger.info("registerForm");
		
		return "registerForm";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerByParameter(String userId, String password) {
		logger.info("registerByParameter");
		
		logger.info("userId = " + userId);
		
		logger.info("password = " + password);
		
		return "success";
	}
	
	@RequestMapping(value = "/register/{userId}", method = RequestMethod.GET)
	public String registerByPath(String userId) {
		logger.info("registerByPath");
		
		logger.info("userId = " + userId);
		
		return "success";
	}
	
	@RequestMapping(value = "/register01", method = RequestMethod.POST)
	public String register01(String userId) {
		logger.info("register01");
		
		logger.info("userId = " + userId);
		
		return "success";
	}
	
	@RequestMapping(value = "/register02", method = RequestMethod.POST)
	public String register02(String userId, String password) {
		logger.info("register02");
		
		logger.info("userId = " + userId);
		
		logger.info("password = " + password);
		
		return "success";
	}
	
	@RequestMapping(value = "/register03", method = RequestMethod.POST)
	public String register03(String password, String userId) {
		logger.info("register03");
		
		logger.info("userId = " + userId);
		
		logger.info("password = " + password);
		
		return "success";
	}
	
	@RequestMapping(value = "/register04", method = RequestMethod.POST)
	public String register04(String userId, String password, String coin) {
		logger.info("register04");
		
		logger.info("userId = " + userId);
		
		logger.info("password = " + password);
		
		logger.info("coin = " + coin);
		
		return "success";
	}
	
	@RequestMapping(value = "/register05", method = RequestMethod.POST)
	public String register05(String userId, String password, int coin) {
		logger.info("register05");
		
		logger.info("userId = " + userId);
		
		logger.info("password = " + password);
		
		logger.info("coin = " + coin);
		
		return "success";
	}
	
}

