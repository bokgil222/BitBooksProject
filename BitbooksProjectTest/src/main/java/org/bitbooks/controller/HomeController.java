package org.bitbooks.controller;


import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.bitbooks.domain.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/goHome0101", method = RequestMethod.GET)
	public void home0101() {
		logger.info("home0101");
	}

	@RequestMapping(value = "/sub/goHome0102", method = RequestMethod.GET)
	public void home0102() {
		logger.info("home0102");
	}

	@RequestMapping(value = "/goHome0201", method = RequestMethod.GET)
	public String home0201() {
		logger.info("home0201");

		return "home0201";
	}

	@RequestMapping(value = "/sub/goHome0202", method = RequestMethod.GET)
	public String home0202() {
		logger.info("home0202");

		return "home0202";
	}

	@RequestMapping(value = "/sub/goHome0203", method = RequestMethod.GET)
	public String home0203() {
		logger.info("home0203");

		return "sub/home0203";
	}

	@RequestMapping(value = "/goHome0204", method = RequestMethod.GET)
	public String home0204() {
		logger.info("home0204");

		return "redirect:/sub/goHome0205";
	}

	@RequestMapping(value = "/sub/goHome0205", method = RequestMethod.GET)
	public String home0205() {
		logger.info("home0205");

		return "/sub/home0205";
	}

	@ResponseBody
	@RequestMapping(value = "/goHome0301", method = RequestMethod.GET, produces = "application/json")
	public Member home0301() {
		// HTTP Status 404 – Not Found
		logger.info("home0301");

		Member member = new Member();

		return member;
	}

	@ResponseBody
	@RequestMapping(value = "/goHome0302", method = RequestMethod.GET, produces = "application/xml")
	public Member home0302() {
		// HTTP Status 406 – Not Acceptable
		// jackson-databind 설치 전
		logger.info("home0302");

		Member member = new Member();

		return member;
	}

	@ResponseBody
	@RequestMapping(value = "/goHome04", method = RequestMethod.GET)
	public List<Member> home04() {
		logger.info("home04");

		List<Member> list = new ArrayList<Member>();

		Member member = new Member();
		list.add(member);

		Member member2 = new Member();
		list.add(member2);

		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/goHome05", method = RequestMethod.GET)
	public Map<String, Member> home05() {
		logger.info("home05");

		Map<String, Member> map = new HashMap<String, Member>();

		Member member = new Member();
		map.put("key1", member);

		Member member2 = new Member();
		map.put("key2", member2);

		return map;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/goHome06", method = RequestMethod.GET)
	public ResponseEntity<Void> home06() {
		logger.info("home06");

		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	@ResponseBody
	@RequestMapping(value = "/goHome07", method = RequestMethod.GET)
	public ResponseEntity<String> home07() {
		logger.info("home07");

		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}

	@ResponseBody
	@RequestMapping(value = "/goHome08", method = RequestMethod.GET)
	public ResponseEntity<Member> home08() {
		logger.info("home08");

		Member member = new Member();

		return new ResponseEntity<Member>(member, HttpStatus.OK);
	}

	@ResponseBody
	@RequestMapping(value = "/goHome09", method = RequestMethod.GET)
	public ResponseEntity<List<Member>> home09() {
		logger.info("home09");

		List<Member> list = new ArrayList<Member>();

		Member member = new Member();
		list.add(member);

		Member member2 = new Member();
		list.add(member2);

		return new ResponseEntity<List<Member>>(list, HttpStatus.OK);
	}

	@ResponseBody
	@RequestMapping(value = "/goHome10", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Member>> home10() {
		logger.info("home10");

		Map<String, Member> map = new HashMap<String, Member>();

		Member member = new Member();
		map.put("key1", member);

		Member member2 = new Member();
		map.put("key2", member2);

		return new ResponseEntity<Map<String, Member>>(map, HttpStatus.OK);
	}

	@ResponseBody
	@RequestMapping(value = "/goHome1101", method = RequestMethod.GET)
	public ResponseEntity<byte[]> home1101() throws Exception {
		logger.info("home1101");

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		try {
			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream("C:\\TEMP\\sample.png");

			headers.setContentType(MediaType.IMAGE_PNG);

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/goHome1102", method = RequestMethod.GET)
	public ResponseEntity<byte[]> home1102() throws Exception {
		logger.info("home1102");

		String fileName = "aa.zip";

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		try {

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream("C:\\TEMP\\" + fileName);

			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}

}

