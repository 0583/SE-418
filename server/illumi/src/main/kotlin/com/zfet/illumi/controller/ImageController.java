package com.zfet.illumi.controller;

import com.zfet.illumi.dao.TagDao;
import com.zfet.illumi.service.ImageService;
import com.zfet.illumi.service.TagService;
import com.zfet.illumi.service.UserService;
import com.zfet.illumi.struct.Image;
import com.zfet.illumi.struct.Tag;
import com.zfet.illumi.tool.PackJson;
import com.zfet.illumi.tool.PackTool;
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
        PrintWriter out=response.getWriter();
        try{
            int id=Integer.valueOf(request.getParameter("id"));
            Image image=imageService.lookOneImage(id);
            char[] imageContent=image.getImagecontent();
            response.setContentType("image/jpg");
            out.print(imageContent);
        }catch(Exception err){
            err.printStackTrace();
            out.print("{\"status\": \"fail\"}");
        }
    }

    @GetMapping("/getImageInfo")
    public Object getImageInfo(int id){
        try{
            Image img=imageService.lookOneImage(id);
            return PackTool.pack("ok", img);
        }catch(Exception err){
            err.printStackTrace();
            return "{\"status\": \"fail\"}";
        }
    }

    @GetMapping("/getImageByTag")
    @ResponseBody
    public Object getImageByTag(int id){
        try{
            List<Image> images=tagService.getImageByTag(id);
            return PackTool.pack("ok", images);
        }catch(Exception err){
            err.printStackTrace();
            return "{\"status\": \"fail\"}";
        }
    }

    @GetMapping("/getImageByUsername")
    @ResponseBody
    public Object getImageByUsername(String username){
        try{
            List<Image> images=userService.getImageByUsername(username);
            return PackTool.pack("ok", images);
        }catch(Exception err){
            err.printStackTrace();
            return "{\"status\": \"fail\"}";
        }
    }

    @GetMapping("/getAllTag")
    public Object getAllTag(){
        try{
            List<Tag> tags=tagService.getAllTag();
            return PackTool.pack("ok", tags);
        }catch (Exception err){
            err.printStackTrace();
            return "{\"status\": \"fail\"}";
        }
    }

}