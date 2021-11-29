package goo.mapinfo.model;

import java.util.*;

public class MapInfoServiceImple implements MapInfoService {

	private MapInfoDAO mapinfoDao;
	
	public MapInfoDAO getMapinfoDao() {
		return mapinfoDao;
	}

	public void setMapinfoDao(MapInfoDAO mapinfoDao) {
		this.mapinfoDao = mapinfoDao;
	}

	public int addMapInfo(List<MapInfoDTO> list) {
		int result=0;
		for(int i=0;i<list.size();i++) {
			result+=mapinfoDao.addMapInfo(list.get(i));
		}
		return result;
	}
}
