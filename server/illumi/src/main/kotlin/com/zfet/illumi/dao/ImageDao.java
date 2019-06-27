package com.zfet.illumi.dao;
import com.zfet.illumi.struct.Image;
import com.zfet.illumi.struct.Tag;

import javax.persistence.EntityNotFoundException;
import java.util.List;

public interface ImageDao {
    public Image getOne(int id);
    public List<Image> getAll();
}
