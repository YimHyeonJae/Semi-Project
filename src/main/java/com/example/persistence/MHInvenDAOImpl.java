package com.example.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.domain.MHInvenVO;
import com.example.domain.SearchCriteria;

@Repository
public class MHInvenDAOImpl implements MHInvenDAO{
	
	@Inject
	SqlSession session;
	private static final String namespace="MHInvenMapper";
	
	@Override
	public List<MHInvenVO> MHlist(SearchCriteria cri) {
		
		return session.selectList(namespace + ".list", cri);
	}
	

	@Override
	public void MHinsert(MHInvenVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public MHInvenVO MHread(String name) throws Exception {
		return session.selectOne(namespace + ".read", name);
	}

	@Override
	public void MHdelete(String name) throws Exception {
		session.delete(namespace + ".delete", name);
		
	}

	@Override
	public void MHupdate(MHInvenVO vo) throws Exception {
		session.update(namespace + ".update", vo);
		
	}



	@Override
	public int MHtotal() throws Exception {
		return session.selectOne(namespace + ".total");
	}



	@Override
	public List<MHInvenVO> MHslist(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".slist", cri);
	}



	@Override
	public int MHstotal(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".stotal", cri);	
	}

}
