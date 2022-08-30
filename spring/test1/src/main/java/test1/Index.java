package test1;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class Index implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","Spring 잘 되고 있습니다.");
		mv.addObject("data1","홍길동");
		//setView : URL이 이동되면서 완전 다른 화면으로 이동 할 때 (그냥 이동)
		//setViewName : URL 변화가 없고, 해당 화면을 자신의 페이지에서 출력 및 request가 가능함
		mv.setViewName("WEB-INF/view/index.jsp");
		String aaa ="hong";
		request.setAttribute("id", aaa);
		
		return mv;
	}
}
