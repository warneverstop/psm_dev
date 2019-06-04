<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/22
  Time: 18:25
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
    <meta name="renderer" content="webkit">
    <title>欢迎登录系统</title>
    <link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="${ctx}/css/login.css" rel="stylesheet">
</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">家</h1>
        </div>
        <h3>欢迎使用家长服务系统</h3>

        <form class="m-t" role="form" action="${ctx}/parent/checkLogin" method="post">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="用户名"  name="userName" required>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="密码"  name="password" required>
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>

            <p class="text-muted text-center"> <a href="login.html#"><small>忘记密码了？</small></a> | <a href="register.html">注册一个新账号</a>
            </p>
        </form>
    </div>
</div>

<!-- 全局js -->
<script src="${ctx}/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/js/bootstrap.min.js?v=3.3.6"></script>

<script>
    <c:if test="${msg != null}">
        alert("${msg}");
        $("input").val("");
    </c:if>
    history.pushState(null,null,'http://localhost:8080/parent/login');
</script>
</body>

</html>

