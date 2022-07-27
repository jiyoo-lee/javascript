package test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


//@WebServlet("/first")
public class first extends HttpServlet {
	PrintWriter pr = null;	//javascript를 사용할 수 있음
	
	private static final long serialVersionUID = 1L;
       
  
    public first() {
    	
    }

	
	public void init(ServletConfig config) throws ServletException {
		
	}
	//doGet : front에서 get으로 전송 또는 ajax에서 get으로 전송 할때 작동
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//request: 요청 get post이든 전송된 정보 데이터를 말합니다.
		//response: 응답 결과값을 출력하는 형태 
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset =utf-8");
		pr = response.getWriter();
		String tbody = request.getParameter("tbody").intern();
		//System.out.println(tbody);
		
		//Object ob = FileReader("index3.json");
		//System.out.println(ob);
		
		JSONParser jp = new JSONParser();
		
		try {
			
			URL url = new URL("http://jeeyulee.cafe24.com/webtest/index3.json");
			InputStream in = url.openStream(); //openStream : URL 전용
			//InputStreamReader is = new InputStreamReader(in,"UTF-8");
			BufferedReader br = new BufferedReader(new InputStreamReader(in,Charset.forName("UTF-8")));
			int a;
			
			//String(문자열) : 변경 불가능한 문자열 또한 생성
			//StringBuilder(문자열) : 변경 가능한 문자만 생성(ex: enter, 띄어쓰기는 안읽음)
			StringBuilder sb = new StringBuilder();
			while((a = br.read()) != -1) {
				sb.append((char)a);
			}
			String data = sb.toString();
			
			/*
			 * JSON,XML 파일은 숫자, 문자가 무조건 혼합되어 있다.
			 * JSONObject : json parse 사용 할 때 적용된다 (JSON 파일이 숫자 문자 섞여있어서 Object로 형변환).
			 * JSONArray : 배열에 대표 키가 있을 경우 (키 없으면 사용 x)
			 * 
			 * */
			
			
			JSONObject js = (JSONObject)jp.parse(data);
			JSONArray ba = (JSONArray)js.get("members");	//members = 대표키 .get(키이름) : 키를 가져올때 쓰임
			
			int w = 0;
			while(w < ba.size()) {	//배열 길이
				JSONObject d = (JSONObject)ba.get(w);	// 각각의 키가 존재하므로 
//				System.out.println(d.get("area").toString());
				//System.out.println(d.get("id").toString());
//				System.out.println(d.get("name").toString());
//				System.out.println(d.get("phone").toString());
				
				String id = d.get("id").toString().intern();
					if(id == tbody) {
						pr.print("<script>alert('해당 아이디를 확인하였습니다.'); history.go(-1);</script>");
						pr.close();
					}
				w++;
			}
			
			Set key = js.keySet();
			System.out.println(key);
			System.out.println(js);
			
//			System.out.println(js.get("members"));
			in.close();
			br.close();
			
			
			// 1차시도
//			FileInputStream fi = new FileInputStream("C:\\web\\webtest\\src\\main\\webapp\\index3.json");
//			InputStreamReader is = new InputStreamReader(fi,"utf8");	
//			JSONObject jo = (JSONObject)jp.parse(is);
//			System.out.println(jo);
//			is.close();
//			fi.close();
			}catch(Exception e) {
			 System.out.println(e.getMessage());
			}
	
		}

	//doPost : front에서 POST로 전송, 또는 AJXA에서 POST 전송 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//doGet(request, response);
	}

	//ajax에서만 사용
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPut(req, resp);
	} 
}
