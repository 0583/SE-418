package com.zfet.illumi.service;

import com.zfet.illumi.struct.Image;
import com.zfet.illumi.struct.Tag;

import java.util.List;

public interface TagService {
    public List<Image> getImageByTag(int id);
    public List<Tag> getAllTag();
}
