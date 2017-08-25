package com.spring.cafebbs.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring.cafebbs.dao.IDaoCafe;
import com.spring.cafebbs.model.ModelCafe;
import com.spring.cafebbs.model.ModelLike;
import com.spring.cafebbs.model.ModelMenu;
import com.spring.cafebbs.model.ModelReview;

@Service("servicecafe")
public class ServiceCafe implements IServiceCafe {
    // SLF4J Logging
    private static Logger logger = LoggerFactory.getLogger(ServiceCafe.class);
    
    @Autowired
    @Qualifier("daocafe")
    IDaoCafe daocafe;
    
    @Override
    public List<ModelReview> getNewReview() {
        
        List<ModelReview> result = null;
        try {
            result = daocafe.getNewReview();
        } catch (Exception e) {
            logger.error("getNewReview" + e.getMessage() );
            throw e;
        }
        
        return result;
    }
    
    @Override
    public List<ModelCafe> getCafeBigTypeList(String cafebigtype) {
        
        List<ModelCafe> result = null;
        try {
            result = daocafe.getCafeBigTypeList(cafebigtype);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getCafeBigTypeList" + e.getMessage() );
            throw e;
        }
        return result;
    }
    
    @Override
    public ModelCafe getCafeOne(int cafeno) {
        
        ModelCafe result = null;
        try {
            result = daocafe.getCafeOne(cafeno);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getCafeOne" + e.getMessage() );
            throw e;
        }
        
        return result;
    }
    
    @Override
    public List<ModelCafe> getCafeBrandList(String cafebigtype, String brand) {
        List<ModelCafe> result = null;
        try {
            result  = daocafe.getCafeBrandList(cafebigtype, brand);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getCafeBrandList" + e.getMessage() );
            throw e;
        }
        return result;
    }
    
    @Override
    public List<ModelMenu> getMenuMain(String brand) {
        
        List<ModelMenu> result = null;
        try {
            result = daocafe.getMenuMain(brand);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getMenuMain" + e.getMessage() );
            throw e;
        }
        return result;
    }
    
    @Override
    public List<ModelMenu> getMenuSub(String brand) {
        
        List<ModelMenu> result = null;
        try {
            result = daocafe.getMenuSub(brand);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getMenuSub" + e.getMessage() );
            throw e;
        }
        
        return result;
    }
    
    @Override
    public List<ModelReview> getReviewList(int cafeno) {
        
        List<ModelReview> result = null;
        try {
            result = daocafe.getReviewList(cafeno);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getReviewList" + e.getMessage() );
            throw e;
        }
        
        return result;
    }
    
    @Override
    public ModelReview getReviewOne(int cafeno, int commentno) {
        
        ModelReview result = null;
        try {
            result = daocafe.getReviewOne(cafeno, commentno);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getReviewOne" + e.getMessage() );
            throw e;
        }
        return result;
    }
    
    @Override
    public Double getCafeGrade(int cafeno) {
        Double result = null;
        try {
            result = daocafe.getCafeGrade(cafeno);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getCafeGrade" + e.getMessage() );
            throw e;
        }
        return result;
    }
    
    @Override
    public int getReviewCount(int cafeno) {
        int result = 0;
        try {
            result = daocafe.getReviewCount(cafeno);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getReviewCount" + e.getMessage() );
            throw e;
        }
        return result;
    }
    
    @Override
    public int getLikeCount(int cafeno) {
        int result = 0;
        try {
            result = daocafe.getLikeCount(cafeno);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getLikeCount" + e.getMessage() );
            throw e;
        }
        return result;
    }
    
    @Override
    public int increaseLike(int cafeno) {
       int result = 0;
       try {
        result = daocafe.increaseLike(cafeno);
    } catch (Exception e) {
        // TODO Auto-generated catch block
        // e.printStackTrace();
        logger.error("increaseLike" + e.getMessage() );
        throw e;
    }
        return result;
    }
    
    @Override
    public int insertReview(ModelReview review) {
        int result = 0;
        try {
            result = daocafe.insertReview(review);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("insertReview" + e.getMessage() );
            throw e;
        }
        return result;
    }
    
    @Override
    public int updateReview(ModelReview update, ModelReview search) {
        int result = 0;
        try {
            result = daocafe.updateReview(update, search);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("updateReview" + e.getMessage() );
            throw e;
        }
        return result;
    }
    
    @Override
    public int deleteReview(int commentno) {
        int result = 0;
        try {
            result = daocafe.deleteReview(commentno);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("deleteReview" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int increaseReview(int cafeno) {
        int result = 0;
        try {
            result = daocafe.increaseReview(cafeno);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("increaseReview" + e.getMessage() );
            throw e;
        }
        
        return result;
    }

    @Override
    public int increaseAvg(int cafeno) {
        int result = 0;
        try {
            result = daocafe.increaseAvg(cafeno);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("increaseAvg" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int getCommentno(ModelReview review) {
        int result = 0;
        try {
            result = daocafe.getCommentno(review);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getCommentno" + e.getMessage() );
            throw e;
        }
        return result;
    }

	@Override
	public int getMaxCafe(String brand) {
		int result = 0;
		try {
			result = daocafe.getMaxCafe(brand);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<ModelCafe> getCafeRanking() {
		List<ModelCafe> result = null;
		try {
			result = daocafe.getCafeRanking();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int getMaxCafeAll(String cafebigtype) {
		int result = 0;
		try {
			result = daocafe.getMaxCafeAll(cafebigtype);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

    @Override
    public List<ModelCafe> getCafeBrandUpList(int cafeno, String brand) {
        List<ModelCafe> result = null;
        try {
            result = daocafe.getCafeBrandUpList(cafeno, brand);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getCafeBrandUpList" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public List<ModelCafe> getCafeBigTypeUpList(int cafeno,
            String cafebigtype) {
        List<ModelCafe> result = null;
        try {
            result = daocafe.getCafeBigTypeUpList(cafeno, cafebigtype);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getCafeBigTypeUpList" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int getBookmark(int cafeno, int userno) {
        int result = 0;
        try {
            result = daocafe.getBookmark(cafeno, userno);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getBookmark" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int insertBookmark(ModelLike like) {
        int result = 0;
        try {
            result = daocafe.insertBookmark(like);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("insertBookmark" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int deleteBookmark(ModelLike like) {
        int result = 0;
        try {
            result = daocafe.deleteBookmark(like);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("deleteBookmark" + e.getMessage() );
            throw e;
        }
        return result;
    }
}
