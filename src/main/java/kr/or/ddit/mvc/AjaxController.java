package kr.or.ddit.mvc;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.user.model.UserVo;

@RequestMapping("/ajax")
@Controller
public class AjaxController {
	
	private  Logger logger = LoggerFactory.getLogger(AjaxController.class);
	
	//ajax 테스트를 위한 view 요청
	//http:/localhost:8081/ajax/view
	@RequestMapping("/view")
	public String view() {
		return "ajax/view"; // jsp(InternalViewResolver 사용)
	}
	
	//list 객체를 json으로 변환
	@ResponseBody 
	@RequestMapping(value="/getRangers", produces= {"application/json"})
	public List<UserVo> getRangers(@RequestBody UserVo userVo){
		logger.debug("json : {}", userVo);
		List<UserVo> rangers = new ArrayList<UserVo>();
		rangers.add(new UserVo("brown", "브라운"));
		rangers.add(new UserVo("sally", "샐리"));
		rangers.add(new UserVo("cony", "코니"));
		
		return rangers;
	}
	
	
}
