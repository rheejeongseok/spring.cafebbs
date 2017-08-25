package com.spring.cafebbs.service;

import com.spring.cafebbs.model.ModelUploadFile;
import com.spring.cafebbs.model.ModelUploadImage;

public interface IServiceUpload {
    int insertAttachFile(ModelUploadFile attachfile);
    
    int insertPhoto(ModelUploadImage attachfile);
    ModelUploadImage getImageByte(int attachfileno);
}
