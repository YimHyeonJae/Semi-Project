package com.example.persistence;

import java.util.List;

import com.example.domain.SearchCriteria;
import com.example.domain.YWDGVO;

public interface YWDGDAO {
	public List<YWDGVO> list(SearchCriteria cri) throws Exception;
	public int total() throws Exception;
	public void delete(int id) throws Exception;
	public void insert(YWDGVO vo) throws Exception;
	public YWDGVO read(int no) throws Exception;
	public void update(YWDGVO vo) throws Exception;
	
	// 검색 기능
	public List<YWDGVO> slist(SearchCriteria cri) throws Exception;
	public int stotal(SearchCriteria cri) throws Exception;
	
}
