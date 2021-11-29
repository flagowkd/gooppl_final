package goo.page;

public class PageModule {

	public static String makePage(
			String pageName, int totalCnt, 
			int listSize, int pageSize, int cp) {
		
		int totalPage=totalCnt/listSize+1;
		if(totalCnt%listSize==0)totalPage--;
		int userGroup=cp/pageSize;
		if(cp%pageSize==0)userGroup--;
		
		StringBuffer sb=new StringBuffer();
		
		if(userGroup!=0) {
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp=(userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("'>Prev</a>");
			sb.append("&nbsp;");
		}
		for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>");
			sb.append("&nbsp;");
			if(i==totalPage){
				break;
			}
		}
		if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp=(userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("'>Next</a>");
		}
		return sb.toString();
	}
}
