package com.zfet.illumi.serviceImpl;


import com.zfet.illumi.service.UserService;
import com.zfet.illumi.struct.IUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class WebUserDetailService implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username){
        try{
            IUser iuser=userService.getUserByName(username);
            String password=iuser.getPassword();
            return new User(iuser.getUsername(), this.passwordEncoder.encode(password), true,
                    true, true,
                    true, AuthorityUtils.commaSeparatedStringToAuthorityList("admin"));
        }catch(Exception err){
            throw new UsernameNotFoundException(username);
        }
    }
}
