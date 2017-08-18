package com.spring.service;

import com.spring.model.ModelUploadFile;
import com.spring.model.ModelUploadImage;

public interface IServiceUpload {
    int insertAttachFile(ModelUploadFile attachfile);
    
    int insertPhoto(ModelUploadImage attachfile);
    ModelUploadImage getImageByte(int attachfileno);
}
