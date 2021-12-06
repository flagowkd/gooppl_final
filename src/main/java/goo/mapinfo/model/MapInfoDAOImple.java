package goo.mapinfo.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class MapInfoDAOImple implements MapInfoDAO {

	private SqlSessionTemplate sqlMap;
	
	public MapInfoDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int addMapInfo(MapInfoDTO dto) {
		int result=sqlMap.insert("addMapInfo",dto);
		return result;
	}
	
	public List<MapInfoDTO> mapInfoList(Map map) {
		List<MapInfoDTO> list = sqlMap.selectList("getMapInfo",map);
		return list;
	}
}
