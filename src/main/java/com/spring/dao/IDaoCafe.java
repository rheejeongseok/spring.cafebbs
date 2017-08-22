package com.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.spring.model.ModelCafe;
import com.spring.model.ModelLike;
import com.spring.model.ModelMenu;
import com.spring.model.ModelReview;

public interface IDaoCafe {
    
    List<ModelReview> getNewReview();
    List<ModelCafe> getCafeRanking();
    List<ModelCafe> getCafeBigTypeList(String cafebigtype);
    ModelCafe getCafeOne(int cafeno);
    List<ModelCafe> getCafeBrandList(String cafebigtype, String brand);
    List<ModelMenu> getMenuMain(String brand);
    List<ModelMenu> getMenuSub(String brand);
    List<ModelReview> getReviewList(int cafeno);
    List<ModelCafe> getCafeBrandUpList(int cafeno, String brand);
    List<ModelCafe> getCafeBigTypeUpList(int cafeno, String cafebigtype);
    ModelReview getReviewOne(int cafeno, int commentno);
    int getMaxCafe(String brand);
    int getMaxCafeAll(String cafebigtype);
    Double getCafeGrade(int cafeno);
    int getReviewCount(int cafeno);
    int getLikeCount(int cafeno);
    int getBookmark(int cafeno, int userno);
    int insertBookmark(ModelLike like);
    int deleteBookmark(ModelLike like);
    int increaseLike(int cafeno);
    int increaseReview(int cafeno);
    int increaseAvg(int cafeno);
    int getCommentno(ModelReview review);
    int insertReview(ModelReview review);
    int updateReview(ModelReview update, ModelReview search);
    int deleteReview(int commentno);

}
