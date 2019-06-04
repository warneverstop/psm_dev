package com.psm.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.psm.dto.*;
import com.psm.fo.GradeSelectFormObject;
import com.psm.fo.ScoreObject;
import com.psm.service.ICourseService;
import com.psm.service.IScoreService;
import com.psm.service.IStudentService;
import com.psm.utils.ExcelUtil;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/28 19:12
 **/
@Controller
@RequestMapping("/score")
public class ScoreController {
    private Logger logger = Logger.getLogger(ScoreController.class);

    @Autowired
    private IScoreService scoreService;
    @Autowired
    private IStudentService studentService;
    @Autowired
    private ICourseService courseService;

    /**
     * 本班所有学生的所有课程成绩
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/select")
    public String selectAll(Model model, HttpServletRequest request){
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
        List<ScoreInfo> scoreInfoList = scoreService.selectByClassId(classInfo.getClassId());

        model.addAttribute("scoreList",scoreInfoList);
        return "manage/studentInfo/score_info";
    }

    @RequestMapping("/selectByCondition")
    public String selectByCondition(Model model, HttpServletRequest request, GradeSelectFormObject gradeSelectFormObject){
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
        List<ScoreInfo> scoreInfoList = scoreService.selectByCondition(classInfo.getClassId(),
                gradeSelectFormObject.getCourseName(),
                gradeSelectFormObject.getAttribute(),
                gradeSelectFormObject.getSchoolYear(),
                gradeSelectFormObject.getGrade(),
                gradeSelectFormObject.getStuNumber());

        model.addAttribute("conditon",gradeSelectFormObject);
        model.addAttribute("scoreList",scoreInfoList);
        return "manage/studentInfo/score_info";
    }

    @RequestMapping("save")
    @ResponseBody
    public Msg saveScore(ScoreInfo scoreInfo){
        try {
            if (scoreInfo.getScoreId() == null){
                scoreService.insert(scoreInfo);
            }else{
                scoreService.update(scoreInfo);
            }
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }


    @RequestMapping("selectById")
    @ResponseBody
    public Msg selectById(Integer scoreId){
        try {
            ScoreInfo scoreInfo = scoreService.selectById(scoreId);
            return Msg.success().add("scoreInfo",scoreInfo);
        }catch (Exception e){
            return Msg.fail();
        }
    }
    @RequestMapping("delete")
    @ResponseBody
    public Msg deleteById(Integer scoreId){
        try {
            scoreService.deleteById(scoreId);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    /**
     * 按条件导出学生成绩
     * @param request
     * @param response
     * @param gradeSelectFormObject
     */
    @RequestMapping("export")
    @ResponseBody
    public void exportScore(HttpServletRequest request, HttpServletResponse response,GradeSelectFormObject gradeSelectFormObject){
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
        List<ScoreInfo> list =scoreService.selectByCondition(classInfo.getClassId(),
                gradeSelectFormObject.getCourseName(),
                gradeSelectFormObject.getAttribute(),
                gradeSelectFormObject.getSchoolYear(),
                gradeSelectFormObject.getGrade(),
                gradeSelectFormObject.getStuNumber());

        //excel标题
        String[] title = {"学号","姓名","课程","属性","学分","成绩","补考备注","学年学期"};

        //excel文件名
        String fileName = "scoreInfo.xls";

        //sheet名
        String sheetName = "学生成绩表";
        String [][] content = new String[list.size()][];
        for (int i = 0; i < list.size(); i++) {
            content[i] = new String[title.length];
            ScoreInfo obj = list.get(i);
            if(obj.getStuNumber() != null){
                content[i][0] = obj.getStuNumber().toString();
            }
            if(obj.getStuName() != null){
                content[i][1] = obj.getStuName();
            }
            if(obj.getCourseName() != null){
                content[i][2] = obj.getCourseName();
            }
            if(obj.getAttribute() != null){
                content[i][3] = obj.getAttribute();
            }
            if(obj.getCredit() != null){
                content[i][4] = obj.getCredit().toString();
            }
            if(obj.getGrade() != null){
                content[i][5] = obj.getGrade().toString();
            }
            if(obj.getRemarks() != null){
                content[i][6] = obj.getRemarks();
            }
            if(obj.getSchoolYear()!= null){
                content[i][7] = obj.getSchoolYear();
            }
        }

        //创建HSSFWorkbook
        HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title, content, null);

        //响应到客户端
        try {
            this.setResponseHeader(response, fileName);
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                wb.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }

    //发送响应流方法
    public void setResponseHeader(HttpServletResponse response, String fileName) {
        try {
            try {
                fileName = new String(fileName.getBytes(),"ISO8859-1");
            } catch (UnsupportedEncodingException e) {

                e.printStackTrace();
            }
            response.setContentType("application/vnd.ms-excel;charset=ISO8859-1");
            response.setHeader("Content-Disposition", "attachment;filename="+ fileName);
            response.addHeader("Pargam", "no-cache");
            response.addHeader("Cache-Control", "no-cache");
            //response.setHeader("Accept-Ranges", "bytes");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }


    /**
     * 跳转到根据课程添加成绩页面
     * @param model
     * @param schoolYear
     * @param courseId
     * @param request
     * @return
     */
    @RequestMapping("/addByCourse")
    public String addScoreByCourse(Model model,String schoolYear,Integer courseId,HttpServletRequest request){
        logger.info("参数："+schoolYear + "/" + courseId);
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");

        List<StudentInfo> studentInfoList = studentService.selectByClassId(classInfo.getClassId());
        CourseInfo courseInfo = courseService.selectById(courseId);

        model.addAttribute("studentList",studentInfoList);
        model.addAttribute("schoolYear",schoolYear);
        model.addAttribute("courseInfo",courseInfo);
        return "manage/studentInfo/add_score";
    }

    @RequestMapping("/addScoreList")
    @ResponseBody
    public Msg addScoreList(@RequestBody ScoreInfo[] scoreInfos){
        try {
            for (ScoreInfo score:scoreInfos) {
                logger.info(score.toString());
                scoreService.insert(score);
            }
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }
}
