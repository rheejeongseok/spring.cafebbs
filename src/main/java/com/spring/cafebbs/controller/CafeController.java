package com.spring.cafebbs.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cafebbs.common.CafeWebConstants;
import com.spring.cafebbs.model.ModelCafe;
import com.spring.cafebbs.model.ModelLike;
import com.spring.cafebbs.model.ModelMenu;
import com.spring.cafebbs.model.ModelReview;
import com.spring.cafebbs.model.ModelCafeUser;
import com.spring.cafebbs.service.IServiceCafe;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CafeController {
	
	private static final Logger logger = LoggerFactory.getLogger(CafeController.class);
	
	@Autowired
	@Qualifier("servicecafe")
	private IServiceCafe svrcafe;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("index");
		
		List<ModelCafe> ranking = svrcafe.getCafeRanking();
		model.addAttribute("ranking",ranking);
		
		List<ModelReview> newR = svrcafe.getNewReview();
		model.addAttribute("newR",newR);
		
		return "cafe/index";
	}
	
	@RequestMapping(value = "/cafe/{cafebigtype}", method = RequestMethod.GET)
    public String cafelist_bigtype(Model model
            ,@PathVariable(value="cafebigtype") String cafebigtype) {
        logger.info("cafebigtype");
        
        if(cafebigtype.equals("coffee")){
            cafebigtype = "카페";
        }
        else if(cafebigtype.equals("bingsoo")){
            cafebigtype = "빙수";
        }
        else if(cafebigtype.equals("animal")){
            cafebigtype = "펫";
        }
        
        List<ModelCafe> cafe = svrcafe.getCafeBigTypeList(cafebigtype);
        int maxCafe = svrcafe.getMaxCafeAll(cafebigtype);
        model.addAttribute("maxCafe",maxCafe);
        model.addAttribute("cafelist",cafe);
        model.addAttribute("size",cafe.size());
        
        return "cafe/cafelist";
    }
	
	@RequestMapping(value = "/cafe/{cafebigtype}/{brand}", method = RequestMethod.GET)
    public String cafelist_brandtype(Model model
            ,@PathVariable(value="cafebigtype") String cafebigtype
            ,@PathVariable(value="brand") String brand) {
        logger.info("cafebigtype");

        if(cafebigtype.equals("coffee")){
            cafebigtype = "카페";
            if(brand.equals("starbucks")){
                brand = "스타벅스";
            }
            else if(brand.equals("ediya")){
                brand = "이디야";
            }
            else if(brand.equals("hollys")){
                brand = "할리스";
            }
            else if(brand.equals("cafebene")){
                brand = "카페베네";
            }
            else if(brand.equals("coffeebean")){
                brand = "커피빈";
            }
            else if(brand.equals("personcafe")){
                brand = "개인카페";
            }else if(brand.equals("tomntom")){
                brand = "탐탐";
            }
        }
        
        else if(cafebigtype.equals("bingsoo")){
            cafebigtype = "빙수";
            
            if(brand.equals("homibing")){
                brand = "호미빙";
            }
            else if(brand.equals("sealbing")){
                brand = "설빙";
            }
            else if(brand.equals("mealtop")){
                brand = "밀탑빙수";
            }
            else if(brand.equals("iceflower")){
                brand = "눈꽃빙수";
            }
            else if(brand.equals("oclumong")){
                brand = "옥루몽";
            }
            else if(brand.equals("personbingsoo")){
                brand = "개인빙수";
            }
            
        }
        else if(cafebigtype.equals("animal")){
            cafebigtype = "펫";
            
            if(brand.equals("dog")){
                brand = "강아지";
            }
            else if(brand.equals("cat")){
                brand = "고양이";
            }
            else if(brand.equals("bird")){
                brand = "새";
            }
            else if(brand.equals("etc")){
                brand = "기타";
            }
        }
        
        List<ModelCafe> cafe = svrcafe.getCafeBrandList(cafebigtype, brand);
        int maxCafe = svrcafe.getMaxCafe(brand);
        model.addAttribute("maxCafe",maxCafe);
        model.addAttribute("brand",brand);
        model.addAttribute("cafelist",cafe);
        model.addAttribute("cafebigtype",cafebigtype);
        model.addAttribute("size",cafe.size());
        
        
        return "cafe/cafelist";
    }
	
	@RequestMapping(value = "/morecafelist", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> morecafelist(Model model
            ,@RequestParam(value="lastcafeno",defaultValue="-1") Integer lastcafeno
            ,@RequestParam(value="listlast",defaultValue="-1") Integer listlast
            ,@RequestParam(value="brand",defaultValue="") String brand
            ,@RequestParam(value="cafebigtype",defaultValue="") String cafebigtype
            ,HttpSession session
            ) {
       
        logger.info("morecafelist");
        
        Map<String,Object> map = new HashMap<String,Object>();
        
        List<ModelCafe> cafe = svrcafe.getCafeBrandUpList(listlast, brand);
        
        List<ModelCafe> bigCafe = svrcafe.getCafeBigTypeUpList(listlast, cafebigtype);
        
        Object[] aa = cafe.toArray();
        
        Object[] bb = bigCafe.toArray();
        
        map.put("cafelist", aa);
        map.put("bigcafelist", bb);
        map.put("brand", brand);
        return map;

    }
	
	
	
	@RequestMapping(value = "/cafe1/{brand}/{cafeno}", method = RequestMethod.GET)
    public String cafebrand(Model model
            ,@PathVariable(value="brand") String brand
            ,@PathVariable(value="cafeno") Integer cafeno
            ,HttpSession session) {
        logger.info("cafebrand");
        
        ModelCafeUser user = (ModelCafeUser) session.getAttribute(CafeWebConstants.SESSION_NAME);
        
        ModelCafe cafe = svrcafe.getCafeOne(cafeno);
        
        if(brand.equals("starbucks")){
            brand = "스타벅스";
        }
        else if(brand.equals("ediya")){
            brand = "이디야";
        }
        else if(brand.equals("hollys")){
            brand = "할리스";
        }
        else if(brand.equals("cafebene")){
            brand = "카페베네";
        }
        else if(brand.equals("coffeebean")){
            brand = "커피빈";
        }
        else if(brand.equals("tomntom")){
            brand = "탐탐";
        }
        else if(brand.equals("personcafe")){
            brand = "개인카페";
        }
        else if(brand.equals("homibing")){
            brand = "호미빙";
        }
        else if(brand.equals("seolbing")){
            brand = "설빙";
        }
        else if(brand.equals("miltop")){
            brand = "밀탑빙수";
        }
        else if(brand.equals("iceflower")){
            brand = "눈꽃빙수";
        }
        else if(brand.equals("oclumong")){
            brand = "옥루몽";
        }
        else if(brand.equals("personbingsoo")){
            brand = "개인빙수";
        }
        else if(brand.equals("dog")){
            brand = "강아지";
        }
        else if(brand.equals("cat")){
            brand = "고양이";
        }
        else if(brand.equals("bird")){
            brand = "새";
        }
        else if(brand.equals("etc")){
            brand = "기타";
        }
        
        int userno = 0;
        
        if(user == null){
            userno = 9999;
        }else if(user != null){
            userno = user.getUserno();
        }
            
            
        List<ModelMenu> menuMain = svrcafe.getMenuMain(brand);
        List<ModelMenu> menuSub = svrcafe.getMenuSub(brand);
        List<ModelReview> reviews = svrcafe.getReviewList(cafeno);
        int getlike = svrcafe.getBookmark(cafeno, userno);
        
        model.addAttribute("cafe",cafe);
        model.addAttribute("menuMain",menuMain);
        model.addAttribute("menuSub",menuSub);
        model.addAttribute("reviews",reviews);
        model.addAttribute("user",user);
        model.addAttribute("getlike",getlike);
        
        return "cafe/cafeinfo";
    }
	
	@RequestMapping(value = "/clickLike", method = RequestMethod.POST)
    @ResponseBody
    public int clickLike(Model model
            ,@RequestParam(value="userno",defaultValue="-1") Integer userno
            ,@RequestParam(value="cafeno",defaultValue="-1") Integer cafeno
            ,HttpSession session
            ) {
       
        logger.info("clickLike");
      
        ModelLike like = new ModelLike();
        like.setCafeno(cafeno);
        like.setUserno(userno);
        int result = svrcafe.insertBookmark(like);
        svrcafe.increaseLike(cafeno);
        
        return result;
           

    }
	
	@RequestMapping(value = "/deleteLike", method = RequestMethod.POST)
    @ResponseBody
    public int deleteLike(Model model
            ,@RequestParam(value="userno",defaultValue="-1") Integer userno
            ,@RequestParam(value="cafeno",defaultValue="-1") Integer cafeno
            ,HttpSession session
            ) {
       
        logger.info("clickLike");
      
        ModelLike like = new ModelLike();
        like.setCafeno(cafeno);
        like.setUserno(userno);
        int result = svrcafe.deleteBookmark(like);
        svrcafe.increaseLike(cafeno);
        
        return result;
           

    }
	
	
	@RequestMapping(value = "/commentadd", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> commentadd(Model model
            ,@RequestParam(value="cafeno",defaultValue="-1") Integer cafeno
            ,@RequestParam(value="content",defaultValue="")String content
            ,@RequestParam(value="grade",defaultValue="") Double grade
            ,HttpSession session) {
        
        ModelCafeUser user = (ModelCafeUser) session.getAttribute(CafeWebConstants.SESSION_NAME);
        
        Map<String, Object> map = new HashMap<String,Object>();
        
        logger.info("commentadd");
        ModelReview review = new ModelReview(cafeno,content);
        review.setUsernickname(user.getUsernickname());
        review.setGrade(grade);
        
        int commentNo = svrcafe.insertReview(review);
        svrcafe.increaseReview(cafeno);
        svrcafe.increaseAvg(cafeno);

        ModelReview aa = svrcafe.getReviewOne(cafeno, svrcafe.getCommentno(review));
       
        ModelReview comm = svrcafe.getReviewOne(cafeno, aa.getCommentno());
      
        SimpleDateFormat changeFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        map.put("usernickname", review.getUsernickname());
        map.put("content", review.getContent());
        map.put("grade", review.getGrade());
        map.put("time", changeFormat.format(comm.getRegdate()));
        map.put("num", comm.getCommentno());
        
        review = svrcafe.getReviewOne(cafeno, comm.getCommentno());
        model.addAttribute("comment",review);
        
        return map;
           

    }
	
	@RequestMapping(value = "/commentupdate", method = RequestMethod.POST)
    @ResponseBody
    public int commentupdate(Model model
            ,@RequestParam(value="commentnoo",defaultValue="-1") Integer commentno
            ,@RequestParam(value="content",defaultValue="")String content
            ,@RequestParam(value="cafeno",defaultValue="") Integer cafeno
            ,HttpSession session
            ) {
       
        logger.info("commentupdate");
        
        ModelCafeUser user = (ModelCafeUser) session.getAttribute(CafeWebConstants.SESSION_NAME);
        
        /*ModelComments commget = new ModelComments(commentno,text);*/
        
        ModelReview search = svrcafe.getReviewOne(cafeno, commentno);
        ModelReview update = new ModelReview();
        
        update.setContent(content);
        int result = svrcafe.updateReview(update, search);
        
        return result;
           

    }
	
	@RequestMapping(value = "/commentdelete", method = RequestMethod.POST)
    @ResponseBody
    public int commentdelete(Model model
            ,@RequestParam(value="commentnoo",defaultValue="-1") Integer commentno
            ,HttpSession session
            ) {
       
	    logger.info("commentdelete");
	  
	    int result = svrcafe.deleteReview(commentno);
	    
        return result;
           

	}
	
	
}
