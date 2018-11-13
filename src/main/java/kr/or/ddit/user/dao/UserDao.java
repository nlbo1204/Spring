package kr.or.ddit.user.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.util.model.PageVO;

@Repository
public class UserDao implements UserDaoInf {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	public List<UserVo> selectUserAll(){

		//selectOne : 데이터가 한건일 때
		//selectList : 여러건의 데이터를 조회
		//메소드 인자 : 문자열 = namespace(모듈명).queryId
		List<UserVo> userList = template.selectList("user.selectUserAll");
		int cntList = userList.size();
		System.out.println(cntList);

		return userList;
	}

	public UserVo selectUser(String userid){

		UserVo UserVo = (UserVo)template.selectOne("user.selectUser", userid);
		
		return UserVo;
	}


	public UserVo selectUser(UserVo UserVo){

		UserVo UserVoList = template.selectOne("user.selectUserByVo", UserVo);
		
		return UserVoList;

	}
	
	@Override
	public List<UserVo> selectUserPageList(PageVO page){
		List<UserVo> pageUserList = template.selectList("user.selectUsrPageList", page);
		
		for(UserVo UserVo : pageUserList){
			System.out.println(UserVo.getUserId());
		}
		
		return pageUserList;
	}
	
	/**  
	* Method   : getUserCnt 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @return  
	* Method 설명 : 사용자 전체 건수 조회 
	*/
	@Override
	public int getUserCnt() {
		// TODO Auto-generated method stub
		
		int cntUserList = template.selectOne("user.getUserCnt");
		
		return cntUserList;
	}
	
	/**  
	* Method   : insertUser 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param UserVo
	* @return  
	* Method 설명 : 사용자 등록
	*/
	@Override
	public int insertUser(UserVo UserVo) {
		// TODO Auto-generated method stub
		
		int insertCnt= template.insert("user.inserUser",UserVo);
		
		return insertCnt;
	}

	@Override
	public int deleteUser(String userId) {
		// TODO Auto-generated method stub
		
		int deleteCnt= template.delete("user.deleteUser",userId);
		
		//자동커밋이 안되기 때문에 db상의 데이터가 변경 시 commit을 반드시 해야한다.
		
		return deleteCnt;
	}

	/**  
	* Method   : updateUser 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param UserVo
	* @return  
	* Method 설명 : 사용자 정보 수정 
	*/
	@Override
	public int updateUser(UserVo userVo) {
		// TODO Auto-generated method stub
		int updateUserCnt = template.update("user.updateUser", userVo);
		
		return updateUserCnt;
	}
/*
	@Override
	public UserVo selectUser(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVo selectUser(UserVo userVo) {
		// TODO Auto-generated method stub
		return null;
	}*/
}
