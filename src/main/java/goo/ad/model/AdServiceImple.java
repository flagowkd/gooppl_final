package goo.ad.model;

public class AdServiceImple implements AdService {
	
	private AdDAO adDao;
	
	public AdDAO getAdDao() {
		return adDao;
	}

	public void setAdDao(AdDAO adDao) {
		this.adDao = adDao;
	}

	public int adTest(AdDTO dto) {
		int result = adDao.adTest(dto);
		return result;
	}

}
