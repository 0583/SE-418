package com.zfet.illumi.service;

import com.zfet.illumi.struct.Image;

import java.util.List;

public interface ImageService {

    public Image lookOneImage(int id);
    public List<Image> lookImageHasTag(int id);
}
