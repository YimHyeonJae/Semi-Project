package com.example.persistence;

import java.util.List;

import com.example.domain.SearchCriteria;
import com.example.domain.TblbbsVO;

public interface TblbbsDAO {
    public List<TblbbsVO> sjlist(SearchCriteria cri)throws Exception;
    public int sjtotal()throws Exception;
    public void sjinsert(TblbbsVO vo)throws Exception;
    public void sjdelete(int id)throws Exception;
    public TblbbsVO sjread(int id)throws Exception;
    public void sjupdate(TblbbsVO vo)throws Exception;
    
    public List<TblbbsVO> sjslist(SearchCriteria cri)throws Exception;
    public int sjstotal(SearchCriteria cri)throws Exception;
    
    
}
