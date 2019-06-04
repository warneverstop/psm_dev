<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/28
  Time: 19:17
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
    <title>H+ 后台主题UI框架 - 学生成绩</title>
    <link rel="shortcut icon" href="${ctx}/favicon.ico">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <!-- Data Tables -->
    <link href="${ctx}/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">

<!-- 单科成绩添加的模态框 -->
<div class="modal fade" id="addScoreModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabe3">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabe3">成绩添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">学年学期：</label>
                        <div class="col-sm-9">
                            <select class="form-control m-b" name="schoolYear" id="schoolYear_input">
                                <option style='display: none'></option>
                                <option value="大一上">大一上</option>
                                <option value="大一下">大一下</option>
                                <option value="大二上">大二上</option>
                                <option value="大二下">大二下</option>
                                <option value="大三上">大三上</option>
                                <option value="大三下">大三下</option>
                                <option value="大四上">大四上</option>
                                <option value="大四下">大四下</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">课程名称：</label>
                        <div class="col-sm-9">
                            <input type="text" name="courseName" class="form-control" id="courseName_input" >
                            <input type="hidden" name="courseId" id="courseId_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="score_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

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
                        <label class="col-sm-3 control-label">学年学期：</label>
                        <div class="col-sm-9">
                            <select class="form-control m-b" name="schoolYear" id="schoolYear_add_input">
                                <option style='display: none'></option>
                                <option value="大一上">大一上</option>
                                <option value="大一下">大一下</option>
                                <option value="大二上">大二上</option>
                                <option value="大二下">大二下</option>
                                <option value="大三上">大三上</option>
                                <option value="大三下">大三下</option>
                                <option value="大四上">大四上</option>
                                <option value="大四下">大四下</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">课程名称：</label>
                        <div class="col-sm-9">
                            <input type="text" name="courseName" class="form-control" id="courseName_add_input" >
                            <input type="hidden" name="courseId" id="courseId_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">学号：</label>
                        <div class="col-sm-9">
                            <input type="text" name="stuNumber" class="form-control" id="stuNumber_add_input">
                            <input type="hidden" name="stuId" id="stuId_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">成绩：</label>
                        <div class="col-sm-9">
                            <input type="number" name="grade" class="form-control" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="object_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改的模态框 -->
<div class="modal fade" id="objectEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabe2">成绩修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <input type="hidden" name="scoreId" id="scoreId_edit_input">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">课程：</label>
                        <div class="col-sm-9">
                            <input type="text" name="courseName" class="form-control" id="courseName_edit_input" disabled>
                            <input type="hidden" name="courseId" id="courseId_edit_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">学号：</label>
                        <div class="col-sm-9">
                            <input type="text" name="stuNumber" class="form-control" id="stuNumber_edit_input" disabled>
                            <input type="hidden" name="stuId" id="stuId_edit_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">成绩：</label>
                        <div class="col-sm-9">
                            <input type="number" name="grade" class="form-control" id="grade_edit_input" min="0" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">补考备注：</label>
                        <div class="col-sm-9">
                            <input type="text" name="remarks" class="form-control" id="remarks_edit_input" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="object_edit_btn">保存</button>
            </div>
        </div>
    </div>
