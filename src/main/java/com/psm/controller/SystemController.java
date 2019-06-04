package com.psm.controller;

import com.psm.dto.*;
import com.psm.fo.LoginFormObject;
import com.psm.service.IClassService;
import com.psm.service.IStudentService;
import com.psm.service.ITeacherService;
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
    @Autowired
    private ITeacherService teacherService;
    @Autowired
    private IClassService classService;
    @Autowired
    private IStudentService studentService;


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
            if("教师".equals(user.getRoleName())){
                Integer teacherNumber = user.getStatusId();
                if(teacherNumber == null){
                    model.addAttribute("msg","用户未绑定，请联系管理员！");
                    return "manage/login";
                }else{
                    TeacherInfo teacherInfo = teacherService.selectByTeacherNumber(teacherNumber);
                    ClassInfo classInfo = null;
                    classInfo = classService.selectByTeaherId(teacherInfo.getTeacherId());
                    if(classInfo == null){
                        model.addAttribute("msg","教师不属于班主任，无法登录系统！");
                        return "manage/login";
                    }else{
                        session.setAttribute("objectInfo",teacherInfo);
                        session.setAttribute("classInfo",classInfo);
                        session.setAttribute("user",user);
                        return "manage/index";
                    }

                }
            }else if("学生".equals(user.getRoleName())){
                Integer studentNumber = user.getStatusId();
                if(studentNumber == null){
                    model.addAttribute("msg","用户未绑定，请联系管理员！");
                    return "manage/login";
                }else{
                    StudentInfo studentInfo = studentService.selectByStuNumber(Long.valueOf(studentNumber));
                    TeacherInfo teacherInfo = teacherService.selectById(studentInfo.getTeacherId());
                    ClassInfo classInfo = null;
                    classInfo = classService.selectByTeaherId(teacherInfo.getTeacherId());
                    if(classInfo == null){
                        model.addAttribute("msg","出错，无法登录系统！");
                        return "manage/login";
                    }else{
                        session.setAttribute("objectInfo",teacherInfo);
                        session.setAttribute("classInfo",classInfo);
                        session.setAttribute("user",user);
                        return "manage/index";
                    }
                }
            }else{
                session.setAttribute("user",user);
                return "manage/index";
            }
        }
    }
}
