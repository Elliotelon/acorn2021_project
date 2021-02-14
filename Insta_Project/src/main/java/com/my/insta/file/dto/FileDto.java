package com.my.insta.file.dto;

import org.springframework.web.multipart.MultipartFile;

public class FileDto {
	private int num;
	private String writer;
	private String title;
	private String orgFileName;
	private String saveFileName;
	private long fileSize; //파일의 크기는 byte 단위로 다루기 때문에 long int 형으로 사용한다. 
	private String regdate;
	//페이징 처리를 하기 위한 필드 
	private int startRowNum;
	private int endRowNum;
	//업로드되는 파일의 정보를 담을 필드 
	private MultipartFile myFile;
	
	public FileDto() {}

	public FileDto(int num, String writer, String title, String orgFileName, String saveFileName, long fileSize,
			String regdate, int startRowNum, int endRowNum, MultipartFile myFile) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.myFile = myFile;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public MultipartFile getMyFile() {
		return myFile;
	}

	public void setMyFile(MultipartFile myFile) {
		this.myFile = myFile;
	}
	
	
}
