package goo.ad_inquery.model;

import org.mybatis.spring.SqlSessionTemplate;

public class Ad_inquiryDAOImple implements Ad_inquiryDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public Ad_inquiryDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int adInquiry(Ad_inquiryDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}
}
