package test2.exercise;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class contact implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//점 찍는 이유는 tiles.xml과 연동
		// 그 외에는 /가 기본으로 사용되어야 함
		ModelAndView mv = new ModelAndView("exercise.contact");
		return mv;
	}
}
