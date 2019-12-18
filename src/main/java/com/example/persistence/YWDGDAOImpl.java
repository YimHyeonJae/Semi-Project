package com.example.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.PageMaker;
import com.example.domain.SearchCriteria;
import com.example.domain.TblbbsVO;
import com.example.domain.YWDGVO;

@Repository
public class YWDGDAOImpl implements YWDGDAO {
	
	@Inject
	SqlSession session;

	private static final String namespace = "YWDGMapper";

	@Override
	public List<YWDGVO> list(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".list", cri);
	}

	@Override
	public int total() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".total");
	}

	@Override
	public List<YWDGVO> slist(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".slist", cri);
	}

	@Override
	public int stotal(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".stotal", cri);
	}

	@Override
	public void delete(int id) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".delete", id);
	}

	@Override
	public void insert(YWDGVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public YWDGVO read(int id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".read", id);
	}

	@Override
	public void update(YWDGVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".update", vo);
	}

	
	
}
