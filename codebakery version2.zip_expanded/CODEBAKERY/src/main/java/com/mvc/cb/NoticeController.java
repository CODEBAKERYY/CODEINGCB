package com.mvc.cb;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mvc.cb.biz.NoticeBiz;
import com.mvc.cb.biz.NoticeCommentBiz;
import com.mvc.cb.model.dto.NoticeCommentDto;
import com.mvc.cb.model.dto.NoticeDto;
import com.mvc.cb.model.dto.Pagination;

@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private NoticeBiz biz;
	
	@Autowired
	private NoticeCommentBiz c_biz;
	
	@RequestMapping(value = "/notice.do")
	public String noticeList(Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range){
		logger.info("NOTICE LIST");
		Pagination pagination = new Pagination();
		int listCnt = biz.pageCnt(pagination);
		pagination.pageInfo(page, range, listCnt);
		model.addAttribute("pagination",pagination);
		model.addAttribute("list",biz.selectAll(pagination));
		
		return "notice";
	}
	
	@RequestMapping(value = "/notice_view.do")
	public String noticeOne(Model model, int notice_No) {
		logger.info("NOTICE ONE");
		model.addAttribute("detail",biz.selectOne(notice_No));
		model.addAttribute("c_list",c_biz.selectAll());
		int res = biz.viewUpdate(notice_No);
		
		if( res > 0 ) {
			logger.info(notice_No+ "번 게시글 조회수 업데이트 성공");
		} else {
			logger.info(notice_No+ "번 게시글 조회수 업데이트 실패");
		}
		
		return "notice_view";
		
	}
	
	@RequestMapping(value = "/notice_write.do")
	public String noticeWrite() {
		logger.info("NOTICE WRITE");
		
		return "notice_write";
	}
	
	@RequestMapping(value = "/write_res.do")
	public String writeRes(NoticeDto dto) {
		logger.info("NOTICE WRITE RES");
		int res = biz.insert(dto);
		
		if(res>0) {
			return "redirect:notice.do";
		} else {
			return "redirect:notice_write.do";
		}
		
	}
	
	@RequestMapping(value = "/notice_delete.do")
	public String noticeDelete(int notice_No) {
		logger.info("NOTICE DELETE");
		int res = biz.delete(notice_No);
		
		if(res>0) {
			return "redirect:notice.do";
		} else {
			return "redirect:notice_view.do";
		}
	}
	
	@RequestMapping(value = "/notice_edit.do")
	public String noticeUpdate(Model model, int notice_No) {
		logger.info("NOTICE UPDATE");
		model.addAttribute("update",biz.selectOne(notice_No));
		return "notice_edit";
		
	}
	
	@RequestMapping(value = "/update_res.do")
	public String updateRes(NoticeDto dto) {
		
		logger.info("NOTICE UPDATE RES");
		int res = biz.update(dto);
		if(res>0) {
			return "redirect:notice_view.do?notice_No="+dto.getNotice_No();
		} else {
			return "redirect:notice_edit.do?notice_No="+dto.getNotice_No();
		}
		
	}
	
	@RequestMapping(value = "/comment_write.do")
	public String commentWrite(NoticeCommentDto dto) {
		
		logger.info("COMMENT WRITE");
		int res = c_biz.insert(dto);
		
		return "notice_view.do?notice_No="+dto.getNotice_No();
	}
	
}
