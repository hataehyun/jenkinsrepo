package org.bong.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.bong.domain.BoardVO;
import org.bong.domain.Criteria;
import org.bong.domain.Criteria2;
import org.bong.domain.ReplyVO;
import org.bong.persistence.BoardDAO;
import org.bong.persistence.ReplyDAO;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
@Service
public class ServiceDAOImple implements ServiceDAO {
	private Logger logger = Logger.getLogger(ServiceDAOImple.class);

	@Autowired
	BoardDAO boardDAO;
	
	
	@Autowired
	ReplyDAO replyDAO;
	
	@Override
	public List<BoardVO> getBoardList(Criteria cri) {
		return boardDAO.getBoardList(cri);
		
	}
	@Override
	public int listCount(Criteria cri) {
		return boardDAO.listCount(cri);
	}
	@Override
	public void create(BoardVO vo) {
		boardDAO.create(vo);
		
	}
	@Override
	public BoardVO read(int bno) {
		return boardDAO.read(bno);
		
	}
	@Override
	public void delete(int bno) {
		boardDAO.delete(bno);
		
	}
/////////////////원글처리 끝///////////////////////////////////////
	@Override
	public List<ReplyVO> getReplyList(Criteria2 cri2) {
		// TODO Auto-generated method stub
		return replyDAO.getReplyList(cri2);
	}
	@Override
	public int total(int bno) {
		return replyDAO.total(bno);
	}
	@Override
	@Transactional
	public void registerNew(ReplyVO rvo) {
		Integer maxGno = replyDAO.getMaxGno(rvo.getBno());
		logger.info(maxGno);
		if(maxGno==null){
			rvo.setGno(1);
			replyDAO.createNew(rvo);
		} else {
			rvo.setGno(maxGno+1);
			replyDAO.createNew(rvo);
		}
		
	}

}
