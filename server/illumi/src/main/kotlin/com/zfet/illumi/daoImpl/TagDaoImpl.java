package com.zfet.illumi.daoImpl;

import com.zfet.illumi.dao.TagDao;
import com.zfet.illumi.repository.TagRepository;
import com.zfet.illumi.struct.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TagDaoImpl implements TagDao {

    @Autowired
    private TagRepository tagRepository;

    @Override
    public Tag getOne(int id) {
        return tagRepository.getOne(id);
    }

    @Override
    public List<Tag> getAll() {
        return tagRepository.findAll();
    }
}
