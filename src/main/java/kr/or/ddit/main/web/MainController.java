package kr.or.ddit.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/main")
	public String main() {
		return "main";
		
		//viewName "main"
		// 우선순위에 따라서  viewResolver를 
		// 1. beanNameViewResolver
		// 1-1. bean id(name)가 "main"인 bean이 있는지 확인 -> 없음
		// 2.tilesViewResolver
		// 2-1. tiles-defination.xml에서 main이라는 이름의 defination이 있는지 확인 ==> 있음
		// 2-2. 해당 defination에 맞게 layout이 적용된 jsp를 결합하여 응답 생성
	}
	
}
