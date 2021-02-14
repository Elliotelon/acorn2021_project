package com.my.insta.comment.dao;

import java.util.List;

import com.my.insta.comment.dto.CommentDto;



public interface CommentDao {
	//댓글 목록 얻어오기
	public List<CommentDto> getList(CommentDto dto);
	//댓글 추가
	public void insert(CommentDto dto);
	//댓글 수정
	public void update(CommentDto dto);
	//댓글 삭제
	public void delete(int num);
	//댓글의 시퀀스값(글번호) 를 리턴하는 메소드
	public int getSequence();
	//댓글 하나의 정보를 리턴하는 메소드
	public CommentDto getData(int num);
	//댓글의 갯수를 리턴하는 메소드
	public int getCount(int ref_group);
}

