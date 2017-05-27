package org.bong.persistence;

import java.util.List;

import org.bong.domain.BoardVO;
import org.bong.domain.Criteria;

public interface BoardDAO {
	
	public List<BoardVO> getBoardList(Criteria cri);
	public int listCount(Criteria cri);
	
}
