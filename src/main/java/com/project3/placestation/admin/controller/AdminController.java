package com.project3.placestation.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project3.placestation.admin.dto.AdminBannerDTO;
import com.project3.placestation.admin.dto.AdminBizDTO;
import com.project3.placestation.admin.dto.AdminMemberDTO;
import com.project3.placestation.admin.dto.AdminNoticeDTO;
import com.project3.placestation.admin.dto.AdminQnaDTO;
import com.project3.placestation.admin.dto.AdminTodoDTO;
import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.admin.dto.PageVO;
import com.project3.placestation.admin.dto.TodoCriteria;
import com.project3.placestation.biz.model.dto.BizHistoryDto;
import com.project3.placestation.filedb.service.FiledbService;
import com.project3.placestation.repository.entity.Banner;
import com.project3.placestation.repository.entity.Biz;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.repository.entity.NoticeBoard;
import com.project3.placestation.repository.entity.QnaBoard;
import com.project3.placestation.repository.entity.Todo;
import com.project3.placestation.service.AdminProdHistoryService;
import com.project3.placestation.service.BannerService;
import com.project3.placestation.service.BizService;
import com.project3.placestation.service.MemberService;
import com.project3.placestation.service.NoticeBoardService;
import com.project3.placestation.service.QnaBoardService;
import com.project3.placestation.service.TodoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private FiledbService filedbService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private BizService bizService;
	@Autowired
	private NoticeBoardService noticeBoardService;
	@Autowired
	private TodoService todoService;
	@Autowired
	private QnaBoardService qnaBoardService;
	@Autowired
	private BannerService bannerService;
	@Autowired
	private AdminProdHistoryService adminProdHistoryService;
	@Autowired
	private HttpSession httpSession;

	// http://localhost:80/admin/admin-main
	// 관리자 기본메인페이지 출력
	@GetMapping("/admin-main")
	public String adminpageGET(HttpSession session, AdminNoticeDTO ndto, AdminTodoDTO tdto, Model model, Criteria cri,
			TodoCriteria todocri) throws Exception {

		cri.setStatus("진행");
		
		
		Integer totalPrice = adminProdHistoryService.countAdminpaymentCount();
		Integer totalNotice = noticeBoardService.AdmincountNoticeBoard();
		Integer totalMember = memberService.countMember();
		Integer totalBiz = bizService.countMember();
		Integer totalQna = qnaBoardService.mainQnaBoarCount(cri);
		session.setAttribute("totalPrice", totalPrice);
		session.setAttribute("totalMember", totalMember);
		session.setAttribute("totalBiz", totalBiz);
		session.setAttribute("totalNotice", totalNotice);
		session.setAttribute("totalQna", totalQna);
		session.setAttribute("viewcntCheck", true);
		
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		// pageVO.setTotalCount(noticeBoardService.AdmincountNoticeBoard());
		pageVO.setTotalCount(qnaBoardService.AdmincountQnaBoard());
		model.addAttribute("pageVO", pageVO);

		// List<NoticeBoard> result = noticeBoardService.AdminNoticeBoardListAll(cri);
		List<QnaBoard> result = qnaBoardService.AdminQnaBoardListAll2(cri);
		List<Todo> result2 = todoService.adminTodoList(todocri);

		// model.addAttribute("noticelist", result);
		model.addAttribute("qnalist", result);
		model.addAttribute("todolist", result2);

		log.debug("admin 메인 페이지 출력!");
		return "admin/adminmain";
	}

	// todo 삭제 get
	@GetMapping("/admin-tododelete")
	public String tododeleteGET() {
		log.debug("todo삭제페이지출력!");
		return "admin/admintododelete";
		
	}

	// todo 삭제 post
	@PostMapping("/admin-tododelete")
	public String tododeletePOST(AdminTodoDTO dto) throws Exception {
		log.debug("todo삭제완료!");
		todoService.deleteTodo(dto);
		return "redirect:/admin/admin-main";
	}

	// todo 등록 get
	@GetMapping("/admin-todoinsert")
	public String todoinsertGET() {
		log.debug("todo등록페이지출력!");
		return "admin/admintodoinsert";
	}

	// todo 등록 post
	@PostMapping("/admin-todoinsert")
	public String todoinsertPOST(AdminTodoDTO dto) throws Exception {
		log.debug("todo등록완료");
		todoService.insertTodo(dto);
		return "redirect:/admin/admin-main";

	}

	// http://localhost:80/admin/admin-member
	// 관리자 유저관리페이지 출력
	@GetMapping("/admin-member")
	public String adminuserGET(AdminMemberDTO dto, Model model, Criteria cri) throws Exception {

		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(memberService.countMember());

		model.addAttribute("pageVO", pageVO);

		List<Member> result = memberService.listAll(cri);

		model.addAttribute("memberlist", result);

		log.debug("admin-user관리 페이지 출력!");
		return "admin/adminmember";
	}
	
	
	
	// http://localhost:80/admin/admin-biz
	// 관리자 사업자관리페이지 출력
	@GetMapping("/admin-biz")
	public String adminbizGET(AdminBizDTO dto, Model model, Criteria cri) throws Exception {

		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(bizService.countMember());

		model.addAttribute("pageVO", pageVO);

		List<Biz> result = bizService.BizAll(cri);

		model.addAttribute("bizlist", result);

		log.debug("admin-biz관리 페이지 출력!");
		return "admin/adminbiz";
	}

	
	

	// http://localhost:80/admin/admin-payment
	// 관리자 결제,예약관리페이지출력
	@GetMapping("/admin-payment")
	public String adminpaymentGET(BizHistoryDto dto, Model model, Criteria cri) throws Exception {
		
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(adminProdHistoryService.countPayment());
		
		model.addAttribute("pageVO", pageVO);
		
		List<BizHistoryDto> result = adminProdHistoryService.paymentlistAll(cri);
		
		model.addAttribute("paymentlist", result);
		
		return "admin/adminpayment";
	}

	
	
	

	
	
	
	// http://localhost:80/admin/admin-notice
	// 관리자 공지사항관리페이지출력
	@GetMapping("/admin-notice")
	public String adminnoticeGET(AdminNoticeDTO ndto, Model model, Criteria cri, HttpSession session) throws Exception {

		session.setAttribute("viewcntCheck", true);

		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(noticeBoardService.AdmincountNoticeBoard());

		model.addAttribute("pageVO", pageVO);

		List<NoticeBoard> result = noticeBoardService.AdminNoticeBoardListAll(cri);

		model.addAttribute("noticelist", result);

		log.debug("admin 공지사항관리페이지출력!");
		return "admin/adminnotice";
	}

	// http://localhost:80/admin/admin-qna
	// 관리자 1:1문의관리페이지출력
	@GetMapping("/admin-qna")
	public String adminqnaGET(AdminQnaDTO dto, Model model, Criteria cri, HttpSession session) throws Exception {

		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(qnaBoardService.AdmincountQnaBoard());

		model.addAttribute("pageVO", pageVO);

		List<QnaBoard> result = qnaBoardService.AdminQnaBoardListAll(cri);

		model.addAttribute("qnalist", result);

		log.debug("admin 1:1문의관리페이지출력!");
		return "admin/adminqna";
	}

	// 관리자 배너관리페이지 출력
	@GetMapping("/admin-banner")
	public String adminbannerGET(AdminBannerDTO dto, Model model, Criteria cri) throws Exception {

		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(bannerService.BannerListCount());

		model.addAttribute("pageVO", pageVO);

		List<Banner> result = bannerService.BannerListAll(cri);

		model.addAttribute("bannerlist", result);

		log.debug("adminbanner.jsp 실행");
		return "admin/adminbanner";

	}

	// 관리자 공지사항 상세보기페이지출력
	@GetMapping("/admin-noticedetail")
	public String adminnoticedetailGET(@RequestParam("nbno") Integer nbno, Model model, HttpSession session)
			throws Exception {

		if ((boolean) session.getAttribute("viewcntCheck")) {
			noticeBoardService.updateReadCnt(nbno);
			session.setAttribute("viewcntCheck", false);
			
		}

		NoticeBoard result = noticeBoardService.detailNoticeBoard(nbno);
		model.addAttribute("detailNotice", result);
		
		log.debug("공지사항(관리자)상세보기실행");
		return "admin/adminnoticedetail";
	}

	// 관리자 1:1문의 상세보기페이지출력
	@GetMapping("/admin-qnadetail")
	public String adminqnadetailGET(@RequestParam("qbno") Integer qbno, Model model) throws Exception {

		QnaBoard result = qnaBoardService.detailQnaBoard(qbno);
		model.addAttribute("detailQna", result);

		log.debug("qna(관리자) 상세보기실행!");
		return "admin/adminqnadetail";

	}
	
	
	
	
	// 관리자 사업자등록증 확인페이지출력
	@GetMapping("/admin-bizcheck")
	public String adminfileCheckGET(@RequestParam("bizNo") Integer bizNo, Model model) throws Exception{
		
		Biz result = bizService.detailBizFile(bizNo);
		model.addAttribute("detailBizFile", result);
		
		log.debug("사업자등록증확인 GET 실행!");
		return "admin/adminbizcheck";
	}
	
	
	//관리자 환불기능 GET 처리
	@GetMapping("/admin-paymentcancel")
	public String adminpaymentCancelGET() {
		log.debug("환불 modal 창 실행!");
		return "admin/adminpaymentcancel";
	}



	//관리자 환불기능 post 처리
	@PostMapping("/admin-paymentcancel")
	public String adminpaymentCancelPOST(BizHistoryDto dto) {
		log.debug("관리자 환불 post 실행!");
		adminProdHistoryService.AdminPaymentCancel(dto);
		adminProdHistoryService.AdminPaymentCancel2(dto);
		return "redirect:/admin/admin-payment";
	}

	
	
	
	
	
	
	
	
	
	

	// 공지사항 등록페이지 GET
	@GetMapping("/admin-noticeinsert")
	public String adminNoticeInsertGET() {
		log.debug("관리자공지사항등록페이지출력!");
		return "admin/adminnoticeinsert";
	}

	// 공지사항 등록페이지 POST
	@PostMapping("/admin-noticeinsert")
	public String adminNoticeInsertPOST(AdminNoticeDTO dto) throws Exception {
		log.debug("공지사항등록완료(관리자)!");
		noticeBoardService.AdminInsertNotice(dto);
		return "redirect:/admin/admin-notice";
	}

	// 공지사항 수정페이지 GET
	@GetMapping("/admin-noticeupdate")
	public String adminNoticeUpdateGET() {
		log.debug("관리자공지사항수정페이지출력!");
		return "admin/adminnoticeupdate";

	}

	// 공지사항 수정페이지 POST
	@PostMapping("/admin-noticeupdate")
	public String adminNoticeUpdatePOST(AdminNoticeDTO dto) throws Exception {
		log.debug("공지사항수정완료(관리자)!");
		noticeBoardService.AdminUpdateNotice(dto);
		return "redirect:/admin/admin-notice";
	}

	// 관리자 1:1문의 수정출력
	@PostMapping("/admin-qnadetailupdate")
	public String adminQnaUpdatePOST(AdminQnaDTO dto) throws Exception {
		log.debug("1:1답글완료(관리자)");
		qnaBoardService.AdminUpdateQna(dto);
		return "redirect:/admin/admin-main";
	}

	// 공지사항 삭제페이지 GET
	@GetMapping("/admin-noticedelete")
	public String adminNoticeDeleteGET() {
		log.debug("관리자공지사항삭제페이지출력!");
		return "admin/adminnoticedelete";
	}

	// 공지사항 삭제페이지 POST
	@PostMapping("/admin-noticedelete")
	public String adminNoticeDeletePOST(AdminNoticeDTO dto) throws Exception {
		log.debug("공지사항삭제완료(관리자)!");
		noticeBoardService.AdminDeleteNotice(dto);
		return "redirect:/admin/admin-notice";

	}

	// admin 회원update페이지출력(모달)
	@GetMapping("/admin-update")
	public String adminupdateGET() {
		log.debug("adminupdate페이지출력");
		return "admin/adminupdate";
	}

	// admin 사업자update페이지출력(모달)
	@GetMapping("/admin-bizupdate")
	public String adminbizupdateGET() {
		log.debug("adminbizupdate페이지출력");
		return "admin/adminbizupdate";
	}

	// admin 배너update페이지출력(모달)
	@GetMapping("/admin-bannerupdate")
	public String adminBannerupdateGET() {
		log.debug("adminBannerUpdate페이지출력");
		return "admin/adminbannerupdate";
	}

	
	// 관리자회원정보수정POST (회원번호를 받아서 조회한다음에, 해당하는 회원의 정보를 전달받아서 수정!)
	@PostMapping("/admin-update")
	public String adminupdatePOST(AdminMemberDTO dto) {
		
		String filePath = filedbService.saveFiles(dto.getFiles());
		
		log.debug("adminupdatePOST실행!");
		memberService.AdminUpdateMember(dto,filePath);
		
		return "redirect:/admin/admin-member";
	}

	
	
	// admin 사업자update정보수정POST
	@PostMapping("/admin-bizupdate")
	public String adminbizupdatePOST(AdminBizDTO dto) {
		
		String filePath = filedbService.saveFiles(dto.getFiles());
		
		log.debug("adminbizupdatePOST 실행");
		bizService.AdminUpdateBiz(dto,filePath);
		return "redirect:/admin/admin-biz";
	}

	
	
	// admin 사업자배너 update 정보수정 POST
	@PostMapping("/admin-bannerupdate")
	public String adminbannerupdatePOST(AdminBannerDTO dto) {

		// 파일저장
		String filePath = filedbService.saveFiles(dto.getFiles());

		log.info(filePath); // 업뎃(사진까지)
		bannerService.AdminUpdateBanner(filePath, dto);

		return "redirect:/admin/admin-banner";

	}
	
	
	
	
	
	// admin 회원delete페이지출력(모달)
	@GetMapping("/admin-delete")
	public String admindeleteGET() {
		log.debug("admindelete페이지출력");
		return "admin/admindelete";
	}

	// admin 사업자delete페이지GET
	@GetMapping("/admin-bizdelete")
	public String adminbizdeleteGET() {
		log.debug("adminbizdelete페이지출력!");
		return "admin/adminbizdelete";
	}

	// admin 배너delete페이지GET
	@GetMapping("/admin-bannerdelete")
	public String adminbannerDeleteGET() {
		log.debug("adminbannerDelete출력");
		return "admin/adminbannerdelete";
	}

	// admin 회원deletePOST 실행
	@PostMapping("/admin-delete")
	public String admindeletePOST(AdminMemberDTO dto) {
		memberService.AdminDeleteMember(dto);
		log.debug("admindeletePOST 삭제처리완!");
		return "redirect:/admin/admin-member";
	}

	// admin 사업자deletePOST 실행
	@PostMapping("/admin-bizdelete")
	public String adminbizdeletePOST(AdminBizDTO dto) {
		bizService.AdminDeleteBiz(dto);
		log.debug("admindeleteBizPOST처리완");
		return "redirect:/admin/admin-biz";
	}

	
	// admin 배너deletePOST실행
	@PostMapping("/admin-bannerdelete")
	public String adminbannerdeletePOST(AdminBannerDTO dto) {
		bannerService.AdminDeleteBanner(dto);
		log.debug("admindeleteBanner POST 처리!");
		return "redirect:/admin/admin-banner";
		
	}
	
	// 관리자 유저관리페이지(검색) 출력
	@GetMapping("/admin-searchmember")
	public String adminuserGET(HttpServletRequest request, Criteria cri, Model model) throws Exception {

		String searchOption = request.getParameter("searchOption");
		String searchKeyword = request.getParameter("searchKeyword");

		if (searchOption != null && !searchOption.isEmpty()) {
			cri.setSearchOption(searchOption);
		}

		if (searchKeyword != null && !searchKeyword.isEmpty()) {
			cri.setSearchKeyword(searchKeyword);
		}

		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(memberService.countSearchMemberlist(cri));

		model.addAttribute("pageVO", pageVO);

		List<Member> result = memberService.searchMemberlist(cri);

		model.addAttribute("memberlist", result);

		log.debug("admin-user관리 페이지 출력!");
		return "admin/adminsearchlist";
	}

	// 관리자 사업자관리페이지(검색) 출력
	@GetMapping("/admin-searchbiz")
	public String adminsearchbizGET(HttpServletRequest request, Criteria cri, Model model) throws Exception {

		String searchOption = request.getParameter("searchOption");
		String searchKeyword = request.getParameter("searchKeyword");

		if (searchOption != null && !searchOption.isEmpty()) {
			cri.setSearchOption(searchOption);
		}

		if (searchKeyword != null && !searchKeyword.isEmpty()) {
			cri.setSearchKeyword(searchKeyword);
		}

		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(bizService.countSearchBizlist(cri));

		model.addAttribute("pageVO", pageVO);

		List<Biz> result = bizService.searchBizMemberlist(cri);

		model.addAttribute("bizlist", result);
		log.debug(" 사업자검색리스트출력(관리자)! ");

		return "admin/adminbizsearch";
	}

	// 관리자 공지사항 검색페이지 출력
	@GetMapping("/admin-searchnotice")
	public String adminSearchNoticeGET(HttpServletRequest request, Criteria cri, Model model) throws Exception {
		String searchOption = request.getParameter("searchOption");
		String searchKeyword = request.getParameter("searchKeyword");

		if (searchOption != null && !searchOption.isEmpty()) {
			cri.setSearchOption(searchOption);
		}

		if (searchKeyword != null && !searchKeyword.isEmpty()) {
			cri.setSearchKeyword(searchKeyword);
		}

		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(noticeBoardService.countAdminSearchNoticelist(cri));

		model.addAttribute("pageVO", pageVO);

		List<NoticeBoard> result = noticeBoardService.AdminsearchNoticeBoardlist(cri);
		model.addAttribute("noticelist", result);
		return "admin/adminnoticesearch";

	}

	// 관리자 1:1문의 검색페이지출력
	@GetMapping("/admin-searchqna")
	public String adminSearchQnaGET(HttpServletRequest request, Criteria cri, Model model) throws Exception {
		String searchOption = request.getParameter("searchOption");
		String searchKeyword = request.getParameter("searchKeyword");

		if (searchOption != null && !searchOption.isEmpty()) {
			cri.setSearchOption(searchOption);
		}

		if (searchKeyword != null && !searchKeyword.isEmpty()) {
			cri.setSearchKeyword(searchKeyword);
		}

		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(qnaBoardService.countAdminSearchQnalist(cri));

		model.addAttribute("pageVO", pageVO);

		List<QnaBoard> result = qnaBoardService.AdminsearchQnaBoardlist(cri);
		model.addAttribute("qnalist", result);

		return "admin/adminqnasearch";
	}
	
	
	//결제내역 검색페이지출력
	@GetMapping("/admin-searchpayment")
	public String adminSearchPayment(HttpServletRequest request, Criteria cri, Model model) throws Exception{
		
		String searchOption = request.getParameter("searchOption");
		String searchKeyword = request.getParameter("searchKeyword");
		
		if (searchOption != null && !searchOption.isEmpty()) {
			cri.setSearchOption(searchOption);
		}

		if (searchKeyword != null && !searchKeyword.isEmpty()) {
			cri.setSearchKeyword(searchKeyword);
		}
		
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(adminProdHistoryService.countSearchPaymentlist(cri));
		
		model.addAttribute("pageVO", pageVO);
		
		List<BizHistoryDto> result = adminProdHistoryService.searchPaymentlist(cri);
		model.addAttribute("searchpaymentlist", result);
		
		return "admin/adminpaymentsearch";
		
		
		
	}
	
	
	
	
	

	
	// 회원중복체크 ( ajax 비동기 )
	@GetMapping("/checkID")
	@ResponseBody
	public String checkIDGet(@RequestParam("userid") String userid) {
		log.debug("중복체크실행!");
		Integer result = memberService.AdminCheckID(userid);
		
		if(result == 1) {
			return "duplicate";
		}else {
			return "not-duplicate";
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	

}

