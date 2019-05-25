<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/23
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zh-CN">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人资料</title>
    <link rel="shortcut icon" href="${ctx}/favicon.ico">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeIn">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>个人信息</h5>
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
                    <div class="panel-body">
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h5 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="tabs_panels.html#collapseOne">基本信息</a>
                                    </h5>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <form method="post" action="${ctx}/user/update" class="form-horizontal" id="basic_form">
                                            <input type="hidden" name="userId" value="${user.userId}">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">用户名：</label>
                                                <div class="col-sm-6">
                                                    <input type="text" id="name_input" name="userName" class="form-control" value="${user.userName}" disabled required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">性别：</label>
                                                <div class="col-sm-6">
                                                    <input type="text" id="genter_input" name="genter" class="form-control" value="${user.genter}" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">联系方式：</label>
                                                <div class="col-sm-6">
                                                    <input type="text" id="phone_input" name="phone" class="form-control" value="${user.phone}" disabled required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">邮箱：</label>
                                                <div class="col-sm-6">
                                                    <input type="text" id="email_input" name="email" class="form-control" value="${user.email}" disabled required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">生日：</label>
                                                <div class="col-sm-6">
                                                    <input type="date"  class="form-control" name="birthday" value="${user.birthday}" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">住址：</label>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" name="address" value="${user.address}" disabled>
                                                </div>
                                            </div>
                                        </form>
                                        <div class="col-sm-6 col-sm-offset-4">
                                            <button class="btn btn-primary" id="basic_edit">修改</button>
                                            <button class="btn btn-primary" id="basic_save" disabled>保存</button>
                                            <button class="btn btn-primary" id="basic_remove" disabled>取消</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="tabs_panels.html#collapseThree">账户信息</a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <form method="get" class="form-horizontal">

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">角色：</label>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" name="roleName" value="${user.roleName}" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">账户状态：</label>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" value="${user.state}" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">注册时间：</label>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" value="${user.addTime}" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">旧密码：</label>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" id="old_pwd" disabled >
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">新密码：</label>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" id="new_pwd"  disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">再次输入：</label>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" id="new_pwd1" disabled>
                                                </div>
                                            </div>
                                        </form>
                                        <div class="col-sm-6 col-sm-offset-4">
                                            <button class="btn btn-primary" id="pwd_edit">修改密码</button>
                                            <button class="btn btn-primary" id="pwd_save" disabled>保存</button>
                                            <button class="btn btn-primary" id="pwd_remove" disabled>取消</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
<!-- 自定义js -->
<script src="${ctx}/js/content.js?v=1.0.0"></script>

</body>
<script>
    $("#basic_edit").click(function () {
        $("#basic_form input").removeAttr("disabled");
        $("#basic_save").removeAttr("disabled");
        $("#basic_remove").removeAttr("disabled");
    });
    $("#basic_save").click(function () {
        $("#basic_form").submit();
    });
    $("#basic_remove").click(function () {
        window.location.reload();
    });

    $("#pwd_edit").click(function () {
        $("#old_pwd").removeAttr("disabled");
        $("#new_pwd").removeAttr("disabled");
        $("#new_pwd1").removeAttr("disabled");
        $("#pwd_save").removeAttr("disabled");
        $("#pwd_remove").removeAttr("disabled");
    });
    
    $("#pwd_remove").click(function () {
        editPswDisabled();
    });

    function editPswDisabled(){
        $("#old_pwd").val(null);
        $("#new_pwd").val(null);
        $("#new_pwd1").val(null);
        $("#old_pwd").attr("disabled", "disabled");
        $("#new_pwd").attr("disabled", "disabled");
        $("#new_pwd1").attr("disabled", "disabled");
        $("#pwd_save").attr("disabled", "disbaled");
        $("#pwd_remove").attr("disabled", "disbaled");
    }

    $("#pwd_save").click(function () {
        var old_pwd = $("#old_pwd").val();
        var new_pwd = $("#new_pwd").val();
        var new_pwd1 = $("#new_pwd1").val();

        if(new_pwd != new_pwd1){
            layer.msg("俩次输入密码不一致");
            $("#new_pwd1").val(null);
            return false;
        }else{
            if(old_pwd != ${user.password}){
                layer.msg("原密码错误，请重新输入");
                $("#old_pwd").val(null);
                return false;
            }else {
                $.ajax({
                    url:"${ctx}/user/editPwd",
                    type:"POST",
                    data:{"password":new_pwd},
                    success:function (data) {
                        if(data.code == 100){
                            layer.msg(data.msg);
                            editPswDisabled();

                        }else{
                            layer.msg(data.msg);
                        }
                    }
                })
            }
        }
    });

</script>

</html>
