package org.bong.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.bong.domain.Criteria2;
import org.bong.domain.ReplyVO;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@Repository
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class ReplyDAOImple implements ReplyDAO {
	private Logger logger = Logger.getLogger(ReplyDAOImple.class);
	private static final String namespace = "org.bong.persistence.ReplyDAO";
	
	@Inject
	SqlSessionTemplate sst;
	
	@Override
	public List<ReplyVO> getReplyList(Criteria2 cri2) {
		return sst.selectList(namespace+".replyList", cri2);
	}

	@Override
	public int total(int bno) {
		return sst.selectOne(namespace+".total",bno);
	}

	@Override
	public void createNew(ReplyVO rvo) {
		sst.insert(namespace+".createNew", rvo);
		
	}

	@Override
	public Integer getMaxGno(int bno) {
		return sst.selectOne(namespace+".getMaxGno", bno);
	}

}
