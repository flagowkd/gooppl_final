package goo.sigungu.model;

import java.util.*;

public interface SigunguService {
	
	public int addSigungu(SigunguDTO dto);
	public List<SigunguDTO> sigunguList();
	public String getSigunguName(int areacode, int sigungucode);
}
