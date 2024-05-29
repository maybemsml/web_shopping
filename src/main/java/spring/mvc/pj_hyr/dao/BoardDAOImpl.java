package spring.mvc.pj_hyr.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.pj_hyr.dto.NoticeDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NoticeDTO> noticeList(Map<String, Object> map) {
		System.out.println(" DAO - noticeList() 공지목록 ");
		
		return sqlSession.selectList("spring.mvc.pj_hyr.dao.BoardDAO.noticeList", map);
	}

	@Override
	public int noticeCnt() {
		System.out.println(" DAO - noticeCnt() ");
		
		return sqlSession.selectOne("spring.mvc.pj_hyr.dao.BoardDAO.noticeCnt");
	}

	@Override
	public NoticeDTO getNoticeDetail(int num) {
		System.out.println(" DAO - getNoticeDetail() 상세페이지");		
		
		return sqlSession.selectOne("spring.mvc.pj_hyr.dao.BoardDAO.getNoticeDetail", num);
	}

	@Override
	public void updateNotice(NoticeDTO dto) {
		System.out.println(" DAO - updateNotice 수정처리 ");	
		
		sqlSession.update("spring.mvc.pj_hyr.dao.BoardDAO.updateNotice", dto);
	}

	@Override
	public void deleteNotice(int num) {
		System.out.println(" DAO - deleteNotice(int num) ");
		
		sqlSession.update("spring.mvc.pj_hyr.dao.BoardDAO.deleteNotice", num);
	}

	@Override
	public void writeNotice(NoticeDTO dto) {
		System.out.println(" DAO - writeNotice(NoticeDTO dto)");	

		sqlSession.insert("spring.mvc.pj_hyr.dao.BoardDAO.writeNotice", dto);
	}


}
