package com.zfet.illumi.service;

import com.zfet.illumi.struct.Image;

import java.util.List;

public interface TagService {
    public List<Image> getImageByTag(int id);
}
