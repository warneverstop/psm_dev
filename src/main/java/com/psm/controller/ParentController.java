package com.psm.controller;

import com.psm.dto.*;
import com.psm.fo.ParentUpdatePwdForm;
import com.psm.service.*;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/28 17:32
 **/
@Controller
@RequestMapping("/parent")
public class ParentController {
    private Logger logger = Logger.getLogger(ParentController.class);

    @Autowired
    private IParentService parentService;
    @Autowired
    private IStudentService studentService;
    @Autowired
    private IMajorService majorService;
    @Autowired
    private INoticeService noticeService;
    @Autowired
    private IActionService actionService;
    @Autowired
    private IExerciseService exerciseService;
    @Autowired
    private ITeacherService teacherService;
    @Autowired
    private IMessageService messageService;

    @RequestMapping("/selectByStuId")
    @ResponseBody
    public Msg selectByStudentId(Integer studentId){
        try {
            List<ParentInfo> parentList = parentService.selectByStudentId(studentId);
            return Msg.success().add("parentList",parentList);
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/initData")
    @ResponseBody
    public Msg initData(Integer parentId){
        try {
            if(parentService.initData(parentId)){
                return Msg.success();
            }else{
                return Msg.fail();
            }
        }catch (Exception e){
            return Msg.fail();
        }
    }



    @RequestMapping("/login")
    public String parentLogin(){
        return "parent/login";
    }

    @RequestMapping("/index")
    public String showIndex(Model model,HttpServletRequest request){
        StudentInfo studentInfo = (StudentInfo) request.getSession().getAttribute("studentInfo");
        MajorInfo majorInfo = majorService.selectById(studentInfo.getMajorId());
        List<NoticeInfo> noticeInfos = noticeService.selectByClassIdForParent(studentInfo.getClassId());
        List<ExerciseInfo> exerciseInfos = exerciseService.selectByClassIdForParent(studentInfo.getClassId());
        List<ActionInfo> actionInfoList = actionService.selectByStudentIdForParent(studentInfo.getStuId());

        model.addAttribute("actionList",actionInfoList);
        model.addAttribute("exerciseList",exerciseInfos);
        model.addAttribute("noticeList",noticeInfos);
        model.addAttribute("majorInfo",majorInfo);
        return "parent/index";
    }

    @RequestMapping("/checkLogin")
    public String checkLogin(String userName, String password, Model model, HttpServletRequest request){
        try {
            ParentInfo parentInfo = null;
            parentInfo = parentService.selectForLogin(userName,password);
            if(parentInfo == null){
                model.addAttribute("msg","用户名或密码错误,请重新登录！");
                return "parent/login";
            }else{
                StudentInfo studentInfo = studentService.selectAllByStuId(parentInfo.getStuId());

                request.getSession().setAttribute("parentInfo",parentInfo);
                request.getSession().setAttribute("studentInfo",studentInfo);
                return "redirect:/parent/index";
            }
        }catch (Exception e){
            return "parent/login";
        }
    }

    @RequestMapping("/quit")
    public String quit(HttpServletRequest request){
        Enumeration em = request.getSession().getAttributeNames();
        while(em.hasMoreElements()){
            request.getSession().removeAttribute(em.nextElement().toString());
        }
        return "parent/login";
    }

    @RequestMapping("/contact")
    public String contact(HttpServletRequest request,Model model){
        StudentInfo studentInfo = (StudentInfo) request.getSession().getAttribute("studentInfo");
        ParentInfo parentInfo = (ParentInfo) request.getSession().getAttribute("parentInfo");
        TeacherInfo teacherInfo = teacherService.selectById(studentInfo.getTeacherId());
        List<MessageInfo> messageInfoList = messageService.selectByUserName(parentInfo.getUserName());

        model.addAttribute("messageList",messageInfoList);
        model.addAttribute("teacherInfo",teacherInfo);
        return "parent/contact";
    }

    @RequestMapping("/personal")
    public String showPersonal(HttpServletRequest request,Model model){
        ParentInfo parentInfo = (ParentInfo) request.getSession().getAttribute("parentInfo");
        model.addAttribute("parentInfo",parentInfo);
        return "parent/personal";
    }

    @RequestMapping("/updateInfo")
    public String backPersonal(HttpServletRequest request,Model model,ParentInfo parentInfo){
        ParentInfo parentInfo1 = (ParentInfo) request.getSession().getAttribute("parentInfo");
        parentInfo1.setParentName(parentInfo.getParentName());
        parentInfo1.setPhone(parentInfo.getPhone());
        parentInfo1.setRelation(parentInfo.getRelation());
        try {
            parentService.update(parentInfo);
        }catch (Exception e){
            logger.error(e);
        }
        model.addAttribute("msg","修改成功");
        model.addAttribute("parentInfo",parentInfo1);
        return "parent/personal";
    }


    @RequestMapping("/updatePwd")
    public String updatePwd(HttpServletRequest request, Model model, ParentUpdatePwdForm form){
        ParentInfo parentInfo1 = (ParentInfo) request.getSession().getAttribute("parentInfo");
        try {
            if(parentInfo1.getPassword().equals(form.getOldPwd())){
                if(form.getNewPwd().equals(form.getNewPwdToo())){
                    parentService.updatePwd(form);
                    model.addAttribute("msg","修改成功");
                }else {
                    model.addAttribute("msg","俩次密码不一致");
                }
            }else{
                model.addAttribute("msg","原密码错误");
            }

        }catch (Exception e){
            logger.error(e);
            model.addAttribute("msg","修改失败");
        }

        model.addAttribute("parentInfo",parentInfo1);
        return "parent/personal";
    }
}
