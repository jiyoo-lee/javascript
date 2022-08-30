/* test2라는 패키지에 admin이라는 패키지를 포함시킴
 * 실제 view part와 동일한 디렉토리를 가지게 됩니다. */
package test2.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class main_control implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*ModelAndView(로드 할 view파일명 및 디렉토리를 설정) 이유는 class이름과 view파일 이름이 서로 다를 경우 사용하는 방식*/
		ModelAndView mv = new ModelAndView("admin/main");
		return mv;
	}
	

}
