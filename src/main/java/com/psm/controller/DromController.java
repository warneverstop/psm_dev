package com.psm.controller;

import com.psm.dto.ClassDrom;
import com.psm.dto.ClassInfo;
import com.psm.dto.DromInfo;
import com.psm.dto.Msg;
import com.psm.service.IDromService;
import com.sun.org.apache.xpath.internal.operations.Mod;
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
 * @creat: 2019/5/24 18:37
 **/
@Controller
@RequestMapping("/drom")
public class DromController {
    private Logger logger = Logger.getLogger(ClassController.class);

    @Autowired
    private IDromService dromService;

    @RequestMapping("/select")
    public String showPage(Model model){
        List<DromInfo> dromInfoList = dromService.selectAll();
        model.addAttribute("dromList",dromInfoList);
        return "manage/basicData/drom_info";
    }

    @RequestMapping("/selectById")
    @ResponseBody
    public Msg selectById(Integer dromId){
        try {
            DromInfo dromInfo = dromService.selectById(dromId);
            return Msg.success().add("dromInfo",dromInfo);
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/save")
    @ResponseBody
    public Msg saveObject(DromInfo dromInfo){
        try {
            if(dromInfo.getDromId() == null){
                dromInfo.setDel(1);
                dromService.insertDrom(dromInfo);
            }else {
                DromInfo drom = dromService.selectById(dromInfo.getDromId());
                drom.setAlreadyLived(dromInfo.getAlreadyLived());
                drom.setDromAddress(dromInfo.getDromAddress());
                drom.setDromName(dromInfo.getDromName());
                drom.setProfile(dromInfo.getProfile());
                drom.setRemarks(dromInfo.getRemarks());
                drom.setStandrad(dromInfo.getStandrad());
                dromService.updateDrom(drom);
            }
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Msg deleteById(Integer dromId){
        try {
            DromInfo dromInfo = dromService.selectById(dromId);
            dromInfo.setDel(0);
            dromService.updateDrom(dromInfo);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    /**
     * 显示本班级宿舍维护界面
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/showDromDefent")
    public String showDromDefent(Model model, HttpServletRequest request){
        List<DromInfo> dromList = dromService.selectAll();
        //查找本班级的所有宿舍
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
        List<DromInfo> dromInfoList = dromService.selectByClassId(classInfo.getClassId());


        model.addAttribute("dromInfoList",dromInfoList);
        model.addAttribute("dromList",dromList);
        return "manage/studentInfo/drom_info_defent";
    }

    /**
     * 根据宿舍id删除本班级内的宿舍
     * @param dromId
     * @return
     */
    @RequestMapping("/deleteInClass")
    @ResponseBody
    public Msg delectInClass(Integer dromId,HttpServletRequest request){
        try {
            ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
            dromService.delectByDromIdAndClassId(dromId,classInfo.getClassId());
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    /**
     * 为班级添加宿舍
     * @param dromId
     * @param request
     * @return
     */
    @RequestMapping("/addForClass")
    @ResponseBody
    public Msg addForClass(Integer dromId,HttpServletRequest request){
        try {
            ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
            ClassDrom classDrom = new ClassDrom();
            classDrom.setClassId(classInfo.getClassId());
            classDrom.setDromId(dromId);

            dromService.insertDromForclass(classDrom);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    /**
     * 显示宿舍明细
     * @param model
     * @param dromId
     * @return
     */
    @RequestMapping("/showDetail")
    public String showDetail(Model model,Integer dromId){
        DromInfo dromInfo = dromService.selectById(dromId);
        model.addAttribute("dromInfo",dromInfo);
        return "manage/studentInfo/drom_detail_defent";
    }

    /**
     * 更新宿舍简介
     * @param dromId
     * @param profile
     * @return
     */
    @RequestMapping("/updateProfile")
    @ResponseBody
    public Msg updateProfile(Integer dromId,String profile){
        try {
            DromInfo dromInfo = dromService.selectById(dromId);
            dromInfo.setProfile(profile);
            dromService.updateDrom(dromInfo);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/update")
    @ResponseBody
    public Msg update(DromInfo dromInfo){
        try {
            DromInfo drom = dromService.selectById(dromInfo.getDromId());
            drom.setAlreadyLived(dromInfo.getAlreadyLived());
            drom.setRemarks(dromInfo.getRemarks());
            dromService.updateDrom(drom);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

}
