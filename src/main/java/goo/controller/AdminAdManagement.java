package goo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import goo.admin.model.*;
import goo.area.model.AreaDTO;
import goo.area.model.AreaService;
import goo.member.model.*;
import goo.owner.model.*;
import goo.sigungu.model.SigunguDTO;
import goo.sigungu.model.SigunguService;
import goo.siteSettings.model.*;
import goo.ad_inquery.model.*;

@Controller
public class AdminAdManagement {
	
	@Autowired
	private OwnerService ownerService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private Ad_inquiryService ad_inquiryService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private SigunguService sigunguService;

	@RequestMapping("/admin_ad_management.do")
	public String ad_management() {
		return "/admin/ad_management/admin_ad_management";
	}
	
	/**광고주 신청 리스트*/
	@RequestMapping("/admin_ownerAppli.do")
	public ModelAndView ckOwnerAppli(@RequestParam(value = "cp",defaultValue = "1")int cp) {
		int listSize=5;
		int pageSize=5;
		int totalOwnerAppli = ownerService.totalOwnerAppli();
		System.out.println("총 신청 수:"+totalOwnerAppli);
		String pageStr = goo.page.PageModule.makePage("admin_ownerAppli.do", totalOwnerAppli, listSize, pageSize, cp);
		System.out.println("admin_ownerAppli OK");
		List<OwnerDTO> list = ownerService.allOwnerAppliInfo(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("cp", cp);
		mav.addObject("size", list.size());
		mav.addObject("listSize", listSize);
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("admin/ad_management/admin_ownerAppli");
		return mav;
	}
	
	/**광고주 신청 자세히보기*/
	@RequestMapping("/admin_ownerAppli_details.do")
	public ModelAndView admin_ownerAppli_details(@RequestParam(("owner_idx")) int owner_idx) {
		System.out.println("ownerAppli details ok");
		System.out.println("광고주번호:"+owner_idx);
		OwnerDTO dto = ownerService.ownerInfo(owner_idx);
		System.out.println("ownerAppli sql문 돌아감");
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("admin/ad_management/admin_ownerAppli_details");
		return mav;
	}
	
	/**광고주 신청 승인*/
	@RequestMapping("/admin_ownerAppli_ok")
	@ResponseBody
	public Map<String, Object> admin_ownerAppli_ok(
			@RequestParam(("owner_idx"))int owner_idx,
			@RequestParam(("member_idx"))int member_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		int code=0;
		
			int appliResult = ownerService.admin_ownerAppli_ok(owner_idx);

			if(appliResult>0) {
				int memberResult = memberService.admin_ownerAppli_typeChange(member_idx);
				if(memberResult>0) {
					System.out.println("승인완료");
					map.put("msg", "승인완료");
					code=1;
				}else {
					map.put("msg", "ERROR");
					code=0;
				}
			}else {
				map.put("msg", "ERROR");
				code=0;
			}
		map.put("code", code);
		return map;
	}
	
	/**광고주 신청 거절*/
	@RequestMapping("/admin_ownerAppli_del")
	@ResponseBody
	public Map<String, Object> admin_ownerAppli_del(@RequestParam(("owner_idx"))int owner_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		int code=0;
		
		int result = ownerService.admin_ownerAppli_del(owner_idx);
			
		if(result>0) {
			map.put("msg", "요청거절완료");
			code=1;
		}else {
			map.put("msg", "ERROR");
			code=0;
		}
		map.put("code", code);
		return map;
	}
	
	/**광고주 회원 리스트*/
	@RequestMapping("/admin_allOwner.do")
	public ModelAndView admin_allOwner(@RequestParam(value = "cp",defaultValue = "1")int cp) {
		int listSize=5;
		int pageSize=5;
		int totalOwner = ownerService.totalOwner();
		System.out.println("총 광고주 수:"+totalOwner);
		String pageStr = goo.page.PageModule.makePage("admin_allOwner.do", totalOwner, listSize, pageSize, cp);
		List<OwnerDTO> list = ownerService.admin_allOwner(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("cp", cp);
		mav.addObject("size", list.size());
		mav.addObject("listSize", listSize);
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("admin/ad_management/admin_owner");
		return mav;
	}
	
	/**광고주 회원 상세정보*/
	@RequestMapping("/admin_owner_detail.do")
	public ModelAndView admin_owner_detail(@RequestParam(("owner_idx")) int owner_idx,
			@RequestParam(value = "areacode") int areacode,
			@RequestParam(value = "sigungucode") int sigungucode) {
		System.out.println("owner details ok");
		System.out.println("광고주번호:"+owner_idx);
		OwnerDTO dto = ownerService.ownerInfo(owner_idx);
		System.out.println("owner sql문 돌아감");
		ModelAndView mav=new ModelAndView();
		List<AreaDTO> arealist = areaService.areaList();
		List<SigunguDTO> sigungulist = sigunguService.sigunguList();
		mav.addObject("dto", dto);
		mav.addObject("arealist",arealist);
		mav.addObject("sigungulist",sigungulist);
		mav.setViewName("admin/ad_management/admin_owner_details");
		return mav;
	}
	
	/**광고주 정보 수정*/
	@RequestMapping("/admin_ownerUpdate.do")
	public ModelAndView admin_ownerUpdate(OwnerDTO dto) {
		
		int code=0;
		System.out.println(dto.getOwner_idx());
		System.out.println(dto.getMember_idx());
		System.out.println(dto.getTitle());
		System.out.println(dto.getBusiness_number());
		System.out.println(dto.getName());
		System.out.println(dto.getEmail());
		System.out.println(dto.getBusiness_tel());
		System.out.println(dto.getTel());
		System.out.println(dto.getContenttype());
		System.out.println(dto.getAddr());
		System.out.println(dto.getDetailed_addr());
		System.out.println(dto.getAd_content());
		System.out.println(dto.getMapx()+"__"+dto.getMapy());
		System.out.println(dto.getAreacode());
		System.out.println(dto.getSigungucode());
		System.out.println(dto.getState());
		ModelAndView mav = new ModelAndView();
		if(dto.getFirstimg()==null) {
			System.out.println("이미지가 널이래");
			OwnerDTO tempDto = ownerService.ownerInfo(dto.getOwner_idx());
			System.out.println("원래 이미지:"+tempDto.getFirstimg());
			dto.setFirstimg(tempDto.getFirstimg());
		}
		int result = ownerService.admin_ownerUpdate(dto);
			if(result>0) {
				System.out.println("수정완료");
				mav.addObject("msg","수정완료");
				
			}else {
				System.out.println("수정실패");
				mav.addObject("msg","수정실패");
			}
			mav.addObject("goPage","admin_Allowner.do");
			mav.setViewName("admin/basic_settings/msg");
			return mav;
	}
	
	@RequestMapping("/admin_adAppli.do")
	public ModelAndView admin_adAppliList(@RequestParam(value = "cp",defaultValue = "1")int cp) {
		int listSize=5;
		int pageSize=5;
		int totalAdInquiry = ad_inquiryService.admin_totalAdInquiry();
		System.out.println("총 광고문의 수:"+totalAdInquiry);
		String pageStr = goo.page.PageModule.makePage("admin_adAppli.do", totalAdInquiry, listSize, pageSize, cp);
		List<Ad_inquiryDTO> list = ad_inquiryService.admin_adInquiry(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("cp", cp);
		mav.addObject("size", list.size());
		mav.addObject("listSize", listSize);
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("admin/ad_management/admin_adInquiry");
		return mav;
	}
	
	@RequestMapping("/admin_adCancel.do")
	public ModelAndView admin_adCancelList(@RequestParam(value = "cp",defaultValue = "1")int cp) {
		int listSize=5;
		int pageSize=5;
		int totalAdDelInquiry = ad_inquiryService.admin_totalAdDelInquiry();
		System.out.println("총 환불문의 수:"+totalAdDelInquiry);
		String pageStr = goo.page.PageModule.makePage("admin_adCancel.do", totalAdDelInquiry, listSize, pageSize, cp);
		List<Ad_inquiryDTO> list = ad_inquiryService.admin_adDelInquiry(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("cp", cp);
		mav.addObject("size", list.size());
		mav.addObject("listSize", listSize);
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("admin/ad_management/admin_adDelInquiry");
		return mav;
	}
	
	/**광고주 신청 자세히보기*/
	@RequestMapping("/adInquiry_details.do")
	public ModelAndView admin_adInquiry_details(@RequestParam("inquiry_idx") int inquiry_idx) {
		System.out.println("admin_adInquiry_details ok");
		System.out.println("문의번호:"+inquiry_idx);
		Ad_inquiryDTO idto = ad_inquiryService.adInquiry_Info(inquiry_idx);
		int owner_idx = idto.getOwner_idx();
		OwnerDTO odto = ownerService.ownerInfo(owner_idx);
		System.out.println("adInquiry sql문 돌아감");
		ModelAndView mav=new ModelAndView();
		mav.addObject("idto", idto);
		mav.addObject("odto", odto);
		mav.setViewName("admin/ad_management/admin_adInquiry_details");
		return mav;
	}
	
	/**광고 신청 승인*/
	@RequestMapping("/adInquiry_ok.do")
	public Map<String, Object> adInquiry_ok(
			@RequestParam("inquiry_idx") int inquiry_idx,
			@RequestParam("owner_idx") int owner_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		int code=0;
		
			int inquiryResult = ownerService.admin_ownerAppli_ok(owner_idx);

			if(inquiryResult>0) {
				int memberResult = memberService.admin_ownerAppli_typeChange(owner_idx);
				if(memberResult>0) {
					System.out.println("승인완료");
					map.put("msg", "승인완료");
					code=1;
				}else {
					map.put("msg", "ERROR");
					code=0;
				}
			}else {
				map.put("msg", "ERROR");
				code=0;
			}
		map.put("code", code);
		return map;
	}
}