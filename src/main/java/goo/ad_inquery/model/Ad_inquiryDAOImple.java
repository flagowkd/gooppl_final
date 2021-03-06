package goo.ad_inquery.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class Ad_inquiryDAOImple implements Ad_inquiryDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public Ad_inquiryDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int adInquiry(Ad_inquiryDTO dto) {
		int result = sqlMap.insert("adInquiry",dto);
		return result;
	}
	
	public int payOk_InquiryDel(int owner_idx) {
		int result = sqlMap.delete("payOk_InquiryDel", owner_idx);
		return result;
	}
	
	public int admin_totalAdInquiry() {
		int count = sqlMap.selectOne("admin_totalAdInquiry");
		return count;
	}
	
	public int admin_totalAdUpdateInquiry() {
		int count = sqlMap.selectOne("admin_totalAdUpdateInquiry");
		return count;
	}
	
	public int admin_totalAdDelInquiry() {
		int count = sqlMap.selectOne("admin_totalAdDelInquiry");
		return count;
	}
	
	public List<Ad_inquiryDTO> admin_adInquiry(Map map) {
		List<Ad_inquiryDTO> list = sqlMap.selectList("admin_adInquiry", map);
		return list;
	}
	
	public List<Ad_inquiryDTO> admin_adUpdateInquiry(Map map) {
		List<Ad_inquiryDTO> list = sqlMap.selectList("admin_adUpdateInquiry", map);
		return list;
	}
	
	public List<Ad_inquiryDTO> admin_adDelInquiry(Map map) {
		List<Ad_inquiryDTO> list = sqlMap.selectList("admin_adDelInquiry", map);
		return list;
	}
	
	public int admin_adInquiry_ok(int inquiry_idx) {
		int result = sqlMap.update("admin_adInquiry_ok", inquiry_idx);
		return result;
	}
	
	public Ad_inquiryDTO adInquiry_Info(int inquiry_idx) {
		Ad_inquiryDTO dto = sqlMap.selectOne("adInquiry_Info", inquiry_idx);
		return dto;
	}
	
	public String ckAdInquiry(int member_idx) {
		String inquiry_state = sqlMap.selectOne("ckAdInquiry", member_idx);
		return inquiry_state;
	}
	
	public Ad_inquiryDTO ad_paymentInfo(int member_idx) {
		Ad_inquiryDTO dto = sqlMap.selectOne("ad_paymentInfo", member_idx);
		return dto;
	}
	
	public int admin_adInquiry_del(int inquiry_idx) {
		int result = sqlMap.delete("admin_adInquiry_del", inquiry_idx);
		return result;
	}
	
	public int admin_delInquiry_Ok(int inquiry_idx) {
		int result = sqlMap.update("admin_delInquiry_Ok", inquiry_idx);
		return result;
	}
	
	public int admin_delInquiry_Delete(int inquiry_idx) {
		int result = sqlMap.delete("admin_delInquiry_Delete", inquiry_idx);
		return result;
	}
	
	public String ckCancelInquiry(int member_idx) {
		String inquiry_state = sqlMap.selectOne("ckCancelInquiry", member_idx);
		return inquiry_state;
	}
	
	public int admin_ownerOut_inquiryDel(int owner_idx) {
		int result = sqlMap.delete("admin_ownerOut_inquiryDel", owner_idx);
		return result;
	}
}
