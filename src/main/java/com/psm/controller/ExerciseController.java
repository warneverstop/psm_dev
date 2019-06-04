package com.psm.controller;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.psm.dto.ClassInfo;
import com.psm.dto.ExerciseInfo;
import com.psm.dto.Msg;
import com.psm.dto.StudentInfo;
import com.psm.service.IExerciseService;
import com.sun.xml.internal.ws.resources.HttpserverMessages;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import sun.nio.cs.ext.MS874;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @author: su
 * @creat: 2019/5/31 10:22
 **/
@Controller
@RequestMapping("/exercise")
public class ExerciseController implements ServletConfigAware {
    private Logger logger = Logger.getLogger(ExerciseController.class);

    private ServletConfig servletConfig;
    @Override
    public void setServletConfig(ServletConfig servletConfig) {
        this.servletConfig = servletConfig;
    }

    @Autowired
    private IExerciseService exerciseService;

    @RequestMapping("/select")
    public String selectByClassId(Model model, HttpServletRequest request){
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
        List<ExerciseInfo> exerciseInfos = exerciseService.selectByClassId(classInfo.getClassId());
        for (ExerciseInfo exerciseInfo: exerciseInfos) {
            if (exerciseInfo.getUrls() != null){
                try {
                    String[] urls = exerciseInfo.getOthersImgUrl().split("#");
                    exerciseInfo.setUrls(urls);
                }catch (Exception e){
                    logger.error(e);
                }
            }
        }
        model.addAttribute("exerciseList",exerciseInfos);
        return "manage/studentInfo/exercise_info";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Msg delete(Integer exerciseId){
        try {
            exerciseService.delete(exerciseId);
            return Msg.success();
        }catch (Exception e){
            logger.error(e);
            return Msg.fail();
        }
    }

    @RequestMapping("/add")
    public String addExercise(HttpServletRequest request, HttpServletResponse response, Model model){
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
        SmartUpload smart=new SmartUpload();
        try {
            smart.initialize(servletConfig,request,response);
            smart.setCharset("utf-8");
            smart.upload();

            String theme = smart.getRequest().getParameter("theme");
            Date happeTime = new SimpleDateFormat("yyyy-MM-dd").parse(smart.getRequest().getParameter("happenTime"));
            String content = smart.getRequest().getParameter("content");

            Files files=smart.getFiles();
            File file = files.getFile(0);
            String ext=file.getFileExt();
            String fileName= UUID.randomUUID().toString()+"."+ext;
            file.saveAs("/upload/"+fileName,SmartUpload.SAVE_VIRTUAL);

            String firstImgUrl = "/upload/"+fileName;

            ExerciseInfo exerciseInfo = new ExerciseInfo();
            exerciseInfo.setTheme(theme);
            exerciseInfo.setHappenTime(happeTime);
            exerciseInfo.setContent(content);
            exerciseInfo.setFirstImgUrl(firstImgUrl);
            exerciseInfo.setClassId(classInfo.getClassId());

            exerciseService.insert(exerciseInfo);
            model.addAttribute("msg","添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e);
            model.addAttribute("msg","添加失败");
        }

        List<ExerciseInfo> exerciseInfos = exerciseService.selectByClassId(classInfo.getClassId());
        model.addAttribute("exerciseList",exerciseInfos);
        return "manage/studentInfo/exercise_info";
    }

    @RequestMapping("/selectForParent")
    public String selectForParent(Model model,HttpServletRequest request){
        StudentInfo studentInfo = (StudentInfo) request.getSession().getAttribute("studentInfo");
        List<ExerciseInfo> exerciseInfos = exerciseService.selectByClassId(studentInfo.getClassId());
        model.addAttribute("exerciseList",exerciseInfos);
        return "parent/exerciseLsit";
    }


}
