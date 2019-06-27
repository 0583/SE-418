package com.zfet.illumi.service;

import com.zfet.illumi.struct.IUser;
import com.zfet.illumi.struct.Image;

import javax.persistence.EntityNotFoundException;
import java.util.List;

public interface UserService {
    public IUser getUserByName(String username);
    public String register(String username, String password, String confirmPassword);
    public List<Image> getImageByUsername(String username);
}
