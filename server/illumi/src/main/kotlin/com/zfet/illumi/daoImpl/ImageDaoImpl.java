package com.zfet.illumi.daoImpl;

import com.zfet.illumi.dao.ImageDao;
import com.zfet.illumi.repository.ImageRepository;
import com.zfet.illumi.struct.Image;
import com.zfet.illumi.struct.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ImageDaoImpl implements ImageDao {

    @Autowired
    private ImageRepository imageRepository;

    @Override
    public Image getOne(int id) {
        return imageRepository.getOne(id);
    }

    @Override
    public List<Image> getAll() {
        return imageRepository.findAll();
    }

}
