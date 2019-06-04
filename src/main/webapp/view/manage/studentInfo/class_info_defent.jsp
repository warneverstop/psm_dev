<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/26
  Time: 9:53
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
    <title>班级信息维护</title>

    <link rel="shortcut icon" href="${ctx}/favicon.ico">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="${ctx}/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>班级信息</h5>
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
                    <form class="form-horizontal" id="classInfo_form">
                        <input type="hidden" name="classId" value="${classInfo.classId}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">班级：</label>
                            <div class="col-sm-9">
                                <input type="text" value="${classInfo.classNumber}" class="form-control" id="classNumber_edit_input" disabled>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">学院：</label>
                            <div class="col-sm-9">
                                <input type="text" value="${classInfo.college}" class="form-control" id="college_edit_input" disabled>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">专业：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" value="${classInfo.majorName}" disabled>

                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">班主任：</label>
                            <div class="col-sm-9">
                                <input type="text" value="${classInfo.teacherName}" class="form-control" disabled>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">班长：</label>
                            <div class="col-sm-9">
                                <select name="studentId" class="form-control" id="studentId_edit_input">
                                    <option style='display: none'></option>
                                    <c:forEach items="${studentList}" var="student">
                                        <option value="${student.stuId}">${student.stuName}</option>
                                    </c:forEach>
                                </select>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">总人数：</label>
                            <div class="col-sm-9">
                                <input type="number" name="sumPeople" value="${classInfo.sumPeople}" class="form-control" id="sumPeople_edit_input" min="0" max="100">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </form>
                    <button type="button" class="btn btn-primary btn-lg btn-block" id="save_btn">保存修改</button>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>编辑/保存为html代码示例</h5>
                    <button id="edit" class="btn btn-primary btn-xs m-l-sm" onclick="edit()" type="button">编辑</button>
                    <button id="save" class="btn btn-primary  btn-xs" onclick="save()" type="button">保存</button>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="form_editors.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="form_editors.html#">选项1</a>
                            </li>
                            <li><a href="form_editors.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content" id="eg">

                    <div class="click2edit wrapper">
                        ${classInfo.profile}
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- 全局js -->
<script src="${ctx}/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/js/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="${ctx}/js/content.js?v=1.0.0"></script>
<!-- SUMMERNOTE -->
<script src="${ctx}/js/plugins/summernote/summernote.min.js"></script>
<script src="${ctx}/js/plugins/summernote/summernote-zh-CN.js"></script>

<script type="text/javascript" src="${ctx}/dist/layer-v3.1.1/layer/layer.js"></script>

<script>
     $("#studentId_edit_input").val(${classInfo.studentId});
     $(document).ready(function () {
         $('.summernote').summernote({
             lang: 'zh-CN'
         });
     });
     var edit = function () {
         $("#eg").addClass("no-padding");
         $('.click2edit').summernote({
             lang: 'zh-CN',
             focus: true
         });
     };
     var save = function () {
         $("#eg").removeClass("no-padding");
         var aHTML = $('.click2edit').code(); //save HTML If you need(aHTML: array).
         var classId = ${classInfo.classId};
         $.ajax({
             url:"${ctx}/class/updateProfile",
             type:"POST",
             async:false,
             data:{'classId':classId,'profile':aHTML},
             success:function (data) {
                 layer.msg(data.msg);
             }
         })
         $('.click2edit').destroy();
     };
     
     $("#save_btn").click(function () {
         var classInfo = $("#classInfo_form").serialize();
         console.info(classInfo);
         $.ajax({
             url:"${ctx}/class/update",
             type:"POST",
             data:classInfo,
             success:function (data) {
                 layer.msg(data.msg);
             }
         })
     });

</script>
</body>

</html>



