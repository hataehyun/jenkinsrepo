package org.bong.web;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.bong.domain.BoardVO;
import org.bong.domain.Criteria;
import org.bong.domain.PageMaker;
import org.bong.service.ServiceDAO;
import org.junit.runner.RunWith;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
public class BoardController {
	private Logger logger = Logger.getLogger(BoardController.class);
	
	@Inject
	ServiceDAO service;
	
	
	@GetMapping("/boardList")
	public void boardListGet(@ModelAttribute("cri") Criteria cri, Model model){
		List<BoardVO> list=service.getBoardList(cri);
		model.addAttribute("boardList",list);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
	    pageMaker.setTotalCount(service.listCount(cri));
	    model.addAttribute("page",pageMaker);
	    logger.info("cri: "+cri);
	    logger.info("page: "+pageMaker);
	}
}
