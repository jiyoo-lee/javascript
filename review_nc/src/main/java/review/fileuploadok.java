package review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig( //파일 업로드 기능 처리 시 사용되는 어노테이션
		fileSizeThreshold = 1024 * 1024 * 1, //1mb 파일 업로드시 사용되는 메모리 용량 임시크기
		maxFileSize = 1024 * 1024 * 2, //2mb 업로드 파일 최대 크기 값
		maxRequestSize = 1024 * 1024 * 2 //2mb 전송에 따른 최대 크기 값
)

public class fileuploadok extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public fileuploadok() {
   
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		Part filepart = request.getPart("file"); //사용자 PC에 있는 이미지 경로를 저장
		
		String filename = filepart.getSubmittedFileName();	//업로드 할 파일 명을 가져옴
		System.out.println(filename);	 // 파일 이름
		
		for(Part part: request.getParts()) {	//여러개의 파일을 업로드시 모든 파일ㅇ르 서버에 저장되도록 하기 위함
			//해당 파일을 저장 할 위치에 동일한 이름으로 COPY하게 됩니다.
			part.write("C:\\myhome\\review_nc\\src\\main\\webapp\\upload\\"+filename);
		}
		
		response.getWriter().print("ok");
		
//		System.out.println(filepart);
		
		
	}
}
