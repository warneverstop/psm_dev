<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/30
  Time: 17:35
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
    <title>留言管理</title>

    <link rel="shortcut icon" href="${ctx}/favicon.ico">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <!-- Data Tables -->
    <link href="${ctx}/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="gray-bg">

<!-- 回复的模态框 -->
<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">留言回复</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">回复内容：</label>
                        <div class="col-sm-9">
                            <input type="hidden" name="messageId" class="form-control" id="messageId" >
                            <input type="text" name="replyContent" class="form-control" id="replyContent" autocomplete="off">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="sumbit_reply">提交</button>
            </div>
        </div>
    </div>
</div>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                   <h5>留言管理</h5>
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
                            <th style="width:70px;">用户</th>
                            <th style="width: 100px;">标题</th>
                            <th style="">内容</th>
                            <th style="width:120px;">发送时间</th>
                            <th style="width:60px;">状态</th>
                            <th class="text-center" style="width:60px;">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="messageInfo" items="${messageList}">
                            <tr class="gradeX">
                                <td>${messageInfo.userName}</td>
                                <td>${messageInfo.title}</td>
                                <td>${messageInfo.content}</td>
                                <td><fmt:formatDate value="${messageInfo.addTime}" type="both"/></td>
                                <td>
                                    <c:if test="${messageInfo.state == 1}">已回复</c:if>
                                    <c:if test="${messageInfo.state == 0}">未回复</c:if>
                                </td>
                                <td class="text-center">
                                    <c:if test="${messageInfo.state == 0}">
                                        <button type="button" class="btn btn-primary btn-xs" onclick="reply(${messageInfo.messageId})">回复</button>
                                    </c:if>
                                    <c:if test="${messageInfo.state == 1}">
                                        <button type="button" class="btn btn-primary btn-xs" onclick="reply(${messageInfo.messageId})" disabled>回复</button>
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
    function reply(id) {
        reset_form("#replyModal form");
        $("#messageId").val(id);
        $("#replyModal").modal({
            backdrop:"static"
        });
    }

    $("#sumbit_reply").click(function () {
        if($("#replyContent").val() == null || $("#replyContent").val() == ''){
            layer.msg("输入回复内容");
            return false;
        }
        var addFormDate = $("#replyModal form").serialize();
        console.info(addFormDate);
        $.ajax({
            url:"${ctx}/message/reply",
            type:"POST",
            data:addFormDate,
            success:function (data) {
                if(data.code == 100){
                    $("#replyModal").modal('hide');
                    layer.msg(data.msg, {icon: 1,time: 1000}, function(){
                        window.location.reload();
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





