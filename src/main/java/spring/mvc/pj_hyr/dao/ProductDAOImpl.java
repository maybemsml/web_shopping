package spring.mvc.pj_hyr.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.pj_hyr.dto.CartDTO;
import spring.mvc.pj_hyr.dto.OrderDTO;
import spring.mvc.pj_hyr.dto.ProductDTO;
import spring.mvc.pj_hyr.dto.RefundDTO;
import spring.mvc.pj_hyr.dto.TotalDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;

	
	
	// 상품등록
	@Override
	public int productInsert(ProductDTO dto) {
		int insertCnt = sqlSession.insert("spring.mvc.pj_hyr.dao.ProductDAO.productInsert", dto);
		return insertCnt;
	}

	// 상품갯수
	@Override
	public int productCnt() {
		System.out.println("DAO - productCnt() 상품갯수");
		
		return sqlSession.selectOne("spring.mvc.pj_hyr.dao.ProductDAO.productCnt");
	}

	// 상품목록
	@Override
	public List<ProductDTO> productList(Map<String, Object> map) {
		System.out.println("DAO - productList // 상품목록");
		
		return sqlSession.selectList("spring.mvc.pj_hyr.dao.ProductDAO.productList", map);
	}

	// 상품상세페이지
	@Override
	public ProductDTO productDetail(int pdNo) {
		System.out.println("DAO - productDetail 상세");
		
		return sqlSession.selectOne("spring.mvc.pj_hyr.dao.ProductDAO.productDetail", pdNo);
	}

	// 상품수정
	@Override
	public int productUpdate(ProductDTO dto) {
		System.out.println("DAO - productUpdate 수정 ");
		
		return sqlSession.update("spring.mvc.pj_hyr.dao.ProductDAO.productUpdate", dto);
	}

	// 상품삭제
	@Override
	public int productDelete(int pdNo) {
		System.out.println("DAO - productDelete 삭제 ");
		
		return sqlSession.delete("spring.mvc.pj_hyr.dao.ProductDAO.productDelete", pdNo);
	}
	
	// 관리자 로그인
	@Override
	public int adminIdPasswordChk(Map<String, Object> map) {
		System.out.println(" DAO - adminIdPasswordChk 로그인처리");
		
		int selectCnt = sqlSession.selectOne("spring.mvc.pj_hyr.dao.ProductDAO.adminIdPasswordChk", map);
		System.out.println("selectCnt" + selectCnt + "map : "+ map);
		return selectCnt;
	}
	
	@Override
	public List<CartDTO> cartList(String sessionId) {
		System.out.println(" DAO - cartList 장바구니 목록 ");
		
		return sqlSession.selectList("spring.mvc.pj_hyr.dao.ProductDAO.cartList", sessionId);
	}

	@Override
	public void cartCnt(String sessionId) {
		System.out.println(" DAO - cartCnt ");
		
		sqlSession.selectOne("spring.mvc.pj_hyr.dao.ProductDAO.cartCnt", sessionId);
	}


	@Override
	public void cartAdd(CartDTO dto) {
		System.out.println(" DAO - cartAdd ");
		
		String cartQuantity = sqlSession.selectOne("spring.mvc.pj_hyr.dao.ProductDAO.cartAdd1", dto);
		if(cartQuantity != null) {
			dto.setQuantity(Integer.parseInt(cartQuantity) + dto.getQuantity());
			sqlSession.update("spring.mvc.pj_hyr.dao.ProductDAO.cartAdd3", dto);
		}
		else {
			sqlSession.insert("spring.mvc.pj_hyr.dao.ProductDAO.cartAdd2", dto);
		}
		//sqlSession.insert("spring.mvc.pj_hyr.dao.ProductDAO.cartAdd", dto);
	}


	@Override
	public void cartDelete(Map<String, Object> map) {
		System.out.println("DAO - cartDelete 삭제 ");
		
		sqlSession.delete("spring.mvc.pj_hyr.dao.ProductDAO.cartDelete", map);
	}
	
	// ★★★
	@Override
	public int cartBuy(OrderDTO order) {
		System.out.println("DAO - cartBuy()");
		
		int insertCnt = sqlSession.insert("spring.mvc.pj_hyr.dao.ProductDAO.cartBuy", order);
		
		return insertCnt;
	}




	// 바로구매 ★★★
	@Override
	public void nowBuy(OrderDTO order) {
		System.out.println(" DAO - nowBuy ");
		
		sqlSession.insert("spring.mvc.pj_hyr.dao.ProductDAO.nowBuy", order);
	}


	@Override
	public List<OrderDTO> orderList(Map<String, Object> map) {
		System.out.println(" DAO - orderList // 주문목록");
		
		return sqlSession.selectList("spring.mvc.pj_hyr.dao.ProductDAO.orderList", map);
	}


	@Override
	public int orderCnt() {
		System.out.println(" DAO - orderCnt() ");
		
		return sqlSession.selectOne("spring.mvc.pj_hyr.dao.ProductDAO.orderCnt");
	}


	@Override
	public int orderConfirm(int odNo) {
		System.out.println(" DAO - orderConfirm 주문승인 ");
		
		return sqlSession.update("spring.mvc.pj_hyr.dao.ProductDAO.orderConfirm",odNo);
	}


	@Override
	public int orderCancel(int odNo) {
		System.out.println(" DAO - orderCancel 주문취소 ");
		
		return sqlSession.update("spring.mvc.pj_hyr.dao.ProductDAO.orderCancel",odNo);
	}


	@Override
	public List<RefundDTO> refundList(Map<String, Object> map) {
		System.out.println(" DAO - refundList");
		
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		return dao.refundList(map);
	}


	@Override
	public int refundCnt() {
		System.out.println(" DAO - refundCnt() ");
		
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		return dao.refundCnt();
	}


	@Override
	public int refundConfirm(int rfNo) {
		System.out.println("DAO - refundConfirm 환불승인 ");
		
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		return dao.refundConfirm(rfNo);
	}


	@Override
	public int refundReject(int rfNo) {
		System.out.println("DAO - refundReject 환불거절 ");
		
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		return dao.refundReject(rfNo);
		
	}

	// 개별결산 (사용x)
	@Override
	public List<OrderDTO> totalList(Map<String, Object> map) {
		System.out.println("DAO - totalList // 결산목록");
		
		return sqlSession.selectList("spring.mvc.pj_hyr.dao.ProductDAO.totalList", map);
	}


	@Override
	public int totalCnt() {
		System.out.println("DAO - totalCnt() ");
		
		return sqlSession.selectOne("spring.mvc.pj_hyr.dao.ProductDAO.totalCnt");
	}


	@Override
	public List<TotalDTO> monthTotal(Map<String, Object> map) {
		System.out.println("DAO - monthTotal 월별결산");
		
		return sqlSession.selectList("spring.mvc.pj_hyr.dao.ProductDAO.monthTotal", map);
	}


}