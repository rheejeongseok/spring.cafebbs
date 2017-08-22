package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.model.ModelCafe;
import com.spring.model.ModelLike;
import com.spring.model.ModelMenu;
import com.spring.model.ModelReview;

@Repository("daocafe")
public class DaoCafe implements IDaoCafe {
    // SLF4J Logging
    private static Logger logger = LoggerFactory.getLogger(DaoCafe.class);
    
    @Autowired
    @Qualifier("sqlSession")
    private SqlSession session;
    
    @Override
    public List<ModelReview> getNewReview() {
        
        return session.selectList("mapper.mysql.mapperCafe.getNewReview");
    }
    
    @Override
    public List<ModelCafe> getCafeBigTypeList(String cafebigtype) {
        // TODO Auto-generated method stub
        return session.selectList("mapper.mysql.mapperCafe.getCafeBigTypeList",cafebigtype);
    }
    
    @Override
    public ModelCafe getCafeOne(int cafeno) {
        // TODO Auto-generated method stub
        return session.selectOne("mapper.mysql.mapperCafe.getCafeOne",cafeno);
    }
    
    @Override
    public List<ModelCafe> getCafeBrandList(String cafebigtype, String brand) {
        // TODO Auto-generated method stub
        Map<String,String> map = new HashMap<String,String>();
        map.put("cafebigtype", cafebigtype);
        map.put("brand", brand);
        return session.selectList("mapper.mysql.mapperCafe.getCafeBrandList",map);
    }
    
    @Override
    public List<ModelMenu> getMenuMain(String brand) {
        // TODO Auto-generated method stub
        return session.selectList("mapper.mysql.mapperCafe.getMenuMain",brand);
    }
    
    @Override
    public List<ModelMenu> getMenuSub(String brand) {
        // TODO Auto-generated method stub
        
        return session.selectList("mapper.mysql.mapperCafe.getMenuSub",brand);
    }
    
    @Override
    public List<ModelReview> getReviewList(int cafeno) {
        // TODO Auto-generated method stub
        return session.selectList("mapper.mysql.mapperCafe.getReviewList",cafeno);
    }
    
    @Override
    public ModelReview getReviewOne(int cafeno, int commentno) {
        // TODO Auto-generated method stub
        Map<String,Integer> map = new HashMap<String,Integer>();
        map.put("cafeno", cafeno);
        map.put("commentno", commentno);
        return session.selectOne("mapper.mysql.mapperCafe.getReviewOne",map);
    }
    
    @Override
    public Double getCafeGrade(int cafeno) {
        // TODO Auto-generated method stub
        return session.selectOne("mapper.mysql.mapperCafe.getCafeGrade",cafeno);
    }
    
    @Override
    public int getReviewCount(int cafeno) {
        // TODO Auto-generated method stub
        return session.selectOne("mapper.mysql.mapperCafe.getReviewCount",cafeno);
    }
    
    @Override
    public int getLikeCount(int cafeno) {
        // TODO Auto-generated method stub
        return session.selectOne("mapper.mysql.mapperCafe.getLikeCount",cafeno);
    }
    
    @Override
    public int increaseLike(int cafeno) {
        // TODO Auto-generated method stub
        return session.update("mapper.mysql.mapperCafe.increaseLike",cafeno);
    }
    
    @Override
    public int increaseReview(int cafeno) {
        // TODO Auto-generated method stub
        return session.update("mapper.mysql.mapperCafe.increaseReview",cafeno);
    }

    @Override
    public int increaseAvg(int cafeno) {
        // TODO Auto-generated method stub
        return session.update("mapper.mysql.mapperCafe.increaseAvg",cafeno);
    }
    
    @Override
    public int insertReview(ModelReview review) {
        // TODO Auto-generated method stub
        return session.insert("mapper.mysql.mapperCafe.insertReview",review);
    }
    
    @Override
    public int updateReview(ModelReview update, ModelReview search) {
        // TODO Auto-generated method stub
        Map<String,ModelReview> map = new HashMap<String,ModelReview>();
        map.put("update", update);
        map.put("search", search);
        return session.update("mapper.mysql.mapperCafe.updateReview",map);
    }
    
    @Override
    public int deleteReview(int commentno) {
        // TODO Auto-generated method stub
        return session.delete("mapper.mysql.mapperCafe.deleteReview",commentno);
    }

    @Override
    public int getCommentno(ModelReview review) {
        // TODO Auto-generated method stub
        return session.selectOne("mapper.mysql.mapperCafe.getCommentno",review);
    }

	@Override
	public int getMaxCafe(String brand) {
		// TODO Auto-generated method stub
		return session.selectOne("mapper.mysql.mapperCafe.getMaxCafe",brand);
	}

	@Override
	public List<ModelCafe> getCafeRanking() {
		// TODO Auto-generated method stub
		return session.selectList("mapper.mysql.mapperCafe.getCafeRanking");
	}

	@Override
	public int getMaxCafeAll(String cafebigtype) {
		// TODO Auto-generated method stub
		return session.selectOne("mapper.mysql.mapperCafe.getMaxCafeAll",cafebigtype);
	}

    @Override
    public List<ModelCafe> getCafeBrandUpList(int cafeno, String brand) {
        // TODO Auto-generated method stub
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("cafeno", cafeno);
        map.put("brand", brand);
        
        return session.selectList("mapper.mysql.mapperCafe.getCafeBrandUpList",map);
    }

    @Override
    public List<ModelCafe> getCafeBigTypeUpList(int cafeno,
            String cafebigtype) {
        // TODO Auto-generated method stub
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("cafeno", cafeno);
        map.put("cafebigtype", cafebigtype);
        
        return session.selectList("mapper.mysql.mapperCafe.getCafeBigTypeUpList",map);
    }

    @Override
    public int getBookmark(int cafeno, int userno) {
        // TODO Auto-generated method stub
        Map<String,Integer> map = new HashMap<String,Integer>();
        map.put("cafeno", cafeno);
        map.put("userno", userno);
        return session.selectOne("mapper.mysql.mapperCafe.getBookmark",map);
    }

    @Override
    public int insertBookmark(ModelLike like) {
        // TODO Auto-generated method stub
        return session.insert("mapper.mysql.mapperCafe.insertBookmark",like);
    }

    @Override
    public int deleteBookmark(ModelLike like) {
        // TODO Auto-generated method stub
        return session.delete("mapper.mysql.mapperCafe.deleteBookmark",like);
    }

   
}
