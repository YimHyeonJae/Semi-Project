package com.example.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.domain.SearchCriteria;
import com.example.domain.TblbbsVO;

@Repository
public class TblbbsDAOImpl implements TblbbsDAO{
    
	@Inject
    SqlSession session;
    private static final String namespace="TblbbsMapper";
	@Override
	public List<TblbbsVO> sjlist(SearchCriteria cri) throws Exception{
		return session.selectList(namespace+".list",cri);
	}

	@Override
	public void sjinsert(TblbbsVO vo) throws Exception {
		session.insert(namespace+".insert",vo);
		
	}

	@Override
	public void sjdelete(int id) throws Exception {
		session.delete(namespace+".delete",id);
		
	}

	@Override
	public TblbbsVO sjread(int id) throws Exception {
		return session.selectOne(namespace+".read",id);
	}

	@Override
	public void sjupdate(TblbbsVO vo) throws Exception {
		session.update(namespace+".update",vo);
	}

	@Override
	public int sjtotal() throws Exception {
		return session.selectOne(namespace+".total");
	}

	@Override
	public List<TblbbsVO> sjslist(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+ ".slist",cri);
	}

	@Override
	public int sjstotal(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".stotal",cri);
	}
}
