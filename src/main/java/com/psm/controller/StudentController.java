package com.psm.controller;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.psm.dto.*;
import com.psm.service.*;
import com.psm.utils.ExcelUtil;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

/**
 * @author: su
 * @creat: 2019/5/26 18:50
 **/
@Controller
@RequestMapping("/student")
public class StudentController implements ServletConfigAware {
    private Logger logger = Logger.getLogger(StudentController.class);

    @Autowired
    private IStudentService studentService;
    @Autowired
    private IDromService dromService;
    @Autowired
    private IParentService parentService;
    @Autowired
    private IClassService classService;
    @Autowired
    private ITeacherService teacherService;
    @Autowired
    private IActionService actionService;
    @Autowired
    private IScoreService scoreService;
    @Autowired
    private ISkillService skillService;

    /**
     * 显示本班的所有学生信息
     * @return
     */
    @RequestMapping("/select")
    public String showStudentInfo(Model model, HttpServletRequest request){
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
        List<StudentInfo> studentInfoList = studentService.selectByClassId(classInfo.getClassId());

        //查找本班级所有宿舍
        List<DromInfo> dromInfoList = dromService.selectByClassId(classInfo.getClassId());

        model.addAttribute("dromList",dromInfoList);
        model.addAttribute("studentInfoList",studentInfoList);
        return "manage/studentInfo/student_info";
    }


