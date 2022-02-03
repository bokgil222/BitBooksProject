package org.bitbooks.controller;

import java.util.Date;

import org.bitbooks.domain.Board;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	// produces 속성 값에 "application/xml 미디어 타입을 지정한다.
	@RequestMapping(value = "/{boardNo}", method=RequestMethod.GET, produces="application/xml")
	public ResponseEntity<Board> readToXml(@PathVariable("boardNo") int boardNo){
		logger.info("readToXml");
		
		Board board = new Board();
		
		board.setTitle("제목");
		board.setContent("내용입니다.");
		board.setWriter("홍길동");
		board.setRegDate(new Date());
		
		ResponseEntity<Board> entity = new ResponseEntity<Board>(board, HttpStatus.OK);
		
		return entity;
	}
	
	// produces 속성 값에 "application/json 미디어 타입을 지정한다.
	@RequestMapping(value = "/{boardNo}", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Board> readToJson(@PathVariable("boardNo") int boardNo) {
		logger.info("readToJson");

		Board board = new Board();

		board.setTitle("제목");
		board.setContent("내용입니다.");
		board.setWriter("홍길동");
		board.setRegDate(new Date());

		ResponseEntity<Board> entity = new ResponseEntity<Board>(board, HttpStatus.OK);

		return entity;
	}

	// produces 속성 값을 지정하지 않으면 기본값인 "application/json 미디어 타입으로 지정된다.
	@RequestMapping(value = "/{boardNo}", method = RequestMethod.GET)
	public ResponseEntity<Board> read(@PathVariable("boardNo") int boardNo) {
		logger.info("read");

		Board board = new Board();
		
		board.setTitle("제목");
		board.setContent("내용입니다.");
		board.setWriter("홍길동");
		board.setRegDate(new Date());

		ResponseEntity<Board> entity = new ResponseEntity<Board>(board, HttpStatus.OK);

		return entity;
	}

}

	
	