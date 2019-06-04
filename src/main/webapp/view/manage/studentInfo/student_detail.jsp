<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/26
  Time: 19:22
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
    <title>学生信息维护</title>

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
                    <h5>学生</h5>
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
                    <form class="form-horizontal" id="studentInfo_form">
                        <input type="hidden" name="stuId" value="${studentInfo.stuId}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">学号：</label>
                            <div class="col-sm-9">
                                <input type="text" value="${studentInfo.stuNumber}" class="form-control" disabled>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">姓名：</label>
                            <div class="col-sm-9">
                                <input type="text" value="${studentInfo.stuName}" name="stuName" class="form-control" >
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">性别：</label>
                            <div class="col-sm-9">
                                <select name="genter" class="form-control" id="genter_input">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">政治面貌：</label>
                            <div class="col-sm-9">
                                <input type="text" value="${studentInfo.background}" name="background" class="form-control" >
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">生日：</label>
                            <div class="col-sm-9">
                                <input type="date" value="${studentInfo.birthday}" name="birthday" class="form-control" >
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">电话：</label>
                            <div class="col-sm-9">
                                <input type="text" value="${studentInfo.phone}" name="phone" class="form-control" >
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">职务：</label>
                            <div class="col-sm-9">
                                <input type="text" value="${studentInfo.position}" name="position" class="form-control" >
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">现住址：</label>
                            <div class="col-sm-9">
                                <input type="text" value="${studentInfo.nowAddress}" name="nowAddress" class="form-control" >
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">籍贯：</label>
                            <div class="col-sm-9">
                                <input type="text" value="${studentInfo.address}" name="address" class="form-control" >
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">状态：</label>
                            <div class="col-sm-9">
                                <input type="text" value="${studentInfo.state}" name="state" class="form-control" >
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">宿舍：</label>
                            <div class="col-sm-9">
                                <select name="dromId" class="form-control" id="dromId_input">
                                    <option style='display: none'></option>
                                    <c:forEach items="${dromList}" var="drom">
                                        <option value="${drom.dromId}">${drom.dromName}</option>
                                    </c:forEach>
                                </select>
                                <span class="help-block"></span>
                            </div>
                        </div> <div class="form-group">
                        <label class="col-sm-3 control-label">备注：</label>
                        <div class="col-sm-9">
                            <input type="text" value="${studentInfo.remarks}" name="remarks" class="form-control" >
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
                    <h5>上传头像</h5>
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
                    <form action="${ctx}/student/upoadPicture" method="post" enctype="multipart/form-data">
                        <input id="pic" type="file" onchange="preview(this)"  name="file" class="form-control" style="width:200px;"/>
                        <input type="hidden" name="stuId" value="${studentInfo.stuId}">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">图片预览</label>
                            <div class="col-sm-10">
                                <div id="preview"></div>
                            </div>
                        </div>
                        <button class="btn btn-primary text-center"  type="submit">上传</button>
                    </form>
                </div>
            </div>
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>教师评价</h5>
                    <button id="edit" class="btn btn-primary btn-xs m-l-sm" onclick="edit()" type="button">编辑</button>
                    <button id="save" class="btn btn-primary  btn-xs" onclick="save()" type="button">保存</button>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content" id="eg">

                    <div class="click2edit wrapper">
                        ${studentInfo.evaluate}
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
    <c:if test="${msg != null}">
        layer.msg("${msg}");
    </c:if>
    $("#genter_input").val("${studentInfo.genter}");
    $("#dromId_input").val(${studentInfo.dromId});

    //上传图片之前预览图片
    function preview(file){
        if (file.files && file.files[0]){
            var reader = new FileReader();
            reader.onload = function(evt){
                $("#preview").html('<img src="' + evt.target.result + '" width="263px" height="175px" />');
            }
            reader.readAsDataURL(file.files[0]);
        }else{
            $("#preview").html('<div style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>');
        }
    }

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
        var stuId = ${studentInfo.stuId};
        $.ajax({
            url:"${ctx}/student/updateEvaluate",
            type:"POST",
            async:false,
            data:{'stuId':stuId,'evaluate':aHTML},
            success:function (data) {
                layer.msg(data.msg);
            }
        })
        $('.click2edit').destroy();
    };

    $("#save_btn").click(function () {
        var studentInfo = $("#studentInfo_form").serialize();
        console.info("要更新数据："+ studentInfo);
        $.ajax({
            url:"${ctx}/student/update",
            type:"POST",
            data:studentInfo,
            success:function (data) {
                layer.msg(data.msg);
            }
        })
    });

    $("#back_btn").click(function () {
        window.location.href = "${ctx}/student/select";
    });

</script>
</body>

</html>





