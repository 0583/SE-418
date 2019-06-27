package com.zfet.illumi.repository;

import com.zfet.illumi.struct.Image;
import com.zfet.illumi.struct.Tag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ImageRepository extends JpaRepository<Image, Integer> {
}
