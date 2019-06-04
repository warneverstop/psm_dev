<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/30
  Time: 16:56
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
    <title>通知修改</title>

    <link rel="shortcut icon" href="${ctx}/favicon.ico">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

    <link href="${ctx}/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="${ctx}/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
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
                    <div class="row" style="margin-right: 40px;margin-left: 0px;">
                        <form class="form-horizontal" id="select_form" action="${ctx}/score/selectByCondition" method="post">
                            <div class="form-group">
                                <input type="hidden" value="${noticeInfo.noticeId}" name="noticeId" id="noticeId_input">
                                <label class="col-sm-1 control-label">标题：</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" name="title" value="${noticeInfo.title}" id="title_input" autocomplete="off">
                                </div>
                                <label class="col-sm-1 control-label">类型：</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" name="category" value="${noticeInfo.category}"id="category_input" autocomplete="off" disabled>
                                </div>

                                <label class="col-sm-1 control-label">标签：</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" name="label" value="${noticeInfo.label}" id="label_input" autocomplete="off">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label">作者：</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" name="author" value="${noticeInfo.author}" id="author_input" autocomplete="off" />
                                </div>
                                <label class="col-sm-1 control-label">摘要：</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" name="profile" value="${noticeInfo.profile}" id="profile_input" autocomplete="off" />
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="row">
                        <div class="summernote" style="display: none;" id="context_div">
                            ${noticeInfo.context}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 全局js -->
<script src="${ctx}/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/js/plugins/jeditable/jquery.jeditable.js"></script>

<!-- 自定义js -->
<script src="${ctx}/js/content.js?v=1.0.0"></script>
<script type="text/javascript" src="${ctx}/dist/layer-v3.1.1/layer/layer.js"></script>
<!-- SUMMERNOTE -->
<script src="${ctx}/js/plugins/summernote/summernote.min.js"></script>
<script src="${ctx}/js/plugins/summernote/summernote-zh-CN.js"></script>
<!-- Page-Level Scripts -->
<script>
    $(document).ready(function () {
        $('.summernote').summernote({
            lang: 'zh-CN'
        });
    });

    $("#back_btn").click(function () {
        window.location.href = "${ctx}/notice/select";
    });

    $("#submit_btn").click(function () {
        var context = $('#context_div').code();
        var title = $("#title_input").val();
        var noticeId = $("#noticeId_input").val();
        var label = $("#label_input").val();
        var author = $("#author_input").val();
        var profile = $("#profile_input").val();

        var data = {'context':context,'title':title,'noticeId':noticeId,'label':label,'author':author,'profile':profile};

        console.info(data);

        $.ajax({
            url:"${ctx}/notice/save",
            type:"POST",
            data:JSON.stringify(data),
            contentType: "application/json",
            dataType:"json",
            success:function (data) {
                if(data.code == 100){
                    $("#objectAddModal").modal('hide');
                    layer.msg(data.msg, {icon: 1,time: 1000}, function(){
                        window.location.href = "${ctx}/notice/select";
                    });
                }else{
                    layer.msg(data.msg)
                }
            }
        })
    });
</script>

</body>

</html>






