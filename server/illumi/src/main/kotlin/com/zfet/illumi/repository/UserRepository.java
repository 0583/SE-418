package com.zfet.illumi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.zfet.illumi.struct.IUser;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<IUser, String> {
    @Modifying
    @Query(value="insert user(username, password) values(?1, ?2)", nativeQuery = true)
    void insertUser(String username, String passwrod);
}
