package com.my.insta.comment.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.my.insta.comment.dto.CommentDto;
import com.my.insta.gallery.dto.GalleryDto;



public interface CommentService {
	//새글을 저장하는 메소드
	public void saveContent(GalleryDto dto);
	//글목록을 얻어오고 페이징 처리에 필요한 값들을 ModelAndView 객체에 담아주는 메소드
	public void getList(ModelAndView mView, HttpServletRequest request);
	//글 하나의 정보를 ModelAndView 객체에 담아주는 메소드
	public void getDetail(int num, ModelAndView mView);
	
	//댓글을 저장하는 메소드
	public void saveComment(HttpServletRequest request);
	//댓글 삭제
	public void deleteComment(HttpServletRequest request);
	//댓글 수정
	public void updateComment(CommentDto dto);
	//댓글 추가 응답
	public void moreCommentList(HttpServletRequest request);

}
