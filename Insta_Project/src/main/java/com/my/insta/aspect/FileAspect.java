package com.my.insta.aspect;
/*
 * aspect를 사용하는 이유는 
 * 메소드안에 공통으로 사용해야 하는 코드가 있는 경우 
 * 메소드를 작성할때마다 공통된 코드를 작성하지 않고
 * aspect에 미리 공통된 코드를 작성해두고 사용하면 효율적으로 코드를 작성할 수 있기 때문이다.
 *  
 */
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.my.insta.file.dao.FileDao;
import com.my.insta.file.dto.FileDto;

@Aspect
@Component
public class FileAspect {
	@Autowired
	private FileDao dao;
	/*
	 * com.gura.spring05.file.service 패키지에 있는
	 * 모든 클래스 중에 delete로 시작하는 모든 메소드에 적용할 aspect
	 */
	@Around("execution(void com.my.insta.file.service.*.delete*(..))")
	public void checkDelete(ProceedingJoinPoint joinPoint) throws Throwable {
		//필요한 값을 담을 지역 변수 미리 만들기(메소드에 전달된 인자로 부터 찾아야 한다)
		int num=0;
		HttpServletRequest request=null;
		//메소드의 인자로 전달된 값을 배열로 얻어내기
		Object[] args=joinPoint.getArgs();
		//반복문 돌면서
		for(Object tmp:args) {
			//필요한 type을 찾아서 casting 한다.
			if(tmp instanceof Integer) {
				//자료실 파일번호
				num=(Integer)tmp;
			}else if(tmp instanceof HttpServletRequest) {
				//HttpSession을 얻어낼 HttpServletRequest 객체
				request=(HttpServletRequest)tmp;
			}
		}
		//파일 번호를 이용해서 파일 정보를 얻어온다.
		FileDto dto=dao.getData(num);
		//로그인된 아이디
		String id=(String)request.getSession().getAttribute("id");
		//만일 로그인된 아이디와 파일 작성자가 다르다면
		//if(!id.equals(dto.getWriter())) {
		//	throw new NotAllowException("남의 파일을 지울수 없습니다.");
		//}
		joinPoint.proceed();
	}
}
