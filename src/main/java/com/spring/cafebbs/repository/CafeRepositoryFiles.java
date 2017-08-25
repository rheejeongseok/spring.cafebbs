package com.spring.cafebbs.repository;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class CafeRepositoryFiles {
 
    private List<MultipartFile> files;

    public List<MultipartFile> getFiles() {
        return files;
    }

    public void setFiles(List<MultipartFile> files) {
        this.files = files;
    }

    public CafeRepositoryFiles() {
        super();
    }
}
