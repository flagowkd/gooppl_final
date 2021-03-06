package goo.admin.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import goo.member.model.MemberDTO;
import goo.review.model.ReviewDTO;

public class AdminDAOImple implements AdminDAO {
	
	
	private SqlSessionTemplate sqlMap;
	
	public AdminDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public void loginRecode(int member_idx) {
		sqlMap.update("loginRecode", member_idx);
	}
	
	public AdminDTO adminInfo(String goo_id) {
		AdminDTO dto=sqlMap.selectOne("adminInfo",goo_id);
		return dto;
	}
	
	public List<AdminDTO> allAdminInfo(Map map) {
		List<AdminDTO> list=sqlMap.selectList("allAdminInfo",map);
		return list;
	}
	
	public MemberDTO adminMemberInfo(String goo_id) {
		MemberDTO dto=sqlMap.selectOne("adminMemberInfo",goo_id);
		return dto;
	}
	
	//회원 테이블에서 타입이 관리자인 회원목록 불러오기
	public List<MemberDTO> allAdminMemberInfo(Map map) {
		List<MemberDTO> list=sqlMap.selectList("allAdminMemberInfo",map);
		return list;
	}
	
	//후기게시판 목록
	public List<ReviewDTO> adminReview(Map map) {
		List<ReviewDTO> list = sqlMap.selectList("adminReviewList",map);
		return list;
	}
	
	public int adminReviewTotal() {
		int totalCnt=sqlMap.selectOne("adminReviewTotal");
		
		return totalCnt;
	}
	
	public int adminInsert1(MemberDTO mdto) {
		int count = sqlMap.insert("adminInsert1", mdto);
		return count;
	}
	
	public int adminInsert2(AdminDTO adto) {
		int count = sqlMap.insert("adminInsert2", adto);
		return count;
	}
	
	public int adminUpdate1(MemberDTO mdto) {
		int count = sqlMap.update("adminUpdate1", mdto);
		return count;
	}
	
	public int adminUpdate2(AdminDTO adto) {
		int count = sqlMap.update("adminUpdate2", adto);
		return count;
	}
	
	public int totalAdmin() {
		int count = sqlMap.selectOne("totalAdmin");
		return count;
	}
	
	public int adminDelete1(int member_idx) {
		int count = sqlMap.delete("adminDelete1", member_idx);
		return count;
	}
	
	public int adminDelete2(int member_idx) {
		int count = sqlMap.delete("adminDelete2", member_idx);
		return count;
	}
	
	public int memberDelete(int member_idx) {
		int count = sqlMap.delete("memberDelete", member_idx);
		return count;
	}
	
	public int memberUpdate(MemberDTO mdto) {
		int count = sqlMap.update("memberUpdate", mdto);
		return count;
	}
	
	public int totalMemberNum() {
		int count = sqlMap.selectOne("totalMemberNum");
		return count;
	}
	
	public int currentMemberNum() {
		int count = sqlMap.selectOne("currentMemberNum");
		return count;
	}
	
	public int adminNum() {
		int count = sqlMap.selectOne("adminNum");
		return count;
	}
	
	public int ownerNum() {
		int count = sqlMap.selectOne("ownerNum");
		return count;
	}
	
	public int memberNum() {
		int count = sqlMap.selectOne("memberNum");
		return count;
	}
	
	public int memberOutNum() {
		int count = sqlMap.selectOne("memberOutNum");
		return count;
	}
	
	public int monthJoinNum(Map<String,Object> map) {
		int count = sqlMap.selectOne("monthJoinNum",map);
		return count;
	}
	
	public int searchCurrentMemberNum(Map<String, Object> map) {
		int count = sqlMap.selectOne("searchCurrentMemberNum",map);
		return count;
	}
	
	public int searchAdminNum(Map<String, Object> map) {
		int count = sqlMap.selectOne("searchAdminNum",map);
		return count;
	}
	
	public int searchOwnerNum(Map<String, Object> map) {
		int count = sqlMap.selectOne("searchOwnerNum",map);
		return count;
	}
	
	public int searchMemberNum(Map<String, Object> map) {
		int count = sqlMap.selectOne("searchMemberNum",map);
		return count;
	}
	
	public int searchMemberOutNum(Map<String, Object> map) {
		int count = sqlMap.selectOne("searchMemberOutNum",map);
		return count;
	}
	
	public int searchTotalMemberNum(Map<String, Object> map) {
		int count = sqlMap.selectOne("searchTotalMemberNum",map);
		return count;
	}
	
	public int dayJoinNum(Map<String, Object> map) {
		int count = sqlMap.selectOne("dayJoinNum", map);
		return count;
	}
	
	
}
