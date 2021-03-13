package com.my.insta.notice.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.my.insta.notice.dto.NoticeCommentDto;
import com.my.insta.notice.dto.NoticeDto;

public interface NoticeService {
	//새글을 저장하는 메소드
	public void saveContent(NoticeDto dto);
	//글목록을 얻어오고 페이징 처리에 필요한 값들을 ModelAndView 객체에 담아주는 메소드
	public void getList(ModelAndView mView, HttpServletRequest request);
	//글 하나의 정보를 ModelAndView 객체에 담아주는 메소드
	public void getDetail(int num, ModelAndView mView);
	//글 수정 하는 메소드
	public void updateContent(NoticeDto dto);
	//글 삭제 하는 메소드
	public void deleteContent(int num);
	//댓글을 저장하는 메소드
	public void saveComment(HttpServletRequest request);
	//댓글 삭제
	public void deleteComment(HttpServletRequest request);
	//댓글 수정
	public void updateComment(NoticeCommentDto dto);
	//댓글 추가 응답
	public void moreCommentList(HttpServletRequest request);

}
