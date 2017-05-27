package org.bong.service;

import java.util.List;

import org.bong.domain.BoardVO;
import org.bong.domain.Criteria;

public interface ServiceDAO {
	
	public List<BoardVO> getBoardList(Criteria cri);
	public int listCount(Criteria cri);
}
