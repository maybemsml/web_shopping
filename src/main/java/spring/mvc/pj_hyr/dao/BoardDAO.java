package spring.mvc.pj_hyr.dao;

import java.util.List;
import java.util.Map;

import spring.mvc.pj_hyr.dto.NoticeDTO;
// 공지사항 게시판
public interface BoardDAO {
	
//---------------------notice--------------------------------------------------------------
	
	// 게시글 목록
	public List<NoticeDTO> noticeList(Map<String, Object> map);
	// 게시글 갯수구하기
	public int noticeCnt();
	// 게시글 상세페이지
	public NoticeDTO getNoticeDetail(int num);
	// 게시글 수정처리
	public void updateNotice(NoticeDTO dto);
	// 게시글 삭제처리
	public void deleteNotice(int num);
	// 게시글 작성처리
	public void writeNotice(NoticeDTO dto);

	
}
