package com.spring.dao;

import com.spring.model.ModelUploadFile;
import com.spring.model.ModelUploadImage;

public interface IDaoUpload {
    int insertAttachFile(ModelUploadFile attachfile);
    
    int insertPhoto(ModelUploadImage attachfile);    
    ModelUploadImage getImageByte(int attachfileno);
}
