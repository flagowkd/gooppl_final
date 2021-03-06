package goo.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import goo.admin.model.AdminDAO;
import goo.admin.model.AdminService;

@Controller
public class AdminStatistics {
	
	@Autowired
	private AdminDAO adminDao;
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/admin_statistics.do")
	public ModelAndView statistics(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")==null||!session.getAttribute("sessionMemberType").equals("A")) {
			mav.addObject("msg", "관리자 계정으로 로그인해주세요");
			mav.addObject("goPage", "index.do");
			mav.setViewName("admin/basic_settings/msg");
		}else {
			mav.setViewName("/admin/statistics/admin_statistics");
		}
		return mav;
	}
	
	@RequestMapping("/member_statistics.do")
	public ModelAndView memberStatistics(@RequestParam(value = "start_date" , defaultValue = "")String start_date
			, @RequestParam(value = "end_date" , defaultValue = "")String end_date,@RequestParam(value = "month", defaultValue = "0")int month,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")==null||!session.getAttribute("sessionMemberType").equals("A")) {
			mav.addObject("msg", "관리자 계정으로 로그인해주세요");
			mav.addObject("goPage", "index.do");
			mav.setViewName("admin/basic_settings/msg");
		}else {
			
			if(month == 0) {
				System.out.println("memberStatistics 진입");
				if(!start_date.equals("")&&!end_date.equals("")){
					LocalDate s_date = LocalDate.parse(start_date, DateTimeFormatter.ISO_DATE);
					LocalDate e_date = LocalDate.parse(end_date, DateTimeFormatter.ISO_DATE);
					
					if(e_date.isBefore(s_date)) {
						mav.addObject("msg", "올바르지 않은 형식입니다.끝나는 날짜가 시작하는 날짜보다 이전 날짜입니다. 다시 입력해주세요.");
						mav.addObject("display1", "display : none;");
						mav.addObject("display2", "display : none;");
					}else if(s_date.isBefore(e_date)) {
						
						if(!start_date.equals("")&&end_date.equals("")) {
							System.out.println("start_date 값만 진입");
							end_date = start_date;
						}else if(!end_date.equals("")&&start_date.equals("")) {
							System.out.println("end_date 값만 진입");
							start_date = end_date;
						}
						
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("start_date", start_date);
						map.put("end_date", end_date);
						mav.addObject("display1", "display : block;");
						mav.addObject("display2", "display : none;");
						map = adminService.statistics(map);
						
						mav.addObject("start_date", start_date);
						mav.addObject("end_date", end_date);
						mav.addObject("totalMemberNum", map.get("totalMemberNum"));
						mav.addObject("currentMemberNum", map.get("currentMemberNum"));
						mav.addObject("adminNum", map.get("adminNum"));
						mav.addObject("ownerNum", map.get("ownerNum"));
						mav.addObject("memberNum", map.get("memberNum"));
						mav.addObject("memberOutNum", map.get("memberOutNum"));
					}
				}else{
					if(!start_date.equals("")&&end_date.equals("")) {
						System.out.println("start_date 값만 진입");
						end_date = start_date;
					}else if(!end_date.equals("")&&start_date.equals("")) {
						System.out.println("end_date 값만 진입");
						start_date = end_date;
					}
					Map<String, Object> map = new HashMap<String, Object>();
					mav.addObject("display1", "display : block;");
					mav.addObject("display2", "display : none;");
					map.put("start_date", start_date);
					map.put("end_date", end_date);
					map = adminService.statistics(map);
					mav.addObject("start_date", start_date);
					mav.addObject("end_date", end_date);
					mav.addObject("totalMemberNum", map.get("totalMemberNum"));
					mav.addObject("currentMemberNum", map.get("currentMemberNum"));
					mav.addObject("adminNum", map.get("adminNum"));
					mav.addObject("ownerNum", map.get("ownerNum"));
					mav.addObject("memberNum", map.get("memberNum"));
					mav.addObject("memberOutNum", map.get("memberOutNum"));
				}
				mav.setViewName("/admin/statistics/member_statistics");
			}else {
				System.out.println("dayStatistics 진입");
				Map<String, Object> map = new HashMap<String, Object>();
				map = adminService.dayStatistics(month);
				mav.addObject("display1", "display : none;");
				mav.addObject("display2", "display : block;");
				mav.addObject("days", map.get("days"));
				mav.addObject("days_length", map.get("days_length"));
				mav.addObject("year", map.get("year"));
				mav.addObject("month", map.get("month"));
				mav.setViewName("/admin/statistics/member_statistics");
			}
			
		}
		
		return mav;
	}
	
	@RequestMapping("/month_statistics.do")
	public ModelAndView monthStatistics(HttpSession session){
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")==null||!session.getAttribute("sessionMemberType").equals("A")) {
			mav.addObject("msg", "관리자 계정으로 로그인해주세요");
			mav.addObject("goPage", "index.do");
			mav.setViewName("admin/basic_settings/msg");
		}else {
			System.out.println("monthStatistics 진입");
			Map<String, Object> map = new HashMap<String, Object>();
			map = adminService.monthStatistics();
			int joinNum[] = new int[12];
			for(int i=0;i<=11;i++) {
				joinNum[i] = (Integer) map.get("joinNum"+i);
				mav.addObject("joinNum", joinNum);
			}
			mav.addObject("year", map.get("year"));
			mav.setViewName("/admin/statistics/month_join_num");
		}
		
		return mav;
	}
	
}
