package com.zfet.illumi.dao;

import com.zfet.illumi.struct.Tag;

import java.util.List;

public interface TagDao {
    public Tag getOne(int id);
    public List<Tag> getAll();
}
