package com.psm.controller;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.psm.dto.Msg;
import com.psm.dto.RoleInfo;
import com.psm.dto.UserInfo;
import com.psm.dto.UserStatus;
import com.psm.service.IRoleService;
import com.psm.service.IUserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.ServletConfigAware;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @author: su
 * @creat: 2019/5/23 15:38
 **/
@Controller
@RequestMapping("/user")
public class UserController implements ServletConfigAware {
    private Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private IUserService userService;
    @Autowired
    private IRoleService roleService;

    @RequestMapping("/personal")
    public String showPersonData(){
        return "manage/system/personal_data";
    }

    @RequestMapping("/update")
    public String updateUser(UserInfo userInfo,HttpServletRequest request){
        logger.info("要修改用户信息：" + userInfo.toString());
        try {
            UserInfo user = userService.selectByUserId(userInfo.getUserId());
            user.setUserName(userInfo.getUserName());
            user.setEmail(userInfo.getEmail());
            user.setAddress(userInfo.getAddress());
            user.setBirthday(userInfo.getBirthday());
            user.setGenter(userInfo.getGenter());
            user.setPhone(userInfo.getPhone());

            UserInfo user1 = (UserInfo) request.getSession().getAttribute("user");
            user1.setUserName(userInfo.getUserName());
            user1.setEmail(userInfo.getEmail());
            user1.setAddress(userInfo.getAddress());
            user1.setBirthday(userInfo.getBirthday());
            user1.setGenter(userInfo.getGenter());
            user1.setPhone(userInfo.getPhone());


            userService.updateUser(user);
            return "manage/system/personal_data";
        }catch (Exception e){
            return "manage/system/personal_data";
        }
    }

    @RequestMapping("/editPwd")
    @ResponseBody
    public Msg editPwd(String password, HttpServletRequest request){
        logger.info("newPwd："+ password);
        try {
            HttpSession session = request.getSession();
            UserInfo user = (UserInfo) session.getAttribute("user");
            user.setPassword(password);
            userService.updateUser(user);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/select")
    public String showUserList(Model model){
        try {
            List<RoleInfo> roleInfos = roleService.selectAll();
            List<UserInfo> userInfoList = userService.selectAll();
            model.addAttribute("roleList",roleInfos);
            model.addAttribute("userList",userInfoList);
        }catch (Exception e){

        }
        return "manage/system/user_info";
    }

    @RequestMapping("/save")
    @ResponseBody
    public Msg saveUserInfo(UserInfo userInfo,HttpServletRequest request){
        logger.info("要保存的用户：" + userInfo.toString());

        HttpSession session = request.getSession();
        UserInfo user = (UserInfo) session.getAttribute("user");

        try {
            if(userInfo.getUserId() == null){
                userInfo.setAddTime(new Date());
                userInfo.setAddUser(user.getUserName());
                userInfo.setPassword("123456");
                userInfo.setImgUrl("/upload/a5.jpg");
                userService.insertUser(userInfo);
            }else{
                UserInfo userInfo1 = userService.selectByUserId(userInfo.getUserId());//这个是未修改的user
                userInfo1.setUserName(userInfo.getUserName());
                userInfo1.setGenter(userInfo.getGenter());
                userInfo1.setPhone(userInfo.getPhone());
                userInfo1.setState(userInfo.getState());
                userInfo1.setRoleId(userInfo.getRoleId());
                userInfo1.setRemarks(userInfo.getRemarks());
                userService.updateUser(userInfo1);
            }
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }


    @RequestMapping("/selectById")
    @ResponseBody
    public Msg selectById(Integer userId){
        try {
            UserInfo userInfo = userService.selectByUserId(userId);
            return Msg.success().add("userInfo",userInfo);
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Msg deleteById(Integer userId){
        try {
            userService.deleteById(userId);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/setStatus")
    @ResponseBody
    public Msg setStatus(UserStatus userStatus){
        try {
            userService.setUserStatust(userStatus);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping(value="/upoadPicture", method = RequestMethod.POST)
    public String upoadPicture(HttpServletRequest request, HttpServletResponse response,Model model){
        SmartUpload smart=new SmartUpload();
        try {
            smart.initialize(servletConfig,request,response);
            smart.setCharset("utf-8");
            smart.upload();
            //smart.save("/goodsImageUpoad");
            int userId =Integer.valueOf(smart.getRequest().getParameter("userId"));
            Files files=smart.getFiles();
            File file = files.getFile(0);
            String ext=file.getFileExt();
            String fileName= UUID.randomUUID().toString()+"."+ext;
            file.saveAs("/upload/"+fileName,SmartUpload.SAVE_VIRTUAL);
            if(userService.addPicture("/upload/"+fileName, userId)) {
                logger.info("更改图片成功，图片名："+fileName);
                UserInfo user = (UserInfo) request.getSession().getAttribute("user");
                user.setImgUrl("/upload/"+fileName);
                model.addAttribute("msg","修改成功");
            }else {
                model.addAttribute("msg","修改失败");
                logger.info("更改图片失败，图片名："+fileName);
            }
            return "manage/system/uploadPicture";
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            logger.error(e);
            return "manage/system/uploadPicture";
        }
    }
    private ServletConfig servletConfig;
    @Override
    public void setServletConfig(ServletConfig servletConfig) {
        this.servletConfig = servletConfig;
    }
}
