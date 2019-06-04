package com.psm.controller;

import com.psm.dto.*;
import com.psm.service.IMessageService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/30 18:01
 **/
@Controller
@RequestMapping("message")
public class MessageController {
    private Logger logger = Logger.getLogger(MessageController.class);

    @Autowired
    private IMessageService messageService;

    @RequestMapping("/select")
    public String showPage(Model model, HttpServletRequest request){
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
        List<MessageInfo> messageInfoList = messageService.selectByClassId(classInfo.getClassId());
        model.addAttribute("messageList",messageInfoList);
        return "manage/commuicate/message_mange";
    }

    @RequestMapping("/reply")
    @ResponseBody
    public Msg reply(MessageInfo messageInfo){
        try {
            messageService.reply(messageInfo.getMessageId(),messageInfo.getReplyContent());
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/add")
    @ResponseBody
    public Msg addMessage(MessageInfo messageInfo,HttpServletRequest request){
        try {
            ParentInfo parentInfo = (ParentInfo) request.getSession().getAttribute("parentInfo");
            StudentInfo studentInfo = (StudentInfo) request.getSession().getAttribute("studentInfo");
            messageInfo.setAddTime(new Date());
            messageInfo.setUserName(parentInfo.getUserName());
            messageInfo.setState(0);
            messageInfo.setClassId(studentInfo.getClassId());

            messageService.insert(messageInfo);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }
}
