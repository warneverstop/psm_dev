package com.psm.controller;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.psm.dto.*;
import com.psm.service.*;
import com.psm.utils.ExcelUtil;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

    /**
     * 导入excel数据
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("/import")
    public String importStudentExecl(HttpServletRequest request,HttpServletResponse response,Model model){
        List<StudentInfo> studentInfoList = null;
        System.out.println("hello gril");
        response.setContentType("text/html;charset=UTF-8");
        try {
            FileItemFactory factory = new DiskFileItemFactory();
            // 文件上传核心工具类
            ServletFileUpload upload = new ServletFileUpload(factory);

            upload.setFileSizeMax(10 * 1024 * 1024); // 单个文件大小限制
            upload.setSizeMax(50 * 1024 * 1024); // 总文件大小限制
            upload.setHeaderEncoding("UTF-8"); // 对中文文件编码处理

            if (ServletFileUpload.isMultipartContent(request)) {
                List<FileItem> list = upload.parseRequest(request);
                // 遍历
                for (FileItem item : list) {
                    if (!item.isFormField()) {
                        String fileName = item.getName();
                        studentInfoList = readExcel(item.getInputStream(), fileName);
                    }
                }
            }
            model.addAttribute("studentList",studentInfoList);
            return "manage/studentInfo/add_student";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }


    public static List<StudentInfo> readExcel(InputStream is, String fileName) {
        List<StudentInfo> studentInfoList = new ArrayList<>();
        StudentInfo studentInfo = null;
        String type = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
        System.out.println("后缀名：" + type);
        try {
            Workbook hssfWorkbook = "xls".equals(type) ? new HSSFWorkbook(is) : new XSSFWorkbook(is);
            NumberFormat nf = NumberFormat.getInstance();
            //循环sheet
            for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
                Sheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
                if (hssfSheet == null) {
                    continue;
                }
                //循环row,第一行是标题，所以从第二行开始
                for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
                    Row hssfRow = hssfSheet.getRow(rowNum);
                    studentInfo = new StudentInfo();
                    if (hssfRow != null) {
                        //循环列
                        for (int cellNum = 0; cellNum < hssfRow.getLastCellNum(); cellNum++) {
                            Cell cell = hssfRow.getCell(cellNum);
                            if (cellNum == 0) {
                                //double stuNumber = cell.getNumericCellValue();
                                Long stuNumber = new Long(new Double(cell.getNumericCellValue()).longValue());
                                studentInfo.setStuNumber(stuNumber);
                            } else if (cellNum == 1) {
                                String stuName = cell.getStringCellValue();
                                studentInfo.setStuName(stuName);
                            }else if (cellNum == 2) {
                                String genter = cell.getStringCellValue();
                                studentInfo.setGenter(genter);
                            } else if (cellNum == 3) {
                                String backgroud = cell.getStringCellValue();
                                studentInfo.setBackground(backgroud);
                            }else if (cellNum == 4) {
                                String phone = nf.format(cell.getNumericCellValue());
                                //String phone = String.valueOf(cell.getNumericCellValue());
                                if (phone.indexOf(",") >= 0) {
                                    phone = phone.replace(",", "");
                                }
                                studentInfo.setPhone(phone);
                            }else if (cellNum == 5) {
                                String state = cell.getStringCellValue();
                                studentInfo.setState(state);
                            }else if (cellNum == 6) {
                                String remarks = cell.getStringCellValue();
                                studentInfo.setRemarks(remarks);
                            }
                        }
                    }
                    studentInfoList.add(studentInfo);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return studentInfoList;
    }

    /**
     * 批量添加学生信息列表
     * @param studentInfos
     * @param request
     * @return
     */
    @RequestMapping("/addStudentList")
    @ResponseBody
    public Msg addScoreList(@RequestBody StudentInfo[] studentInfos,HttpServletRequest request){
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
        try {
            for (StudentInfo stu:studentInfos) {
                //从session中获取班级信息直接为学生赋值
                stu.setClassId(classInfo.getClassId());
                stu.setMajorId(classInfo.getMajorId());
                stu.setTeacherId(classInfo.getTeacherId());
                studentService.insert(stu);

                //添加学生的同时，就添加该学生的家长初始账户
                logger.info("学生id"+stu.getStuId());
                ParentInfo parentInfo = new ParentInfo();
                parentInfo.setParentName("家长1");
                parentInfo.setUserName(stu.getStuNumber()+"1");
                parentInfo.setPassword("1234");
                parentInfo.setStuId(stu.getStuId());

                ParentInfo parentInfo2 = new ParentInfo();
                parentInfo2.setParentName("家长2");
                parentInfo2.setUserName(stu.getStuNumber()+"2");
                parentInfo2.setPassword("1234");
                parentInfo2.setStuId(stu.getStuId());

                parentService.insert(parentInfo);
                parentService.insert(parentInfo2);
            }
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }
}
