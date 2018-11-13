package kr.or.ddit.prod.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.prod.model.ProdAllVo;
import kr.or.ddit.prod.model.ProdDetailVo;
import kr.or.ddit.util.model.PageVO;

@Repository
public class ProdListDao implements ProdListDaoInf {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	
	@Override
	public List<ProdAllVo> prodAllList(PageVO page) {
		// TODO Auto-generated method stub
		List<ProdAllVo> prodList = template.selectList("prod.prodAllList", page);
		
		return prodList;
	}

	@Override
	public ProdDetailVo prodDetailList(String prodId) {
		// TODO Auto-generated method stub
		
		ProdDetailVo prodDetailList = template.selectOne("prod.prodDetailList", prodId);
		
		return prodDetailList;
	}

	@Override
	public int prodCnt() {
		// TODO Auto-generated method stub
		
		int cnt = template.selectOne("prod.prodCnt");
		
		return cnt;
	}

}
