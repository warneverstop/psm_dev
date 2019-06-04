<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/31
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Learn is a modern and fully responsive Template by WebThemez.">
    <meta name="author" content="">
    <title>家长服务系统</title>

    <!-- <link rel="stylesheet" media="screen" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700"> -->
    <link rel="stylesheet" href="${ctx}/view/parent/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/view/parent/assets/css/font-awesome.min.css">
    <!-- Custom styles for our template -->
    <link rel="stylesheet" href="${ctx}/view/parent/assets/css/bootstrap-theme.css" media="screen">
    <link rel="stylesheet" type="text/css" href="${ctx}/view/parent/assets/css/da-slider.css" />
    <link rel="stylesheet" href="${ctx}/view/parent/assets/css/style.css">
</head>

<body>
<!-- Fixed navbar -->
<div class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <!-- Button for smallest screens -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${ctx}/parent/index">
                <img src="${ctx}/view/parent/assets/images/logo.png" alt="Techro HTML5 template">
            </a>

        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav pull-right mainNav">
                <li >
                    <a href="${ctx}/parent/index">首页</a>
                </li>
                <li>
                    <a href="${ctx}/student/basicInfo">基本信息</a>
                </li>
                <li >
                    <a href="${ctx}/student/synthesizeSelect">综合查询</a>
                </li>
                <li class="dropdown active">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">通知服务 <b class="caret"></b></a>
                    <ul class="dropdown-menu" style="z-index:99999;">
                        <li><a href="${ctx}/notice/selectForParent?category=日常通知">日常通知</a></li>
                        <li><a href="${ctx}/notice/selectForParent?category=教师寄语">教师寄语</a></li>
                        <li><a href="${ctx}/notice/selectForParent?category=规章制度">规章制度</a></li>
                        <li><a href="${ctx}/notice/selectForParent?category=缴费信息">缴费信息</a></li>
                    </ul>
                </li>
                <li>
                    <a href="${ctx}/exercise/selectForParent">班级活动</a>
                </li>
                <li>
                    <a href="${ctx}/parent/contact">实时沟通</a>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">个人中心 <b class="caret"></b></a>
                    <ul class="dropdown-menu" style="z-index:99999;">
                        <li><a href="${ctx}/parent/personal">个人信息</a></li>
                        <li><a href="${ctx}/parent/quit/">退出系统</a></li>
                    </ul>
                </li>

            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</div>
<!-- /.navbar -->

<!-- Header -->
<header id="head" style="height:388px;">
    <div class="container">
        <div class="banner-content">
            <div id="da-slider" class="da-slider">
                <div class="da-slide">
                    <h2>在这里</h2>
                    <p>可以知道你想知道的</p>
                    <div class="da-img"></div>
                </div>
                <div class="da-slide">
                    <h2>在这里</h2>
                    <p>看到的不仅仅是成绩，更多的是生活……</p>
                    <div class="da-img"></div>
                </div>
                <div class="da-slide">
                    <h2>在这里</h2>
                    <p>得到的不仅仅是信息，更多的是放心……</p>
                    <div class="da-img"></div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- /Header -->

<section class="container">
    <c:forEach items="${noticeList}" var="noticeInfo">

    <div class="row">
        <div class="ibox-content" style="margin-top: 20px;">
            <a href="${ctx}/notice/selectByIdToShow?noticeId=${noticeInfo.noticeId}" class="btn-link">
                <h2 style="margin:0px;margin-top: 5px;margin-bottom: 5px;">${noticeInfo.title}</h2>
            </a>
            <div class="small m-b-xs">
                <strong>${noticeInfo.author}</strong>
                <span class="text-muted">
                                <i class="fa fa-clock-o"></i><fmt:formatDate value="${noticeInfo.addTime}" type="date"/> </span>
            </div>
            <p style="margin: 0px;">${noticeInfo.profile}</p>
            <div class="row">
                <div class="col-md-6">
                    <h5 style="margin-top: 0px;">标签：</h5>
                    <button class="btn btn-white btn-xs" style="background-color: buttonface;padding: 0px;font-size: 16px;padding-right: 10px;padding-left: 10px;"  type="button">${noticeInfo.label}</button>
                </div>
                <div class="col-md-6">
                    <div class="small text-right">
                        <h5>状态：</h5>
                        <div>
                        <i class="fa fa-eye"> </i> ${noticeInfo.visitCount} 浏览
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
    </c:forEach>
 </section>

<footer id="footer">
    <div class="footer2">
        <div class="container">
            <div class="row">
                <div class="col-md-6 panel">
                    <div class="panel-body">
                        <p class="simplenav">
                            <a href="http://www.nuc.edu.cn/index.htm" target="_blank" >中北大学</a> |
                            <a href="http://jgy.nuc.edu.cn/#tips" target="_blank">经济与管理学院</a> |
                            <a href="http://zbjy.nuc.edu.cn/l" target="_blank">就业在线</a> |
                            <a href="http://www.nuc.edu.cn/" target="_blank">校园生活</a> |
                            <a href="http://www.nuc.edu.cn/kjlm/wls.htm#tips" target="_blank">快捷通道</a> |
                            <a href="http://hqfw.nuc.edu.cn/" target="_blank">后勤服务</a>
                        </p>
                    </div>
                </div>

                <div class="col-md-6 panel">
                    <div class="panel-body">
                        <p class="text-right">
                            Copyright &copy; 2019.sujunjie All rights reserved.
                        </p>
                    </div>
                </div>

            </div>
            <!-- /row of panels -->
        </div>
    </div>
</footer>

<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
<script src="${ctx}/view/parent/assets/js/modernizr-latest.js"></script>
<script src="${ctx}/view/parent/assets/js/jquery-2.0.3.min.js"></script>
<%--<script src="${ctx}/dist/bootstrap-3.3.7-dist/css/bootstrap.css"></script>--%>
<script src="${ctx}/view/parent/assets/js/bootstrap.min.js"></script>
<script src="${ctx}/view/parent/assets/js/jquery.cslider.js"></script>
<script src="${ctx}/view/parent/assets/js/custom.js"></script>

<script>

</script>
</body>

</html>

