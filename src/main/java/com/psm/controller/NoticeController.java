package com.psm.controller;

import com.psm.dto.*;
import com.psm.service.INoticeService;
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
 * @creat: 2019/5/30 12:33
 **/
@Controller
@RequestMapping("/notice")
public class NoticeController {
    private Logger logger = Logger.getLogger(ClassController.class);

    @Autowired
    private INoticeService noticeService;

    @RequestMapping("/select")
    public String showPage(Model model, HttpServletRequest request){
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
        List<NoticeInfo> noticeInfoList = noticeService.selectByClassId(classInfo.getClassId());
        model.addAttribute("noticeList",noticeInfoList);
        return "manage/notification/notice_manage";
    }

    @RequestMapping("/selectList")
    public String showListPage(Model model, HttpServletRequest request){
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
        List<NoticeInfo> noticeInfoList = noticeService.selectByClassId(classInfo.getClassId());
        model.addAttribute("noticeList",noticeInfoList);
        return "manage/notification/notice_list";
    }

    @RequestMapping("/selectById")
    @ResponseBody
    public Msg selectById(Integer noticeId){
        try {
            NoticeInfo noticeInfo = noticeService.selectByNoticeId(noticeId);
            return Msg.success().add("noticeInfo",noticeInfo);
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/preUpdate")
    public String preUpdate(Integer noticeId,Model model){
        logger.info("要修改的noticeId:"+noticeId);
        NoticeInfo noticeInfo = noticeService.selectByNoticeId(noticeId);
        model.addAttribute("noticeInfo",noticeInfo);
        return "manage/notification/notice_edit";
    }

    @RequestMapping("/save")
    @ResponseBody
    public Msg saveObject(@RequestBody NoticeInfo noticeInfo, HttpServletRequest request){
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
        try {
            if(noticeInfo.getNoticeId() == null){
                noticeInfo.setAddTime(new Date());
                noticeInfo.setClassId(classInfo.getClassId());
                noticeInfo.setVisitCount(0);
                noticeService.insert(noticeInfo);
            }else{
                NoticeInfo notice = noticeService.selectByNoticeId(noticeInfo.getNoticeId());
                notice.setAuthor(noticeInfo.getAuthor());
                notice.setContext(noticeInfo.getContext());
                notice.setProfile(noticeInfo.getProfile());
                notice.setTitle(noticeInfo.getTitle());
                notice.setLabel(noticeInfo.getLabel());
                noticeService.update(notice);
            }
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Msg deleteById(Integer noticeId){
        try {
            noticeService.delete(noticeId);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }


    @RequestMapping("/selectForParent")
    public String showMessageList(Model model ,String category,HttpServletRequest request){
        StudentInfo studentInfo = (StudentInfo) request.getSession().getAttribute("studentInfo");
        List<NoticeInfo> noticeInfoList = noticeService.selectByClassIdAndCategory(studentInfo.getClassId(),category);
        model.addAttribute("noticeList",noticeInfoList);
        return "parent/notice_list";
    }


    @RequestMapping("/selectByIdToShow")
    public String selectByIdToShow(Model model ,Integer noticeId){
        logger.info("要查看文章："+noticeId);
        NoticeInfo noticeInfo = noticeService.selectByNoticeId(noticeId);
        noticeInfo.setVisitCount(noticeInfo.getVisitCount()+1);
        noticeService.update(noticeInfo);
        model.addAttribute("noticeInfo",noticeInfo);
        return "parent/notice_info";
    }
}
