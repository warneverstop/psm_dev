package com.psm.controller;

import com.psm.dto.*;
import com.psm.fo.SkillScoreFormObject;
import com.psm.service.IDromService;
import com.psm.service.ISkillService;
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
 * @creat: 2019/5/27 20:23
 **/
@Controller
@RequestMapping("/skill")
public class SkillController {
    private Logger logger = Logger.getLogger(ClassController.class);

    @Autowired
    private ISkillService skillService;

    @RequestMapping("/select")
    public String showPage(Model model){
        List<SkillInfo> skillInfoList = skillService.selectAll();
        model.addAttribute("skillList",skillInfoList);
        return "manage/studentInfo/skill_info_manage";
    }

    @RequestMapping("/selectById")
    @ResponseBody
    public Msg selectById(Integer skillId){
        try {
            SkillInfo skillInfo = skillService.selectById(skillId);
            return Msg.success().add("skillInfo",skillInfo);
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/save")
    @ResponseBody
    public Msg saveObject(SkillInfo skillInfo){
        try {
            if(skillInfo.getSkillId() == null){
                skillInfo.setDel(1);
                skillService.insert(skillInfo);
            }else{
                SkillInfo skill = skillService.selectById(skillInfo.getSkillId());
                skill.setSkillName(skillInfo.getSkillName());
                skill.setProfile(skillInfo.getProfile());
                skill.setUrl(skillInfo.getUrl());
                skillService.update(skill);
            }
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Msg deleteObject(Integer skillId){
        try {
            SkillInfo skillInfo = skillService.selectById(skillId);
            skillInfo.setDel(0);
            skillService.update(skillInfo);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/selectScore")
    public String showSkillScore(Model model, HttpServletRequest request){
        //显示本班的技能等级成绩
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
        List<SkillScore> skillScoreList = skillService.selectScoreByClassId(classInfo.getClassId());

        //查询所有的技能种类
        List<SkillInfo> skillInfos = skillService.selectAll();

        model.addAttribute("skillInfos",skillInfos);
        model.addAttribute("skillScoreList",skillScoreList);
        return "manage/studentInfo/skill_score";
    }

    @RequestMapping("/insertScore")
    @ResponseBody
    public Msg inserSkillScore(SkillScore skillScore){
        logger.info("插入的成绩数据："+skillScore.toString());
        try {
            skillScore.setState(1);
            skillService.insertSkillScore(skillScore);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/deleteScore")
    @ResponseBody
    public Msg deleteScoreSkillScore(Integer id){
        logger.info("删除的成绩数据："+id);
        try {
            skillService.deleteSkillScore(id);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/selectScoreByCondition")
    public String selectScoreByCondition(Model model, HttpServletRequest request, SkillScoreFormObject scoreFormObject){
        logger.info("查询条件：" + scoreFormObject.toString());

        //显示本班的符合条件的技能等级成绩
        ClassInfo classInfo = (ClassInfo) request.getSession().getAttribute("classInfo");
        List<SkillScore> skillScoreList = skillService.selectScoreByCondition(classInfo.getClassId(),
                scoreFormObject.getStuNumber(),
                scoreFormObject.getSkillId());

        //查询所有的技能种类
        List<SkillInfo> skillInfos = skillService.selectAll();

        model.addAttribute("skillInfos",skillInfos);
        model.addAttribute("skillScoreList",skillScoreList);
        return "manage/studentInfo/skill_score";
    }

}
