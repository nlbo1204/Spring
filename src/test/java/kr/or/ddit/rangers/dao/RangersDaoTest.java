package kr.or.ddit.rangers.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;
import javax.annotation.Resource;
import org.junit.Test;
import kr.or.ddit.rangers.model.RangerVo;
import kr.or.ddit.test.ServiceDaoTestConfig;

public class RangersDaoTest extends ServiceDaoTestConfig {
	@Resource(name="rangersDao")
	private RangersDaoInf rangerDao;
	
	/**  
	* Method   : selectAllRangerstest =
	* 작성자 : 1003yd 
	* 변경이력 :    
	* Method 설명 :  레인저스 정보 전체 조회
	*/
	@Test
	public void selectAllRangerstest() {
		/***Given***/
		
		/***When***/
		List<RangerVo> rangersList = rangerDao.selectAllRangers();
		
		
		/***Then***/
		assertEquals(3, rangersList.size());
	}
	
	/**  
	* Method   : insertRangerTest 
	* 작성자 : 1003yd 
	* 변경이력 :    
	* Method 설명 : ranger 입력 테스트 
	*/
	@Test
	public void insertRangerTest() {
		
		/***Given***/
		RangerVo ranger = new RangerVo();
		ranger.setRangersId("moon");
		ranger.setName("문");
		
		/***When***/
		int insertCnt = rangerDao.insertRanger(ranger);
		/***Then***/
		assertEquals(1, insertCnt);
		
	}

}
