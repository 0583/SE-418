package com.zfet.illumi.dao;
import com.zfet.illumi.struct.IUser;

import javax.persistence.EntityNotFoundException;

public interface UserDao {
    public IUser getOne(String username);
    public int addEuser(String username, String passwrod);
}
