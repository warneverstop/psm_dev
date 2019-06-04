<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/26
  Time: 17:55
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
    <title>宿舍信息维护</title>

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
                    <h5>宿舍信息</h5>
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
                    <form class="form-horizontal" id="dromInfo_form">
                        <input type="hidden" name="dromId" value="${dromInfo.dromId}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">宿舍：</label>
                            <div class="col-sm-9">
                                <input type="text" value="${dromInfo.dromName}" class="form-control" id="classNumber_edit_input" disabled>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">地址：</label>
                            <div class="col-sm-9">
                                <input type="text" value="${dromInfo.dromAddress}" class="form-control" id="college_edit_input" disabled >
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">标准：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" value="${dromInfo.standrad}" disabled>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">已住：</label>
                            <div class="col-sm-9">
                                <input type="text" value="${dromInfo.alreadyLived}" name="alreadyLived" class="form-control" >
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">备注：</label>
                            <div class="col-sm-9">
                                <input type="text" value="${dromInfo.remarks}" name="remarks" class="form-control" >
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </form>
                    <button type="button" class="btn btn-primary btn-lg btn-block" id="save_btn">保存</button>
                    <button type="button" class="btn btn-primary btn-lg btn-block" id="back_btn">返回</button>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>宿舍简介</h5>
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
                        ${dromInfo.profile}
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
        var dromId = ${dromInfo.dromId};
        $.ajax({
            url:"${ctx}/drom/updateProfile",
            type:"POST",
            async:false,
            data:{'dromId':dromId,'profile':aHTML},
            success:function (data) {
                layer.msg(data.msg);
            }
        })
        $('.click2edit').destroy();
    };

    $("#save_btn").click(function () {
        var dromInfo = $("#dromInfo_form").serialize();
        console.info("要更新数据："+ dromInfo);
        $.ajax({
            url:"${ctx}/drom/update",
            type:"POST",
            data:dromInfo,
            success:function (data) {
                layer.msg(data.msg);
            }
        })
    });

    $("#back_btn").click(function () {
        window.location.href = "${ctx}/drom/showDromDefent";
    });

</script>
</body>

</html>




