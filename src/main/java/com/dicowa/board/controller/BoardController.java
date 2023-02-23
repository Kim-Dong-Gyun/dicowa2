package com.dicowa.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dicowa.board.domain.BoardDto;
import com.dicowa.board.domain.Criteria;
import com.dicowa.board.domain.MemberDto;
import com.dicowa.board.domain.PageMaker;
import com.dicowa.board.domain.ReplyDto;
import com.dicowa.board.domain.SearchCriteria;
import com.dicowa.board.service.BoardService;
import com.dicowa.board.service.EventService;
import com.dicowa.board.service.NoticeService;
import com.dicowa.board.service.ReplyService;



@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	EventService eventService;
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	ReplyService replyService;
	
	
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String Pread(BoardDto boardDto, Model m, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("read");
		
		m.addAttribute("boardDto", boardService.read(boardDto.getBno()));
		m.addAttribute("scri", scri);
		
		List<ReplyDto> replyList = replyService.readReply(boardDto.getBno());
		m.addAttribute("replyList", replyList);
		
		return "read";
	}
	
	@RequestMapping(value = "/eventRead", method = RequestMethod.GET)
	public String Eread(BoardDto boardDto, Model m, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("eventRead");
		
		m.addAttribute("boardDto", eventService.read(boardDto.getBno()));
		m.addAttribute("scri", scri);
		
		List<ReplyDto> replyList = replyService.readReplyE(boardDto.getBno());
		m.addAttribute("replyList", replyList);
		
		return "eventRead";
	}
	
	@RequestMapping(value = "/noticeRead", method = RequestMethod.GET)
	public String Nread(BoardDto boardDto, Model m, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("noticeRead");
		
		m.addAttribute("boardDto", noticeService.read(boardDto.getBno()));
		m.addAttribute("scri", scri);
		
		List<ReplyDto> replyList = replyService.readReplyN(boardDto.getBno());
		m.addAttribute("replyList", replyList);
		
		return "noticeRead";
	}
	
