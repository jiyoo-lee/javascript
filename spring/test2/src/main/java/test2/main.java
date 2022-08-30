package test2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class main implements Controller{

	//spring mvc controller에서 사용하는 기본 객체 메서드입니다.
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		int a = 50;
		int b = 80;
		int c = a + b;
		ModelAndView mv = new ModelAndView();
		mv.addObject("number1",50);
		mv.addObject("number2",80);
		mv.setViewName("/WEB-INF/view/main.jsp");
		
		return mv;
	}
}