</div>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>成绩信息</h5>
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
                            <form class="form-horizontal" id="select_form" action="${ctx}/score/selectByCondition" method="post">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">课程：</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" name="courseName" id="courseName">
                                    </div>
                                    <label class="col-sm-1 control-label">属性：</label>
                                    <div class="col-sm-3">
                                        <select class="form-control m-b" name="attribute" id="attribute_input">
                                            <option style='display: none'></option>
                                            <option value="必修">必修</option>
                                            <option value="选修">选修</option>
                                            <option value="任选">任选</option>
                                        </select>
                                    </div>

                                    <label class="col-sm-1 control-label">学期：</label>
                                    <div class="col-sm-3">
                                        <select class="form-control m-b" name="schoolYear" id="schoolYear">
                                            <option style='display: none'></option>
                                            <option value="大一上">大一上</option>
                                            <option value="大一下">大一下</option>
                                            <option value="大二上">大二上</option>
                                            <option value="大二下">大二下</option>
                                            <option value="大三上">大三上</option>
                                            <option value="大三下">大三下</option>
                                            <option value="大四上">大四上</option>
                                            <option value="大四下">大四下</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label">学号：</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" name="stuNumber" id="stuNumber" />
                                    </div>
                                    <label class="col-sm-1 control-label">成绩：</label>
                                    <div class="col-sm-3">
                                        <select class="form-control m-b" name="grade" id="grade">
                                            <option style='display: none'></option>
                                            <option value="0">不及格</option>
                                            <option value="1">及格</option>
                                            <option value="2">中</option>
                                            <option value="3">良</option>
                                            <option value="4">优</option>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <button type="button" class="btn btn-primary btn-sm" id="select_btn">查询</button>
                        <button type="button" class="btn btn-primary btn-sm" id="reset_btn">重置</button>
                        <button type="button" class="btn btn-primary btn-sm" id="add_one_btn">添加单条</button>
                        <button type="button" class="btn btn-primary btn-sm" id="add_score_btn">添加单科</button>
                        <button type="button" class="btn btn-primary btn-sm" id="export_btn">导出成绩</button>
                    </div>
                    <table class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                        <tr>
                            <th style="">学号</th>
                            <th >姓名</th>
                            <th class="text-center">课程</th>
                            <th class="text-center">属性</th>
                            <th class="text-center">学分</th>
                            <th class="text-center" style="width:220px;">重修补考备注</th>
                            <th style="" class="text-center">成绩</th>
                            <th style="" class="text-center">学年学期</th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${scoreList}" var="scoreInfo">
                            <tr class="gradeX">
                                <td>${scoreInfo.stuNumber}</td>
                                <td>${scoreInfo.stuName}</td>
                                <td class="text-center">${scoreInfo.courseName}</td>
                                <td class="text-center">${scoreInfo.attribute}</td>
                                <td class="text-center">${scoreInfo.credit}</td>
                                <td class="text-center">${scoreInfo.remarks}</td>
                                <td class="text-center">${scoreInfo.grade}</td>
                                <td class="text-center">${scoreInfo.schoolYear}</td>
                                <td class="text-center">
                                    <button type="button" class="btn btn-warning btn-xs" onclick="editObject(${scoreInfo.scoreId})">修改</button>
                                    <c:if test="${fn:contains(user.powerNames, 'edit_score_info')}">
                                    <button type="button" class="btn btn-danger btn-xs" onclick="deleteObject(${scoreInfo.scoreId})">删除</button>
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
    <c:if test="${conditon != null}">
        $("#courseName").val("${conditon.courseName}");
        $("#schoolYear").val("${conditon.schoolYear}");
        $("#stuNumber").val("${conditon.stuNumber}");
        $("#grade").val(${conditon.grade});
        $("#attribute_input").val("${conditon.attribute}");
    </c:if>

    $(document).ready(function () {
        $('.dataTables-example').dataTable();
    });

    $("#select_btn").click(function () {
        $("#select_form").submit();
    });

    $("#reset_btn").click(function () {
        $("input").val("");
        $("select").val("");
    });


    //清空表单内容
    function reset_form(ele){
        $(ele)[0].reset();
    }
    //添加按钮
    $("#add_one_btn").click(function () {
        reset_form("#objectAddModal form");
        $("#objectAddModal").modal({
            backdrop:"static"
        });
    });
    //保存按钮
    $("#object_save_btn").click(function () {
        var addFormDate = $("#objectAddModal form").serialize();
        console.info(addFormDate);
        $.ajax({
            url:"${ctx}/score/save",
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

    //填写课程名后自动查找
    $("#courseName_add_input").on("change",function(){
        var courseName = $("#courseName_add_input").val();
        console.info("课程:"+courseName);
        $.ajax({
            url:"${ctx}/course/selectByName",
            type:"get",
            data:{"courseName":courseName},
            dataType:"JSON",
            success:function (data) {
                if(data.code == 100){
                    if(data.extend.courseInfo == null){
                        layer.msg("课程不存在");
                    }else{
                        var courseInfo = data.extend.courseInfo;
                        $("#courseId_add_input").val(courseInfo.courseId);
                        layer.msg("课程存在");
                    }

                }else{
                    layer.msg(data.msg);
                }
            }
        })
    });

    //填写学号后自动查找
    $("#stuNumber_add_input").on("change",function(){
        var stuNumber = $("#stuNumber_add_input").val();
        console.info("学号:"+stuNumber);
        $.ajax({
            url:"${ctx}/student/selectByStuNumber",
            type:"get",
            data:{"stuNumber":stuNumber},
            dataType:"JSON",
            success:function (data) {
                if(data.code == 100){
                    if(data.extend.studentInfo == null){
                        layer.msg("学生不存在");
                    }else{
                        var studentInfo = data.extend.studentInfo;
                        $("#stuId_add_input").val(studentInfo.stuId);
                        layer.msg("学生存在");
                    }

                }else{
                    layer.msg(data.msg);
                }
            }
        })
    });


    //修改对象信息
    function editObject(id){
        reset_form("#objectEditModal form");
        setEditModalData(id);
        $("#objectEditModal").modal({
            backdrop:"static"
        });
    }

    function setEditModalData(id){
        $.ajax({
            url:"${ctx}/score/selectById",
            type:"POST",
            data:{"scoreId":id},
            async:false,
            success:function (data) {
                console.info(data);
                var scoreInfo = data.extend.scoreInfo;
                $("#scoreId_edit_input").val(scoreInfo.scoreId);
                $("#courseName_edit_input").val(scoreInfo.courseName);
                $("#courseId_edit_input").val(scoreInfo.courseId);
                $("#stuNumber_edit_input").val(scoreInfo.stuNumber);
                $("#stuId_edit_input").val(scoreInfo.stuId);
                $("#grade_edit_input").val(scoreInfo.grade);
                $("#remarks_edit_input").val(scoreInfo.remarks);
            }
        })
    }

    $("#object_edit_btn").click(function () {
        var editFormData = $("#objectEditModal form").serialize();
        console.info(editFormData);
        $.ajax({
            url:"${ctx}/score/save",
            type:"POST",
            data:editFormData,
            success:function (data) {
                if(data.code == 100){
                    $("#objectEditModal").modal('hide');
                    layer.msg(data.msg, {icon: 1,time: 1000}, function(){
                        window.location.reload();
                    });
                }else{
                    layer.msg(data.msg)
                }
            }
        })
    });

    function deleteObject(id){
        layer.confirm('确定要删除吗?', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url:"${ctx}/score/delete",
                type:"POST",
                data:{"scoreId":id},
                async:false,
                success:function (data) {
                    if(data.code == 100){
                        layer.msg(data.msg, {icon: 1,time: 1000}, function(){
                            window.location.reload();
                        });
                    }else{
                        layer.msg(data.msg)
                    }
                }
            });
            layer.close(index);//关闭弹窗方法
        });
    }

    $("#export_btn").click(function () {
        layer.confirm('确定要导出该查询条件中的学生成绩吗?', {icon: 3, title:'提示'}, function(index){
            layer.close(index);//关闭弹窗方法
            var courseName= $("#courseName").val();
            var attribute= $("#attribute_input").val();
            var schoolYear= $("#schoolYear").val();
            var stuNumber= $("#stuNumber").val();
            var grade= $("#grade").val();
            window.location.href = "${ctx}/score/export?courseName="+courseName+"&attribute="+attribute+"&schoolYear="+schoolYear+"&stuNumber="+stuNumber+"&grade="+grade;
        });
    });

    //填写课程名后自动查找
    $("#courseName_input").on("change",function(){
        var courseName = $("#courseName_input").val();
        console.info("课程:"+courseName);
        $.ajax({
            url:"${ctx}/course/selectByName",
            type:"get",
            data:{"courseName":courseName},
            dataType:"JSON",
            success:function (data) {
                if(data.code == 100){
                    if(data.extend.courseInfo == null){
                        layer.msg("课程不存在");
                    }else{
                        var courseInfo = data.extend.courseInfo;
                        $("#courseId_input").val(courseInfo.courseId);
                        layer.msg("课程存在");
                    }

                }else{
                    layer.msg(data.msg);
                }
            }
        })
    });

    //添加按钮
    $("#add_score_btn").click(function () {
        reset_form("#addScoreModal form");
        $("#addScoreModal").modal({
            backdrop:"static"
        });
    });
    $("#score_save_btn").click(function () {
        var schoolYear = $("#schoolYear_input").val();
        var courseId = $("#courseId_input").val();
        if(courseId == null || schoolYear == null || courseId == '' || schoolYear == ''){
            layer.msg("输入有效值");
        }else{
            window.location.href = "${ctx}/score/addByCourse?schoolYear="+ schoolYear+"&courseId=" + courseId ;
        }
    });

</script>

</body>

</html>
