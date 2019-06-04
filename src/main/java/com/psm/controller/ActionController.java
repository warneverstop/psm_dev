package com.psm.controller;

import com.psm.dto.*;
import com.psm.service.IActionService;
import com.psm.service.IStudentService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/30 10:18
 **/
@Controller
@RequestMapping("/action")
public class ActionController {
    private Logger logger = Logger.getLogger(ClassController.class);

    @Autowired
    private IActionService actionService;
    @Autowired
    private IStudentService studentService;

    @RequestMapping("/select")
    public String showPage(Model model, HttpServletRequest request){
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
        List<ActionInfo> actionInfoList = actionService.selectAllByClassId(classInfo.getClassId());
        List<StudentInfo> studentInfoList = studentService.selectByClassId(classInfo.getClassId());
        model.addAttribute("studentList",studentInfoList);
        model.addAttribute("actionList",actionInfoList);
        return "manage/studentInfo/action_info";
    }

    @RequestMapping("/selectById")
    @ResponseBody
    public Msg selectById(Integer actionId){
        try {
            ActionInfo actionInfo = actionService.selectById(actionId);
            return Msg.success().add("actionInfo",actionInfo);
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/save")
    @ResponseBody
    public Msg saveObject(ActionInfo actionInfo){
        try {
            if(actionInfo.getActionId() == null){
                actionService.insert(actionInfo);
            }else{
                ActionInfo action = actionService.selectById(actionInfo.getActionId());
                action.setActionTitle(actionInfo.getActionTitle());
                action.setActionContent(actionInfo.getActionContent());
                action.setStuId(actionInfo.getStuId());
                actionService.update(action);
            }
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Msg deleteById(Integer actionId){
        try {
            actionService.deleteById(actionId);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

}
