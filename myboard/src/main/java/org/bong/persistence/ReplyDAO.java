package org.bong.persistence;

import java.util.List;

import org.bong.domain.Criteria2;
import org.bong.domain.ReplyVO;

public interface ReplyDAO {
	
	public List<ReplyVO> getReplyList(Criteria2 cri2);
	public int total(int bno);
	//new reply
	public void createNew(ReplyVO rvo);
	public Integer getMaxGno(int bno);
	//depth one reply
	public void createLpno(ReplyVO rvo);
	public void updateGord(ReplyVO rvo);
	
}
