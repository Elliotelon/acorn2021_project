package com.my.insta.file.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.my.insta.file.dto.FileDto;
import com.my.insta.file.service.FileService;


@Controller
public class FileController {
	@Autowired
	private FileService fileService;
	
	//파일 목록 보기 요청 처리 
	@RequestMapping("/main/file/list")
	public ModelAndView list(HttpServletRequest request,
			ModelAndView mView) {
		//fileService 를 이용해서 비즈니스 로직 처리하고 
		fileService.getList(request);
		//view 페이지로 forward 이동해서 응답 하기 
		mView.setViewName("main/file/list");
		return mView;
	}
	
	@RequestMapping("/main/file/private/upload_form")
	public ModelAndView uploadForm(ModelAndView mView) {
		
		mView.setViewName("main/file/private/upload_form");
		return mView;
	}
	//파일 업로드 요청 처리 
	@RequestMapping(value = "/main/file/private/upload", 
			method = RequestMethod.POST)
	public ModelAndView upload(FileDto dto, ModelAndView mView, 
			HttpServletRequest request) {
		fileService.saveFile(dto, mView, request);
		mView.setViewName("main/file/private/upload");
		return mView;
	}
	
	//파일 다운로드 요청 처리
	@RequestMapping("/main/file/download")
	public ModelAndView download(@RequestParam int num,
			ModelAndView mView) {
		//mView 에 다운로드 할 파일의 정보를 담고 
		fileService.getFileData(num, mView);
		//view 페이지로 이동해서 다운로드 시켜준다. 
		// @Component("fileDownView") 가 붙어있는 AbstractView 객체를 찾아간다. 
		mView.setViewName("fileDownView");
		return mView;
	}
	//파일 삭제 요청 처리 
	@RequestMapping("/main/file/private/delete")
	public ModelAndView delete(@RequestParam int num,
			ModelAndView mView, HttpServletRequest request) {
		fileService.deleteFile(num, request);
		mView.setViewName("redirect:/main/file/list.do");
		return mView;
	}
}
