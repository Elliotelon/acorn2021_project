package com.my.insta.file.view;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

import com.my.insta.file.dto.FileDto;

/*
 *  [ View 를 만들어서 동작 시키는 방법 ]
 *  
 *  - AbstractView 추상클래스를 상속받아서 클래스를 정의한다.
 *  - @Component("bean 의 이름 지정") 어노테이션을 붙여서 이름이 있는 bean 이 되게 한다.
 *  - servlet-context.xml 에 BeanNameViewResolver 설정을 추가한다. 
 */
@Component("fileDownView")
public class FileDownView extends AbstractView{
	
	//이 메소드에서 클라이언트에게 응답하면 된다. 
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//ModelAndView 객체에 .addObject() 해서 담은 객체는 model 에 들어 있다.
		FileDto dto=(FileDto)model.get("dto");
		//3. 해당 파일을 실제로 다운로드 시켜준다(응답)
	 	//다운로드 시켜주기 ... 
		String orgFileName=dto.getOrgFileName(); //원본 파일명
		String saveFileName=dto.getSaveFileName(); //저장된 파일명
		
		//다운로드 시켜줄 파일의 실제 경로 구성하기
		String path=request.getServletContext().getRealPath("/upload")
				+File.separator+saveFileName;
		
		//System.out.println(path);
		//다운로드 할 파일을 읽어올 스트림 객체 생성하기
		FileInputStream fis=new FileInputStream(path);
		
		//다운로드 시켜주는 작업을 한다. (실제 파일 데이터와 원본파일명을 보내줘야한다.)
		//다운로드 시켜주는 작업을 한다. 
		String encodedName=null;
		//System.out.println(request.getHeader("User-Agent"));
		//한글 파일명 세부처리 
		if(request.getHeader("User-Agent").contains("Firefox")){
			//벤더사가 파이어 폭스인경우 
			encodedName=new String
				(orgFileName.getBytes("utf-8"),"ISO-8859-1");
		}else{ //그외 다른 벤더사 
			encodedName=URLEncoder.encode(orgFileName, "utf-8");
			//파일명에 공백이있는 경우 처리 
			encodedName=encodedName.replaceAll("\\+"," ");
		}
		
		//응답 헤더 정보 설정
		response.setHeader("Content-Disposition","attachment;filename="+encodedName);
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		//다운로드할 파일의 크기 읽어와서 다운로드할 파일의 크기 설정
		response.setContentLengthLong(dto.getFileSize());
		
		//클라이언트에게 출력할수 있는 스트림 객체 얻어오기
		BufferedOutputStream bos=
			new BufferedOutputStream(response.getOutputStream());
		//한번에 최대 1M byte 씩 읽어올수 있는 버퍼
		byte[] buffer=new byte[1024*1000];
		int readedByte=0;
		//반복문 돌면서 출력해주기
		while(true){
			//byte[] 객체를 이용해서 파일에서 byte 알갱이 읽어오기
			readedByte = fis.read(buffer);
			if(readedByte == -1)break; //더이상 읽을 데이터가 없다면 반복문 빠져 나오기
			//buffer 배열의 0번방에서 부터 읽은 만큼 출력하기
			bos.write(buffer, 0, readedByte);
			bos.flush(); //출력
		}
		//스트림 닫아주기
		bos.close();
		fis.close();    			
	}

}