    @RequestMapping("/add")
    @ResponseBody
    public Msg addStudent(StudentInfo studentInfo,HttpServletRequest request){
        try {
            //从session中获取班级信息直接为学生赋值
            ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
            studentInfo.setClassId(classInfo.getClassId());
            studentInfo.setMajorId(classInfo.getMajorId());
            studentInfo.setTeacherId(classInfo.getTeacherId());

            studentService.insert(studentInfo);

            //添加学生的同时，就添加该学生的家长初始账户
            logger.info("学生id"+studentInfo.getStuId());
            ParentInfo parentInfo = new ParentInfo();
            parentInfo.setParentName("家长1");
            parentInfo.setUserName(studentInfo.getStuNumber()+"1");
            parentInfo.setPassword("1234");
            parentInfo.setStuId(studentInfo.getStuId());

            ParentInfo parentInfo2 = new ParentInfo();
            parentInfo2.setParentName("家长2");
            parentInfo2.setUserName(studentInfo.getStuNumber()+"2");
            parentInfo2.setPassword("1234");
            parentInfo2.setStuId(studentInfo.getStuId());

            parentService.insert(parentInfo);
            parentService.insert(parentInfo2);

            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Msg deleteStudent(Integer studentId){
        try {
            studentService.delete(studentId);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }


    /**
     * 显示学生明细界面
     * @param model
     * @param request
     * @param studentId
     * @return
     */
    @RequestMapping("/showDetail")
    public String showDetail(Model model, HttpServletRequest request,Integer studentId){
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
        //查找本班级所有宿舍
        List<DromInfo> dromInfoList = dromService.selectByClassId(classInfo.getClassId());
        StudentInfo studentInfo = studentService.selectAllByStuId(studentId);

        model.addAttribute("dromList",dromInfoList);
        model.addAttribute("studentInfo",studentInfo);
        return "manage/studentInfo/student_detail";
    }

    /**
     * 更新学生教师评语
     * @param stuId
     * @param evaluate
     * @return
     */
    @RequestMapping("/updateEvaluate")
    @ResponseBody
    public Msg updateEvaluate(Integer stuId,String evaluate){
        try {
            StudentInfo studentInfo = studentService.selectByStuId(stuId);
            studentInfo.setEvaluate(evaluate);
            studentService.update(studentInfo);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }


    @RequestMapping("/update")
    @ResponseBody
    public Msg updateStudentInfo(StudentInfo studentInfo){
        try {
            StudentInfo student = studentService.selectByStuId(studentInfo.getStuId());

            student.setStuName(studentInfo.getStuName());
            student.setGenter(studentInfo.getGenter());
            student.setBackground(studentInfo.getBackground());
            student.setBirthday(studentInfo.getBirthday());
            student.setPhone(studentInfo.getPhone());
            student.setPosition(studentInfo.getPosition());
            student.setNowAddress(studentInfo.getNowAddress());
            student.setAddress(studentInfo.getAddress());
            student.setState(studentInfo.getState());
            student.setDromId(studentInfo.getDromId());
            student.setRemarks(studentInfo.getRemarks());

            studentService.update(student);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }


    /**
     * 导出学生信息明细表
     * @param request
     * @param response
     */
    @RequestMapping("/export")
    @ResponseBody
    public void importPurchaseOrder(HttpServletRequest request, HttpServletResponse response){
        List<StudentInfo> list = studentService.selectAll();

        //excel标题
        String[] title = {"学号","姓名","性别","政治面貌","出生日期","联系方式","职务","现住址","籍贯","状态","班级","专业","宿舍","班主任","备注"};

        //excel文件名
        String fileName = "studentInfo.xls";

        //sheet名
        String sheetName = "学生明细表";
        String [][] content = new String[list.size()][];
        for (int i = 0; i < list.size(); i++) {
            content[i] = new String[title.length];
            StudentInfo obj = list.get(i);
            if(obj.getStuNumber() != null){
                content[i][0] = obj.getStuNumber().toString();
            }
            if(obj.getStuName() != null){
                content[i][1] = obj.getStuName();
            }
            if(obj.getGenter() != null){
                content[i][2] = obj.getGenter();
            }
            if(obj.getBackground() != null){
                content[i][3] = obj.getBackground();
            }
            if(obj.getBirthday() != null){
                content[i][4] = new SimpleDateFormat("yyyy-MM-dd").format(obj.getBirthday());
            }
            if(obj.getPhone() != null){
                content[i][5] = obj.getPhone();
            }
            if(obj.getPosition() != null){
                content[i][6] = obj.getPosition();
            }
            if(obj.getNowAddress()!= null){
                content[i][7] = obj.getNowAddress();
            }
            if(obj.getAddress()!= null){
                content[i][8] = obj.getAddress();
            }
            if(obj.getState()!= null){
                content[i][9] = obj.getState();
            }
            if(obj.getClassNumber()!= null){
                content[i][10] = obj.getClassNumber();
            }
            if(obj.getMajorName()!= null){
                content[i][11] = obj.getMajorName();
            }
            if(obj.getDromName()!= null){
                content[i][12] = obj.getDromName();
            }
            if(obj.getTeacherName()!= null){
                content[i][13] = obj.getTeacherName();
            }
            if(obj.getRemarks()!= null){
                content[i][14] = obj.getRemarks();
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


    @RequestMapping("/selectByStuNumber")
    @ResponseBody
    public Msg selectByStuNumber(Long stuNumber){
        try {
            StudentInfo studentInfo = studentService.selectByStuNumber(stuNumber);
            return Msg.success().add("studentInfo",studentInfo);
        }catch (Exception e){
            return Msg.fail();
        }
    }


    @RequestMapping("/basicInfo")
    public String showStudentBasicInfo(Model model, HttpServletRequest request){
        StudentInfo studentInfo = (StudentInfo) request.getSession().getAttribute("studentInfo");
        List<ParentInfo> parentInfoList = parentService.selectByStudentId(studentInfo.getStuId());
        DromInfo dromInfo = dromService.selectById(studentInfo.getDromId());
        ClassInfo classInfo = classService.selectById(studentInfo.getClassId());
        List<StudentInfo> studentDromList = studentService.selectByDromId(studentInfo.getDromId());
        TeacherInfo teacherInfo = teacherService.selectById(studentInfo.getTeacherId());
        List<StudentInfo> classCommitteeList =  studentService.selectInPostion();//班委

        model.addAttribute("classCommitteeList",classCommitteeList);
        model.addAttribute("teacherInfo",teacherInfo);
        model.addAttribute("parentList",parentInfoList);
        model.addAttribute("dromInfo",dromInfo);
        model.addAttribute("classInfo",classInfo);
        model.addAttribute("studentDromList",studentDromList);
        return "parent/basci_info";
    }

    /**
     * 家长服务，综合查询跳转
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/synthesizeSelect")
    public String synthesizeSelect(Model model,HttpServletRequest request){
        StudentInfo studentInfo = (StudentInfo) request.getSession().getAttribute("studentInfo");
        List<ActionInfo> actionInfoList = actionService.selectByStudentId(studentInfo.getStuId());
        List<ScoreInfo> scoreInfoList = scoreService.selectByStudentId(studentInfo.getStuId());
        List<SkillScore> skillScoreList = skillService.selectByStudentId(studentInfo.getStuId());

        model.addAttribute("actionList",actionInfoList);
        model.addAttribute("scoreList",scoreInfoList);
        model.addAttribute("skillScoreList",skillScoreList);
        return "parent/synthesize_info";
    }


    @RequestMapping(value="/upoadPicture", method = RequestMethod.POST)
    public String upoadPicture(HttpServletRequest request, HttpServletResponse response,Model model){
        SmartUpload smart=new SmartUpload();
        try {
            smart.initialize(servletConfig,request,response);
            smart.setCharset("utf-8");
            smart.upload();
            //smart.save("/goodsImageUpoad");
            int stuId =Integer.valueOf(smart.getRequest().getParameter("stuId"));
            Files files=smart.getFiles();
            File file = files.getFile(0);
            String ext=file.getFileExt();
            String fileName= UUID.randomUUID().toString()+"."+ext;
            file.saveAs("/upload/"+fileName,SmartUpload.SAVE_VIRTUAL);
            if(studentService.addPicture("/upload/"+fileName, stuId)) {
                logger.info("更改图片成功，图片名："+fileName);
                model.addAttribute("msg","修改成功");
            }else {
                model.addAttribute("msg","修改失败");
                logger.info("更改图片失败，图片名："+fileName);
            }
            return "redirect:/student/showDetail?studentId="+stuId;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            logger.error(e);
            return "redirect:/student/select";
        }
    }
    private ServletConfig servletConfig;

    @Override
    public void setServletConfig(ServletConfig servletConfig) {
        this.servletConfig = servletConfig;
    }

}
