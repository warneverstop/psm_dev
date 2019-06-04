<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/28
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H+ 后台主题UI框架 - 学生技能成绩管理</title>
    <link rel="shortcut icon" href="${ctx}/favicon.ico">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <!-- Data Tables -->
    <link href="${ctx}/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">


<!-- 添加的模态框 -->
<div class="modal fade" id="objectAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">成绩添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">技能：</label>
                        <div class="col-sm-9">
                            <select class="form-control m-b" name="skillId">
                                <option style='display: none'></option>
                                <c:forEach items="${skillInfos}" var="skill">
                                    <option value="${skill.skillId}">${skill.skillName}</option>
                                </c:forEach>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">学号：</label>
                        <div class="col-sm-9">
                            <input type="text" name="stuNumber" class="form-control" id="stuNumber_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">姓名：</label>
                        <div class="col-sm-9">
                            <input type="hidden" name="stuId" id="stuId_add_input">
                            <input type="text" name="stuName" class="form-control" id="stuName_add_input" readonly>
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="object_save_btn">添加</button>
            </div>
        </div>
    </div>
</div>



<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>技能成绩信息</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="">
                        <div class="row" style="margin-right: 40px;margin-left: 0px;">
                            <form class="form-horizontal" id="skill_condition_form">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">学号：</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" name="stuNumber" id="stuNumber">
                                    </div>
                                    <label class="col-sm-1 control-label">技能：</label>
                                    <div class="col-sm-3">
                                        <select class="form-control m-b" name="skillId" id="skillId">
                                            <option style='display: none'></option>
                                            <c:forEach items="${skillInfos}" var="skill">
                                                <option value="${skill.skillId}">${skill.skillName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <button type="button" class="btn btn-primary btn-sm" id="select_score_btn">查询</button>
                        <button type="button" class="btn btn-primary btn-sm" id="add_score_btn">添加</button>
                        <button type="button" class="btn btn-primary btn-sm">导出</button>
                    </div>
                    <table class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                        <tr>
                            <th style="width:100px;">学号</th>
                            <th style="width:80px;">姓名</th>
                            <th class="text-center">技能证书</th>
                            <th class="text-center" style="width:300px;">技能简介</th>
                            <th class="text-center">状态</th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${skillScoreList}" var="score">
                            <tr class="gradeX">
                                <td>${score.stuNumber}</td>
                                <td>${score.stuName}</td>
                                <td class="text-center">${score.skillName}</td>
                                <td>${score.profile}</td>
                                <c:if test="${score.state == 1}">
                                    <td class="text-center">通过</td>
                                </c:if>
                                <td class="text-center">
                                    <c:if test="${fn:contains(user.powerNames, 'edit_skill_info')}">
                                    <button type="button" class="btn btn-danger btn-xs" onclick="deleteObject(${score.id})">删除</button>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 全局js -->
<script src="${ctx}/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/js/bootstrap.min.js?v=3.3.6"></script>



<script src="${ctx}/js/plugins/jeditable/jquery.jeditable.js"></script>

<!-- Data Tables -->
<script src="${ctx}/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${ctx}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

<!-- 自定义js -->
<script src="${ctx}/js/content.js?v=1.0.0"></script>
<script type="text/javascript" src="${ctx}/dist/layer-v3.1.1/layer/layer.js"></script>


<!-- Page-Level Scripts -->
<script>
    $(document).ready(function () {
        $('.dataTables-example').dataTable();
    });

    //清空表单内容
    function reset_form(ele){
        $(ele)[0].reset();
    }
    //添加按钮
    $("#add_score_btn").click(function () {
        reset_form("#objectAddModal form");
        $("#objectAddModal").modal({
            backdrop:"static"
        });
    });
    //保存按钮
    $("#object_save_btn").click(function () {
        if ($("#stuId_add_input").val() == null){
            layer.msg("学号不存在，不能保存");
            return false;
        }
        var addFormDate = $("#objectAddModal form").serialize();
        console.info(addFormDate);
        $.ajax({
            url:"${ctx}/skill/insertScore",
            type:"POST",
            data:addFormDate,
            success:function (data) {
                if(data.code == 100){
                    $("#objectAddModal").modal('hide');
                    layer.msg(data.msg, {icon: 1,time: 1000}, function(){
                        window.location.reload();
                    });
                }else{
                    layer.msg(data.msg)
                }
            }
        })
    });

    function deleteObject(id) {
        layer.confirm('确定要删除吗?', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url:"${ctx}/skill/deleteScore",
                type:"POST",
                data:{"id":id},
                async:false,
                success:function (data) {
                    if(data.code == 100){
                        layer.msg(data.msg, {icon: 1,time: 1000}, function(){
                            window.location.reload();
                        });
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
            layer.close(index);//关闭弹窗方法
        });
    }
    
    $("#stuNumber_add_input").change(function () {
        var stuNumber = $("#stuNumber_add_input").val();
        $.ajax({
            url:"${ctx}/student/selectByStuNumber",
            type:"get",
            data:{"stuNumber":stuNumber},
            dataType:"JSON",
            success:function (data) {
                var studentInfo = data.extend.studentInfo;
                if(studentInfo == null){
                    layer.msg("没有该学号学生，请重新输入！");
                }else{
                    $("#stuId_add_input").val(studentInfo.stuId);
                    $("#stuName_add_input").val(studentInfo.stuName);
                }
            }
        })
    });

    $("#select_score_btn").click(function () {
        var stuNumber = $("#stuNumber").val();
        var skillId = $("#skillId").val();
        if(stuNumber != ""){
            if(skillId != ""){
                window.location.href = "${ctx}/skill/selectScoreByCondition?stuNumber="+stuNumber+"&skillId="+skillId;
            }else{
                window.location.href = "${ctx}/skill/selectScoreByCondition?stuNumber="+stuNumber;
            }
        }else{
            if(skillId != ""){
                window.location.href = "${ctx}/skill/selectScoreByCondition?skillId="+skillId;
            }else{
                layer.msg("查找条件为空，请输入查询条件");
            }
        }

    });
    
</script>

</body>

</html>
