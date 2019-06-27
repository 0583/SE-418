package com.zfet.illumi.repository;

import com.zfet.illumi.struct.IUser;
import com.zfet.illumi.struct.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TagRepository extends JpaRepository<Tag, Integer> {
}
