package test2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class postok implements Controller  {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String a = request.getParameter("mid");
		ModelAndView mv = new ModelAndView();
		mv.addObject("mid",a);
		return mv;
	}
	
	public void abc (String a) {
		
	}
}
