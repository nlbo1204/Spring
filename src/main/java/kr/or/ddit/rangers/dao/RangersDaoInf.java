package kr.or.ddit.rangers.dao;

import java.util.List;

import kr.or.ddit.rangers.model.RangerVo;

public interface RangersDaoInf {

	/**  
	* Method   : selectAllRangers 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @return  
	* Method 설명 :  레인저스 전체 정보 조회
	*/
	List<RangerVo> selectAllRangers();

	int insertRanger(RangerVo ranger);
	
}
