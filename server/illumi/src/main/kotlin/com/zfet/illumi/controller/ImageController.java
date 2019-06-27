package com.zfet.illumi.controller;

import com.zfet.illumi.dao.TagDao;
import com.zfet.illumi.service.ImageService;
import com.zfet.illumi.service.TagService;
import com.zfet.illumi.service.UserService;
import com.zfet.illumi.struct.Image;
import com.zfet.illumi.struct.Tag;
import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

/**
 * @author MrBird
 */
@RestController
public class ImageController {

    @Autowired
    ImageService imageService;

    @Autowired
    TagService tagService;

    @Autowired
    UserService userService;

    @ResponseBody
    @GetMapping("/lookOneImage")
    public void getOneImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id=Integer.valueOf(request.getParameter("id"));
        Image image=imageService.lookOneImage(id);
        char[] imageContent=image.getImagecontent();
        response.setContentType("image/jpg");
        PrintWriter out=response.getWriter();
        out.print(imageContent);
    }

    @GetMapping("/getImageByTag")
    public List<Image> getImageByTag(int id){
        return tagService.getImageByTag(id);
    }

    @GetMapping("/getImageByUsername")
    public List<Image> getImageByUsername(String username){
        return userService.getImageByUsername(username);
    }

    public List<Image> getAllImages(){
        return imageService.lookAllImage();
    }
}