package com.example.persistence;

import java.util.List;

import com.example.domain.MHInvenVO;
import com.example.domain.SearchCriteria;

public interface MHInvenDAO {
	public List<MHInvenVO> MHlist(SearchCriteria cri) throws Exception;
	public int MHtotal() throws Exception;
	public void MHinsert(MHInvenVO vo) throws Exception;
	public void MHdelete(String name) throws Exception;
	public void MHupdate(MHInvenVO vo)throws Exception;
	public MHInvenVO MHread(String name) throws Exception;
	
	// 검색기능
	public List<MHInvenVO> MHslist(SearchCriteria cri) throws Exception;
	public int MHstotal(SearchCriteria cri) throws Exception;
}
