<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/24
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>班级管理</title>

    <link rel="shortcut icon" href="${ctx}/favicon.ico">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${ctx}/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<!-- 修改的模态框 -->
<div class="modal fade" id="objectEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabe2">班级修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <input type="hidden" name="classId" id="classId_edit_input">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">班级：</label>
                        <div class="col-sm-9">
                            <input type="text" name="classNumber" class="form-control" id="classNumber_edit_input" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">学院：</label>
                        <div class="col-sm-9">
                            <input type="text" name="college" class="form-control" id="college_edit_input" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">专业：</label>
                        <div class="col-sm-9">
                            <select name="majorId" class="form-control" id="majorId_edit_input">
                                <option style='display: none'></option>
                                <c:forEach items="${majorList}" var="major">

                                    <option value="${major.majorId}">${major.majorName}</option>
                                </c:forEach>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">班主任：</label>
                        <div class="col-sm-9">
                            <select name="teacherId" class="form-control" id="teacherId_edit_input">
                                <option style='display: none'></option>
                                <c:forEach items="${teacherList}" var="teacher">
                                    <option value="${teacher.teacherId}">${teacher.teacherName}</option>
                                </c:forEach>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">班长：</label>
                        <div class="col-sm-9">
                            <select name="studentId" class="form-control" id="studentId_edit_input">
                                <option style='display: none'></option>
                                <c:forEach items="${studentList}" var="student">
                                    <option value="${student.studentId}">${student.studentName}</option>
                                </c:forEach>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">总人数：</label>
                        <div class="col-sm-9">
                            <input type="number" name="sumPeople" class="form-control" id="sumPeople_edit_input" min="0" max="100">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">备注：</label>
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

<!-- 添加的模态框 -->
<div class="modal fade" id="objectAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">班级添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">班级：</label>
                        <div class="col-sm-9">
                            <input type="text" name="classNumber" class="form-control" placeholder="15090441">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">学院：</label>
                        <div class="col-sm-9">
                            <input type="text" name="college" class="form-control" placeholder="经济与管理学院">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">专业：</label>
                        <div class="col-sm-9">
                            <select name="majorId" class="form-control">
                                <option style='display: none'></option>
                                <c:forEach items="${majorList}" var="major">
                                    <option value="${major.majorId}">${major.majorName}</option>
                                </c:forEach>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">班主任：</label>
                        <div class="col-sm-9">
                            <select name="teacherId" class="form-control">
                                <option style='display: none'></option>
                                <c:forEach items="${teacherList}" var="teacher">
                                    <option value="${teacher.teacherId}">${teacher.teacherName}</option>
                                </c:forEach>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">备注：</label>
                        <div class="col-sm-9">
                            <input type="text" name="remarks" class="form-control">
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


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <button type="button" class="btn btn-primary" id="addObject">添加</button>
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
                    <table id="table-id" class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                        <tr>
                            <th style="">班级</th>
                            <th style="">专业</th>
                            <th style="">学院</th>
                            <th style="">班主任</th>
                            <th style="">班长</th>
                            <th>总人数</th>
                            <th style="">备注</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="classInfo" items="${classList}">
                            <tr class="gradeX">
                                <td>${classInfo.classNumber}</td>
                                <td>${classInfo.majorName}</td>
                                <td>${classInfo.college}</td>
                                <td>${classInfo.teacherName}</td>
                                <td>${classInfo.studentName}</td>
                                <td>${classInfo.sumPeople}</td>
                                <td>${classInfo.remarks}</td>
                                <td>
                                    <button type="button" class="btn btn-warning btn-xs" onclick="editObject(${classInfo.classId})">修改</button>
                                    <button type="button" class="btn btn-danger btn-xs" onclick="deleteObject(${classInfo.classId})">删除</button>
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
        $('#editable').dataTable();
    });

    //清空表单内容
    function reset_form(ele){
        $(ele)[0].reset();
    }
    //添加按钮
    $("#addObject").click(function () {
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
            url:"${ctx}/class/save",
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
            url:"${ctx}/class/selectById",
            type:"POST",
            data:{"classId":id},
            async:false,
            success:function (data) {
                console.info(data);
                var classInfo = data.extend.classInfo;
                $("#classId_edit_input").val(classInfo.classId);
                $("#classNumber_edit_input").val(classInfo.classNumber);
                $("#college_edit_input").val(classInfo.college);
                $("#majorId_edit_input").val(classInfo.majorId);
                $("#teacherId_edit_input").val(classInfo.teacherId);
                $("#studentId_edit_input").val(classInfo.studentId);
                $("#sumPeople_edit_input").val(classInfo.sumPeople);
                $("#remarks_edit_input").val(classInfo.remarks);
            }
        })
    }

    $("#object_edit_btn").click(function () {
        var editFormData = $("#objectEditModal form").serialize();
        console.info(editFormData);
        $.ajax({
            url:"${ctx}/class/save",
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
                url:"${ctx}/class/delete",
                type:"POST",
                data:{"classId":id},
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
</script>


</body>

</html>


