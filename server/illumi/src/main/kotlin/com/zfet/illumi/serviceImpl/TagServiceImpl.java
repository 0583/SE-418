package com.zfet.illumi.serviceImpl;

import com.zfet.illumi.dao.TagDao;
import com.zfet.illumi.service.TagService;
import com.zfet.illumi.struct.Image;
import com.zfet.illumi.struct.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagServiceImpl implements TagService {

    @Autowired
    private TagDao tagDao;

    @Override
    public List<Image> getImageByTag(int id) {
        Tag tag=tagDao.getOne(id);
        return tag.getImages();
    }
}
