package kr.or.ddit.rangers.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.rangers.model.RangerVo;

@Repository
public class RangersDao implements RangersDaoInf {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	/**  
	* Method   : selectAllRangerstest 
	* 작성자 : 1003yd 
	* 변경이력 :    
	* Method 설명 :  레인저스 정보 전체 조회
	*/
	@Override
	public List<RangerVo> selectAllRangers() {
		// TODO Auto-generated method stub
		return template.selectList("rangers.selectAllRangers");
	}

	@Override
	public int insertRanger(RangerVo ranger) {
		// TODO Auto-generated method stub
		return template.insert("rangers.insertRanger", ranger);
	}

}
