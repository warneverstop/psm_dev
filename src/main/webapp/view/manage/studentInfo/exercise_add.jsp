<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/31
  Time: 10:37
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
    <title>添加</title>

    <link rel="shortcut icon" href="${ctx}/favicon.ico">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/dist/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet">
    <!-- Data Tables -->
    <link href="${ctx}/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <button type="button" class="btn btn-primary" id="submit_btn">提交</button>
                    <button type="button" class="btn btn-primary" id="back_btn">返回</button>
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
                    <form id="add_form" class="form-horizontal" action="${ctx}/exercise/add" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">活动主题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="theme" id="theme_add_input">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">活动时间</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" name="happenTime" id="happenTime_add_input">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">活动内容</label>
                            <div class="col-sm-10">
                                <textarea rows="10" cols="60" id="context_area"></textarea>
                                <input type="hidden" class="form-control" name="content" id="content_input">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">首页照片</label>
                            <div class="col-sm-10">
                                <input id="pic" type="file" onchange="preview(this)" class="form-control" name="firstImgUrl">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">图片预览</label>
                            <div class="col-sm-10">
                                <div id="preview"></div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 全局js -->
<script src="${ctx}/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/js/plugins/jeditable/jquery.jeditable.js"></script>
<script src="${ctx}/dist/bootstrap-fileinput/bootstrap-fileinput.js"></script>

<!-- 自定义js -->
<script src="${ctx}/js/content.js?v=1.0.0"></script>
<script type="text/javascript" src="${ctx}/dist/layer-v3.1.1/layer/layer.js"></script>
<!-- Page-Level Scripts -->
<script>
    $('#pic').fileinput
    (
        {
            showUpload : false, //是否显示上传按钮,跟随文本框的那个

            showRemove : false, //显示移除按钮,跟随文本框的那个

            showCaption : true,//是否显示标题,就是那个文本框

            showPreview : true, //是否显示预览,不写默认为true

            dropZoneEnabled : false,//是否显示拖拽区域，默认不写为true，但是会占用很大区域

            //minImageWidth: 50, //图片的最小宽度

            //minImageHeight: 50,//图片的最小高度

            //maxImageWidth: 1000,//图片的最大宽度

            //maxImageHeight: 1000,//图片的最大高度

            //maxFileSize: 0, //文件最大大小，单位为kb，如果为0表示不限制文件大小

            //minFileCount: 0, //文件最小大学， 单位为kb，如果为0表示不限制文件大小

            maxFileCount : 1, //表示允许同时上传的最大文件个数

            enctype : 'multipart/form-data',

            validateInitialCount : true,

            previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",

            allowedFileTypes : [ 'image' ],//配置允许文件上传的类型

            allowedPreviewTypes : [ 'image' ],//配置所有的被预览文件类型

            allowedPreviewMimeTypes : [ 'jpg', 'png' ],//控制被预览的所有mime类型

            language : 'zh'
        }
    )

    $("#submit_btn").click(function () {
        $("#content_input").val($("#context_area").val());
        if(checkInput()){
            $("#add_form").submit();
        };
    });

    $("#back_btn").click(function () {
        window.location.href = "${ctx}/exercise/select";
    });

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

    function checkInput() {
        if($("#theme_add_input").val() == ''){
            layer.msg("请输入主题");
            return false;
        }
        if($("#happenTime_add_input").val() == ''){
            layer.msg("请添加时间");
            return false;
        }
        if($("#content_input").val() == ''){
            layer.msg("请添加内容");
            return false;
        }
        return true;

    }
</script>


</body>

</html>




