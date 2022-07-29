package ex;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ex6 extends HttpServlet {
	int number = 0;
	private static final long serialVersionUID = 1L;
       
    public ex6() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String[] arr = {"초등학교 1학년 1년 앞당겨진다.","한국 우주탐사선 '다누리' 내달 5일...","우영우 '열풍', 세계로 번졌다","열대야,폭염 계속..제5호 태풍 송다 발달","불법복제 베트남서 NHN철수..."};
		if(number == arr.length) {
			this.number = 0;
		}
		String calldata = arr[number];
		response.getWriter().print(calldata);		
		
		this.number++;		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
