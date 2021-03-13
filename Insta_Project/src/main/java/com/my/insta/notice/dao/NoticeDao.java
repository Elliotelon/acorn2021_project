package com.my.insta.notice.dao;

import java.util.List;

import com.my.insta.notice.dto.NoticeDto;





public interface NoticeDao {
	//글 추가
	public void insert(NoticeDto dto);
	//글 수정
	public void update(NoticeDto dto);
	//글 삭제
	public void delete(int num);
	//글 하나의 정보 얻어오기
	public NoticeDto getData(int num);
	//글 목록 얻어오기 (페이징 처리와 검색 키워드를 고려한 목록)
	public List<NoticeDto> getList(NoticeDto dto);
	//글의 갯수 얻어오기(검색 키워드에 해당하는 갯수)
	public int getCount(NoticeDto dto);
	//글 조회수 올리기
	public void addViewCount(int num);
	
	
}
