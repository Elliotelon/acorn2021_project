package com.my.insta.comment.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.insta.comment.dto.CommentDto;
import com.my.insta.comment.service.CommentService;



@Controller
public class CommentController {
	//의존객체 DI
	@Autowired
	private CommentService service;
	
	@RequestMapping("/main/gallery/ajax_comment_list")
	public ModelAndView ajaxCommentList(HttpServletRequest request,
			ModelAndView mView) {
		service.moreCommentList(request);
		mView.setViewName("main/gallery/ajax_comment_list");
		return mView;
	}
	
	//댓글 수정 ajax 요청에 대한 요청 처리 
	@RequestMapping(value = "/main/gallery/private/comment_update", 
			method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> commentUpdate(CommentDto dto){
		//댓글을 수정 반영하고 
		service.updateComment(dto);
		//JSON 문자열을 클라이언트에게 응답한다.
		Map<String, Object> map=new HashMap();
		map.put("num", dto.getNum());
		map.put("content", dto.getContent());
		return map;
	}
	//댓글삭제
	@RequestMapping("/main/gallery/private/comment_delete")
	public ModelAndView commentDelete(HttpServletRequest request,
			ModelAndView mView, @RequestParam int ref_group) {
		service.deleteComment(request);
		mView.setViewName("redirect:/main/gallery/comment.do?num="+ref_group);
		return mView;
	}
	
	//새 댓글 저장 요청 처리
	@RequestMapping(value = "/main/gallery/private/comment_insert", 
			method = RequestMethod.POST)
	public String commentInsert(HttpServletRequest request,
			@RequestParam int ref_group) {
		//새 댓글을 저장하고
		service.saveComment(request);
		//글 자세히 보기로 다시 리다일렉트 이동 시킨다.
		//ref_group 은 자세히 보기 했던 글번호 
		return "redirect:/main/gallery/comment.do?num="+ref_group;
	}
	
	@RequestMapping("/main/gallery/comment")
	public ModelAndView comment(@RequestParam int num, ModelAndView mView) {
		//자세히 보여줄 글번호가 파라미터로 넘어온다.
		service.getDetail(num, mView);
		//view page 로 forward 이동해서 응답
		mView.setViewName("main/gallery/detail");
		return mView;
	}
	
}
