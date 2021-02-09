package com.my.insta.gallery.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.insta.gallery.dto.GalleryDto;
import com.my.insta.gallery.service.GalleryService;

@Controller
public class GalleryController {
	@Autowired
	private GalleryService service;
	
	@RequestMapping("/main/gallery/list.do")
	public ModelAndView list(ModelAndView mView, HttpServletRequest request) {
		service.getList(mView, request);
		mView.setViewName("/main/gallery/list");
		return mView;
	}
	@RequestMapping("/main/gallery/ajax_page")
	public ModelAndView ajaxPage(ModelAndView mView, HttpServletRequest request) {
		service.getList(mView, request);
		mView.setViewName("/main/gallery/ajax_page");
		return mView;
	}
	@RequestMapping("/main/gallery/private/upload_form")
	public String uploadForm() {
		return "/main/gallery/private/upload_form";
	}
	@RequestMapping(value = "/main/gallery/private/upload", method = RequestMethod.POST)
	public String upload(GalleryDto dto, HttpServletRequest request) {
		service.saveContent(dto, request);
		return "redirect:/main/gallery/list.do";
	}
	@RequestMapping("/main/gallery/private/ajax_form")
	public String ajaxForm() {
		
		return "/main/gallery/private/ajax_form";
	}
	@RequestMapping(value = "/main/gallery/private/ajax_upload", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxUpload(MultipartFile image, HttpServletRequest request){
		//업로드된 이미지를 upload 폴더에 저장하고 경로를 리턴 받는다.
		String imagePath=service.saveImage(image, request);
		//저장된 경로를 JSON 문자열로 응답하기 위해 Map 에 담는다.
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("imagePath", imagePath);
		//Map  을 리턴해서 JSON 문자열이 응답되도록 한다. {"imagePath":"/upload/xxx.jpg"} 형식
		return map;
	}
	@RequestMapping(value = "/main/gallery/private/insert", method=RequestMethod.POST)
	public String insert(GalleryDto dto, HttpSession session) {
		service.addContent(dto, session);
		return "redirect:/main/gallery/list.do";
	}
	@RequestMapping("/main/gallery/detail")
	public ModelAndView detail(@RequestParam int num, ModelAndView mView) {
		service.getDetail(num, mView);
		mView.setViewName("/main/gallery/detail");
		return mView;
	}
}
