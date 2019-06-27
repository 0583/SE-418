package com.zfet.illumi.serviceImpl;

import com.zfet.illumi.dao.UserDao;
import com.zfet.illumi.service.UserService;
import com.zfet.illumi.struct.IUser;
import com.zfet.illumi.struct.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public IUser getUserByName(String username){
        return userDao.getOne(username);
    }

    @Override
    public String register(String username, String password, String confirmPassword) {
        if(username.length()==0)return "Check Username!";
        if(password.length()==0)return "Check Password!";
        if(!password.equals(confirmPassword))return "Different Password!";
        try{
            IUser euser=userDao.getOne(username);
            euser.getPassword().equals(password);
            return "Username Have Been Register!";
        }catch(EntityNotFoundException err){
            if(userDao.addEuser(username, password)==1)
                return "Register Successfully!";
            return "System Error!";
        }
    }

    @Override
    public List<Image> getImageByUsername(String username) {
        IUser user=userDao.getOne(username);
        return user.getImages();
    }
}
