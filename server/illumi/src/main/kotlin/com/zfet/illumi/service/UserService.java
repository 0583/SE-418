package com.zfet.illumi.service;

import com.zfet.illumi.struct.IUser;

import javax.persistence.EntityNotFoundException;

public interface UserService {
    public IUser getUserByName(String username);
    public String register(String username, String password, String confirmPassword);
}
