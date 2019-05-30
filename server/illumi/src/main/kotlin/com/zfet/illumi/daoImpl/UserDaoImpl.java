package com.zfet.illumi.daoImpl;

import com.zfet.illumi.dao.UserDao;
import com.zfet.illumi.repository.UserRepository;
import com.zfet.illumi.struct.IUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private UserRepository userRepo;

    @Override
    public IUser getOne(String username){
        return userRepo.getOne(username);
    }

    @Override
    @Transactional
    public int addEuser(String username, String password) {
        try{
            userRepo.insertUser(username, password);
            userRepo.flush();
            return 1;
        }catch(Exception err){
            err.printStackTrace();
            return 0;
        }
    }
}
