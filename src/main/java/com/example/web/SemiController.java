package com.example.web;

import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.MHInvenVO;
import com.example.domain.PageMaker;
import com.example.domain.ScheduleVO;
import com.example.domain.SearchCriteria;
import com.example.domain.SearchVO;
import com.example.domain.TblbbsVO;
import com.example.domain.ViewVO;
import com.example.domain.YWDGVO;
import com.example.persistence.MHInvenDAO;
import com.example.persistence.TblbbsDAO;
import com.example.persistence.YWDGDAO;

@Controller
public class SemiController {

	@RequestMapping("board")
	public String board(){
		return "board";
	}
	
	@ResponseBody
	@RequestMapping("search.json")
	public ArrayList<SearchVO> search(){
		ArrayList<SearchVO> array = new ArrayList<SearchVO>();
		try{
			Document doc = Jsoup.connect("http://www.inven.co.kr/webzine/").get();
			Elements es = doc.select(".rankingwrap ul");
			for(Element e:es.select("li")){
				SearchVO vo = new SearchVO();
				vo.setRank(e.select(".ranknum").text());
				vo.setLink(e.select(".ranksubject a").attr("href"));
				vo.setName(e.select(".ranksubject").text());
				array.add(vo);
			}
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return array;
	}
	
	@ResponseBody
	@RequestMapping("schedule.json")
		public ArrayList<ScheduleVO> schedule(){
		ArrayList<ScheduleVO> array = new ArrayList<ScheduleVO>();
		try{
			Document doc = Jsoup.connect("http://www.inven.co.kr/webzine/").get();
			Elements es = doc.select(".schedule_list tbody");
			for(Element e:es.select("tr")){
				ScheduleVO vo = new ScheduleVO();
				vo.setGname(e.select("tr .gamename").text());
				vo.setGlink(e.select("a").attr("href"));
				array.add(vo);
			}
		} catch(Exception e){
			System.out.println(e.toString());
		}
		return array;
		
	}

	// øµøı¿Ã«¸ Page
	
	@Inject
	YWDGDAO ywdao;

	@ResponseBody
	@RequestMapping("YWlist.json")
	public HashMap<String, Object> listJSON(SearchCriteria cri) throws Exception {
		System.out.println(cri.toString());

		HashMap<String, Object> map = new HashMap<String, Object>();
		cri.setPerPageNum(10);
		map.put("list", ywdao.slist(cri));
		map.put("total", ywdao.stotal(cri));

		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(ywdao.stotal(cri));
		map.put("pm", pm);

		return map;
	}

	@RequestMapping("YWlist")
	public String list() {
		return "YWlist";
	}

	@RequestMapping("YWinsert")
	public String insert() {
		return "YWinsert";
	}

	@ResponseBody
	@RequestMapping(value = "YWdelete", method = RequestMethod.POST)
	public void delete(int id) throws Exception {
		ywdao.delete(id);
	}

	@ResponseBody
	@RequestMapping(value = "YWinsert", method = RequestMethod.POST)
	public void insert(YWDGVO vo) throws Exception {
		ywdao.insert(vo);
	}

	@ResponseBody
	@RequestMapping(value = "YWupdate", method = RequestMethod.POST)
	public void update(YWDGVO vo) throws Exception {
		ywdao.update(vo);
	}

	@ResponseBody
	@RequestMapping("YWread.json")
	public YWDGVO jsonRead(int id) throws Exception {
		YWDGVO vo = new YWDGVO();
		vo = ywdao.read(id);
		return vo;
	}
	
	// Ω¬¡÷ææ
	
		@Inject
	    TblbbsDAO sjdao;
	    
	    @ResponseBody
	    @RequestMapping("sjlist.json")
	    public HashMap<String,Object> sjlistJSON(SearchCriteria cri) throws Exception{
	   	 System.out.println(cri.toString());
	   	 
	   	 HashMap <String,Object> map=new HashMap<String,Object>();
	   	 cri.setPerPageNum(10);
	   	 map.put("list", sjdao.sjslist(cri));
	   	 map.put("total", sjdao.sjstotal(cri));
	   	 
	   	 PageMaker pm=new PageMaker();
	   	 pm.setCri(cri);
	   	 pm.setTotalCount(sjdao.sjstotal(cri));
	   	 map.put("pm", pm);
	   	 return map;
	    }
	    
	    @RequestMapping("list")
	    public String sjlist(){
	    	return "list";
	    }
	    
	    @RequestMapping("insert")
	    public String sjinsert(){
	    	return "insert";
	    }
	    
	    @ResponseBody
	    @RequestMapping(value="insert", method = RequestMethod.POST)
	     public void sjinsert(TblbbsVO vo) throws Exception{
	    	  sjdao.sjinsert(vo);
	    }
	    
	    @ResponseBody
	    @RequestMapping(value="delete", method = RequestMethod.POST)
	     public void sjinsert(int id) throws Exception{
	    	  sjdao.sjdelete(id);
	    }
	    
	    @ResponseBody
	    @RequestMapping(value="update", method = RequestMethod.POST)
	     public void sjupdate(TblbbsVO vo) throws Exception{
	    	  sjdao.sjupdate(vo);
	    }
	    
	    @ResponseBody
	    @RequestMapping("sjread.json")
	     public TblbbsVO sjjsonRead(int id) throws Exception{
	    	TblbbsVO vo = new TblbbsVO();
	    	vo=sjdao.sjread(id);
	    	return vo;
	    }
	    
	    
	    // πŒ»£
	    
	    @Inject
		MHInvenDAO mhdao;

		@RequestMapping("MHlist")
		public String MHlist() throws Exception {
			return "MHlist";
		}

		@RequestMapping("MHinsert")
		public String MHinsert() throws Exception {
			return "MHinsert";
		}

		@ResponseBody
		@RequestMapping("MHlist.json")
		public HashMap<String, Object> MHlistJSON(SearchCriteria cri) throws Exception {

			System.out.println(cri.toString());
			HashMap<String, Object> map = new HashMap<String, Object>();
			cri.setPerPageNum(8);
			map.put("list", mhdao.MHslist(cri));
			map.put("total", mhdao.MHstotal(cri));

			PageMaker pm = new PageMaker();
			pm.setCri(cri);
			pm.setTotalCount(mhdao.MHstotal(cri));
			map.put("pm", pm);

			return map;
		}

		@RequestMapping(value = "MHinsert", method = RequestMethod.POST)
		public String MHinsert(MHInvenVO vo) throws Exception {
			mhdao.MHinsert(vo);
			return "redirect:MHlist";
		}

		@RequestMapping("read.json")
		public @ResponseBody MHInvenVO MHjsonRead(String name) {
			MHInvenVO vo = null;
			try {
				vo = mhdao.MHread(name);
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return vo;
		}

		@RequestMapping(value = "MHdelete", method = RequestMethod.POST)
		public ResponseEntity<String> MHdelete(String name) {
			ResponseEntity<String> entity = null;
			try {
				mhdao.MHdelete(name);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
			}
			return entity;
		}

		@RequestMapping(value = "MHupdate", method = RequestMethod.POST)
		public ResponseEntity<String> MHupdate(MHInvenVO vo) {
			ResponseEntity<String> entity = null;
			try {
				mhdao.MHupdate(vo);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
			}
			return entity;
		}

		// ¿Œ∫• ∞‘¿” ∏Æ∫‰ ≈©∑—∏µ
		@ResponseBody
		@RequestMapping("View.json")
		public ArrayList<ViewVO> view(SearchCriteria cri) throws Exception {
			ArrayList<ViewVO> array = new ArrayList<ViewVO>();
			Document doc = Jsoup.connect("http://www.inven.co.kr/webzine/news/?sclass=12&platforms=gamereview").get();
			Elements es = doc.select(".list");
			HashMap<String, Object> map = new HashMap<String, Object>();

			for (Element e : es.select("td")) {
				ViewVO vo = new ViewVO();
				vo.setBanner(e.select(".banner").attr("src"));
				vo.setTitle(e.select(".title").text());
				vo.setSummary(e.select(".summary").text());
				vo.setLink(e.select(".title a").attr("href"));
				array.add(vo);
			}
			return array;
		}
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
}