// ----------------------------------------------------------------------------------------------------
	
	@RequestMapping(value = "/writePost", method = RequestMethod.GET)
	public void writePost() throws Exception{
		logger.info("writePost");
		
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardDto boardDto) throws Exception{
		logger.info("write");
		String url = "";
		System.out.println(boardDto);
		if(boardDto.getCate().equals("n")) {
			noticeService.write(boardDto);
			url = "redirect:/noticeList";
		}else if(boardDto.getCate().equals("p")) {
			boardService.write(boardDto);
			url= "redirect:/promoList";
		}else if(boardDto.getCate().equals("e")) {
			eventService.write(boardDto);
			url = "redirect:/eventList";
		}
		return url;
	}
	//--------------------------------------------------------------------------------
	
	//-----------------------수정------------------------------------------------------
	@RequestMapping(value = "/updateNotice", method = RequestMethod.GET)
	public String updateNotice(@RequestParam("bno")Integer bno, Model m) throws Exception{
		logger.info("updateNotice");
		

		m.addAttribute("update", noticeService.read(bno));
		
		return "updateNotice";
		
	}
	
	@RequestMapping(value = "/updateN", method = RequestMethod.POST)
	public String updateN(BoardDto boardDto, HttpSession session) throws Exception{
		logger.info("update");
		
		MemberDto writer = (MemberDto)session.getAttribute("member");
		
		
		boardDto.setWriter(writer.getUserId());
		
		noticeService.update(boardDto);
		
		return "redirect:noticeList";
	}
	
	
	@RequestMapping(value = "/updateEvent", method = RequestMethod.GET)
	public String updateEvent(@RequestParam("bno")Integer bno, Model m) throws Exception{
		logger.info("updateEvent");
		

		m.addAttribute("update", eventService.read(bno));
		
		return "updateEvent";
		
	}
	
	@RequestMapping(value = "/updateE", method = RequestMethod.POST)
	public String updateE(BoardDto boardDto, HttpSession session) throws Exception{
		logger.info("update");
		
		MemberDto writer = (MemberDto)session.getAttribute("member");
		
		
		boardDto.setWriter(writer.getUserId());
		
		eventService.update(boardDto);
		
		return "redirect:eventList";
	}
	
	
	
	@RequestMapping(value = "/updatePromo", method = RequestMethod.GET)
	public String updatePromo(@RequestParam("bno")Integer bno, Model m) throws Exception{
		logger.info("updatePromo");
		

		m.addAttribute("update", boardService.read(bno));
		
		return "updatePromo";
		
	}
	
	@RequestMapping(value = "/updateP", method = RequestMethod.POST)
	public String updateP(BoardDto boardDto, HttpSession session) throws Exception{
		logger.info("update");
		
		MemberDto writer = (MemberDto)session.getAttribute("member");
		
		
		boardDto.setWriter(writer.getUserId());
		
		boardService.update(boardDto);
		
		return "redirect:promoList";
	}
	
	//------------------삭제--------------------------------------
	//-----------------------------------------------------------
	
	@RequestMapping(value = "/deleteP", method = RequestMethod.POST)
	public String deleteP(BoardDto boardDto, HttpSession session) throws Exception{
		logger.info("deleteP");
		MemberDto writer = (MemberDto)session.getAttribute("member");
		
		
		
		boardDto.setWriter(writer.getUserId());

		boardService.delete(boardDto);
		
		return "redirect:promoList";
	}
	
	@RequestMapping(value = "/deleteN", method = RequestMethod.POST)
	public String deleteN(BoardDto boardDto, HttpSession session) throws Exception{
		logger.info("deleteN");
		MemberDto writer = (MemberDto)session.getAttribute("member");
		
		
		boardDto.setWriter(writer.getUserId());

		noticeService.delete(boardDto);
		
		return "redirect:noticeList";
	}
	
	@RequestMapping(value = "/deleteE", method = RequestMethod.POST)
	public String deleteE(BoardDto boardDto, HttpSession session) throws Exception{
		logger.info("deleteE");
		MemberDto writer = (MemberDto)session.getAttribute("member");
		
		
		boardDto.setWriter(writer.getUserId());

		eventService.delete(boardDto);
		
		return "redirect:eventList";
	}
	
	//-------------------목록---------------------------------------
	@RequestMapping(value = "/promoList", method = RequestMethod.GET)
	public String promoList(Model m, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("promoList");
		
		m.addAttribute("boardDto", boardService.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(scri));
		m.addAttribute("pageMaker", pageMaker);
		
		return "promoList";
	}
	
	@RequestMapping(value = "/rankList", method = RequestMethod.GET)
	public String rankList(Model m,  @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("rankList");
		
		m.addAttribute("boardDto", boardService.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(scri));
		m.addAttribute("pageMaker", pageMaker);
		
		return "rankList";
	}
	
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(Model m, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("noticeList");
		
		m.addAttribute("boardDto",noticeService.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(noticeService.listCount(scri));
		
		m.addAttribute("pageMaker", pageMaker);
		
		return "noticeList";
	}
	
	@RequestMapping(value="/eventList", method = RequestMethod.GET)
	public String eventList(Model m, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("eventList");
		
		m.addAttribute("boardDto", eventService.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(eventService.listCount(scri));
		
		m.addAttribute("pageMaker", pageMaker);
		
		return "eventList";
	}

	// ------------------------댓글작성--------------
	
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWrite(HttpSession session,ReplyDto dto, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("reply Wrtie");
		MemberDto writer = (MemberDto)session.getAttribute("member");
		replyService.writeReply(dto);
		
		dto.setWriter(writer.getUserId());
		rttr.addAttribute("bno" , dto.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/read";
		
	}
	
	@RequestMapping(value = "/replyWriteN", method = RequestMethod.POST)
	public String replyWriteN(HttpSession session,ReplyDto dto, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("reply WrtieN");
		MemberDto writer = (MemberDto)session.getAttribute("member");
		replyService.writeReplyN(dto);
		
		dto.setWriter(writer.getUserId());
		rttr.addAttribute("bno" , dto.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/noticeRead";
		
	}

	@RequestMapping(value = "/replyWriteE", method = RequestMethod.POST)
	public String replyWriteE(HttpSession session,ReplyDto dto, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("reply WrtieE");
		MemberDto writer = (MemberDto)session.getAttribute("member");
		replyService.writeReplyE(dto);
		
		dto.setWriter(writer.getUserId());
		rttr.addAttribute("bno" , dto.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/eventRead";
		
	}
	
	// -----------------------댓글 수정---------------------------------
	
	@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(ReplyDto dto, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply Write");
		
		model.addAttribute("replyUpdate", replyService.selectReply(dto.getRno()));
		model.addAttribute("scri", scri);
		
		return "replyUpdateView";
	}
	
	@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyDto dto, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
		
		replyService.updateReply(dto);
		
		rttr.addAttribute("bno", dto.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/read?bno=" + dto.getBno();
	}
	
	@RequestMapping(value="/replyUpdateViewN", method = RequestMethod.GET)
	public String replyUpdateViewN(ReplyDto dto, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply WriteN");
		
		model.addAttribute("replyUpdate", replyService.selectReplyN(dto.getRno()));
		model.addAttribute("scri", scri);
		
		return "replyUpdateViewN";
	}
	
	@RequestMapping(value="/replyUpdateN", method = RequestMethod.POST)
	public String replyUpdateN(ReplyDto dto, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply WriteN");
		
		replyService.updateReplyN(dto);
		
		rttr.addAttribute("bno", dto.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/noticeRead?bno=" + dto.getBno();
	}
	
	@RequestMapping(value="/replyUpdateViewE", method = RequestMethod.GET)
	public String replyUpdateViewE(ReplyDto dto, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply WriteE");
		
		model.addAttribute("replyUpdate", replyService.selectReplyE(dto.getRno()));
		model.addAttribute("scri", scri);
		
		return "replyUpdateViewE";
	}
	
	@RequestMapping(value="/replyUpdateE", method = RequestMethod.POST)
	public String replyUpdateE(ReplyDto dto, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply WriteE");
		
		replyService.updateReplyE(dto);
		
		rttr.addAttribute("bno", dto.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/eventRead?bno=" + dto.getBno();
	}
	
	// ----------------------------댓글 삭제 -------------------------------------
	
	@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
	public String replyDeleteView(ReplyDto dto, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply Write");
		
		model.addAttribute("replyDelete", replyService.selectReply(dto.getRno()));
		model.addAttribute("scri", scri);
		

		return "replyDeleteView";
	}
	
	@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReplyDto dto, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
		
		replyService.deleteReply(dto);
		
		rttr.addAttribute("bno", dto.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/read?bno=" + dto.getBno();
	}
	
	@RequestMapping(value="/replyDeleteViewN", method = RequestMethod.GET)
	public String replyDeleteViewN(ReplyDto dto, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply WriteN");
		
		model.addAttribute("replyDelete", replyService.selectReplyN(dto.getRno()));
		model.addAttribute("scri", scri);
		

		return "replyDeleteViewN";
	}
	
	@RequestMapping(value="/replyDeleteN", method = RequestMethod.POST)
	public String replyDeleteN(ReplyDto dto, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply WriteN");
		
		replyService.deleteReplyN(dto);
		
		rttr.addAttribute("bno", dto.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/noticeRead?bno=" + dto.getBno();
	}
	
	@RequestMapping(value="/replyDeleteViewE", method = RequestMethod.GET)
	public String replyDeleteViewE(ReplyDto dto, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply WriteE");
		
		model.addAttribute("replyDelete", replyService.selectReplyE(dto.getRno()));
		model.addAttribute("scri", scri);
		

		return "replyDeleteViewE";
	}
	
	@RequestMapping(value="/replyDeleteE", method = RequestMethod.POST)
	public String replyDeleteE(ReplyDto dto, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply WriteE");
		
		replyService.deleteReplyE(dto);
		
		rttr.addAttribute("bno", dto.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/eventRead?bno=" + dto.getBno();
	}
	
}
