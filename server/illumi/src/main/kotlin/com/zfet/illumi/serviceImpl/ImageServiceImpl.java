package com.zfet.illumi.serviceImpl;

import com.zfet.illumi.dao.ImageDao;
import com.zfet.illumi.service.ImageService;
import com.zfet.illumi.struct.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageServiceImpl implements ImageService {

    @Autowired
    private ImageDao imageDao;

    @Override
    public Image lookOneImage(int id) {
        return imageDao.getOne(id);
    }

    @Override
    public List<Image> lookImageHasTag(int id) {
        return null;
    }
}
