package com.psm.controller;

import com.psm.dto.PowerInfo;
import com.psm.dto.UserInfo;
import com.psm.fo.LoginFormObject;
import com.psm.service.IUserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/22 18:33
 **/
@Controller
@RequestMapping("/system")
public class SystemController {
    private Logger logger = Logger.getLogger(SystemController.class);

    @Autowired
    private IUserService userService;

    @RequestMapping("/login")
    private String showLogin(){
        return "manage/login";
    }
    @RequestMapping("/index")
    private String showindex(){
        return "manage/index";
    }


    @RequestMapping("/checkLogin")
    private String checkLogin(LoginFormObject object, Model model, HttpServletRequest request){
        List<String> powerNames = new ArrayList<>();

        UserInfo userInfo = new UserInfo();
        userInfo.setUserName(object.getUserName());
        userInfo.setPassword(object.getPassword());
        UserInfo user = null;
        user = userService.selctForLogin(userInfo);
        if(user == null){
            model.addAttribute("msg","用户名和密码输入有误！");
            return "manage/login";
        }else {
            for (PowerInfo p: user.getPowerInfoList()) {
                powerNames.add(p.getPowerName());
            }
            user.setPowerNames(powerNames);
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            return "manage/index";
        }

    }
}
