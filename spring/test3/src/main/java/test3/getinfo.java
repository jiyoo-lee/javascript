package test3;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/getinfo")

public class getinfo {
	private String TAG = getinfo.class.getSimpleName();

	//@GetMapping("/data")	//GET 데이터를 받음
	@RequestMapping(value="/t1", method=RequestMethod.GET)
	public String t1_get() {
		
		return "getinfo/t1";
	}
	
	//@PostMapping("/data2")	//POST 데이터를 받음
	@RequestMapping(value="/t2", method=RequestMethod.POST)
	public String t2_post() {
		
		return "getinfo/t2";
	}
}
