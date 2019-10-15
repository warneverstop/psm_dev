<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/31
  Time: 17:28
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
    <link rel="favicon" href="${ctx}/view/parent/assets/images/favicon.png">
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
                <li class="active">
                    <a href="${ctx}/student/basicInfo">基本信息</a>
                </li>
                <li >
                    <a href="${ctx}/student/synthesizeSelect">综合查询</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">通知服务 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="score_summary.html">日常通知</a></li>
                        <li><a href="#">教师寄语</a></li>
                        <li><a href="#">规章制度</a></li>
                        <li><a href="#">缴费信息</a></li>
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
    <div class="row">
        <!-- main content -->
        <section class="col-sm-8 maincontent">
            <h3 name="1">学生基本信息</h3>
            <table class="table table-bordered" style="margin-top:15px;">
                <tr>
                    <td>
                        <strong>学号：</strong>
                    </td>
                    <td>${studentInfo.stuNumber}</td>
                    <td>
                        <strong>姓名：</strong>
                    </td>
                    <td>${studentInfo.stuName}</td>
                    <td rowspan="4" style="width:120px;">
                        <img width="auto" height="auto" src="${studentInfo.imgUrl}" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <strong>性别：</strong>
                    </td>
                    <td>${studentInfo.genter}</td>
                    <td>
                        <strong>政治面貌：</strong>
                    </td>
                    <td>${studentInfo.background}</td>
                </tr>
                <tr>
                    <td>
                        <strong>出生日期：</strong>
                    </td>
                    <td>${studentInfo.birthday}</td>
                    <td>
                        <strong>联系方式：</strong>
                    </td>
                    <td>${studentInfo.phone}</td>
                </tr>
                <tr>
                    <td>
                        <strong>在校职位：</strong>
                    </td>
                    <td colspan="3">${studentInfo.position}</td>
                </tr>
                <tr>
                    <td>
                        <strong>现住址：</strong>
                    </td>
                    <td colspan="4">${studentInfo.nowAddress}</td>
                </tr>
                <tr>
                    <td>
                        <strong>籍贯：</strong>
                    </td>
                    <td colspan="4">${studentInfo.address}</td>
                </tr>
                <tr>
                    <td colspan="5">
                        <center>
                            <strong>教师评价</strong>
                        </center>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" style="height:200px;">
                        <p style="text-indent:2em;">${studentInfo.evaluate}
                        </p>
                    </td>
                </tr>

            </table>
            <h3 name="2">家长基本信息</h3>
            <table class="table table-bordered" style="margin-top:15px;">
                <c:forEach items="${parentList}" var="parentInfo">
                    <tr>
                        <td>
                            <strong>姓名：</strong>
                        </td>
                        <td>${parentInfo.parentName}</td>
                        <td>
                            <strong>与学生关系：</strong>
                        </td>
                        <td>${parentInfo.relation}
                        <td>
                            <strong>联系方式：</strong>
                        </td>
                        <td>${parentInfo.phone}</td>
                    </tr>
                </c:forEach>
            </table>
            <h3 name="3">班主任基本信息</h3>
            <table class="table table-bordered" style="margin-top:15px;">
                <tr>
                    <td>
                        <strong>姓名：</strong>
                    </td>
                    <td>${teacherInfo.teacherName}</td>
                    <td>
                        <strong>性别：</strong>
                    </td>
                    <td>${teacherInfo.genter}</td>
                    <td rowspan="4" style="width:120px;">
                        <img width="auto" height="auto" src="${teacherInfo.imgUrl}" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <strong>职称：</strong>
                    </td>
                    <td>${teacherInfo.job}</td>
                    <td>
                        <strong>政治面貌：</strong>
                    </td>
                    <td>${teacherInfo.background}</td>
                </tr>
                <tr>
                    <td>
                        <strong>邮箱：</strong>
                    </td>
                    <td>${teacherInfo.email}</td>
                    <td>
                        <strong>联系方式：</strong>
                    </td>
                    <td>${teacherInfo.phone}</td>
                </tr>
                <tr>
                    <td>
                        <strong>办公室地址</strong>
                    </td>
                    <td colspan="3">${teacherInfo.officeAddress}</td>
                </tr>
                <tr>
                    <td>
                        <strong>住址：</strong>
                    </td>
                    <td colspan="4">${teacherInfo.address}</td>
                </tr>
                <tr>
                    <td colspan="5">
                        <center>
                            <strong>个人简介</strong>
                        </center>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" style="height:200px;">
                        <p style="text-indent:2em;">${teacherInfo.personalProfile}
                        </p>
                    </td>
                </tr>

            </table>
            <h3 name="4">学生宿舍基本信息</h3>
            <table class="table table-bordered" style="margin-top:15px;">
                <tr>
                    <td>
                        <strong>宿舍号:</strong>
                    </td>
                    <td>${dromInfo.dromName}</td>
                    <td>
                        <strong>居住楼</strong>
                    </td>
                    <td>${dromInfo.dromAddress}</td>
                </tr>
                <tr>
                    <td>
                        <strong>标准</strong>
                    </td>
                    <td>${dromInfo.standrad}</td>
                    <td>
                        <strong>现住</strong>
                    </td>
                    <td>${dromInfo.alreadyLived}</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <center>
                            <strong>宿舍成员信息</strong>
                        </center>
                    </td>
                </tr>
                <tr>
                    <td><strong>学号</strong></td>
                    <td><strong>姓名</strong></td>
                    <td><strong>联系方式</strong></td>
                    <td><strong>籍贯</strong></td>
                </tr>
                <c:forEach items="${studentDromList}" var="dromStu">
                    <tr>
                        <td>${dromStu.stuNumber}</td>
                        <td>${dromStu.stuName}</td>
                        <td>${dromStu.phone}</td>
                        <td>${dromStu.address}</td>
                    </tr>
                </c:forEach>
            </table>
            <h3 name="5">学生班级基本信息</h3>
            <table class="table table-bordered" style="margin-top:15px;">
                <tr>
                    <td>
                        <strong>班级:</strong>
                    </td>
                    <td>${classInfo.classNumber}</td>
                    <td>
                        <strong>总人数：</strong>
                    </td>
                    <td>${classInfo.sumPeople}</td>
                </tr>
                <tr>
                    <td>
                        <strong>学院：</strong>
                    </td>
                    <td>${classInfo.college}</td>
                    <td>
                        <strong>专业：</strong>
                    </td>
                    <td>${classInfo.majorName}</td>

                </tr>
                <tr>
                    <td colspan="4">
                        <center>
                            <strong>班委成员信息</strong>
                        </center>
                    </td>
                </tr>
                <tr>
                    <td><strong>学号</strong></td>
                    <td><strong>姓名</strong></td>
                    <td><strong>联系方式</strong></td>
                    <td><strong>职位</strong></td>
                </tr>
                <c:forEach items="${classCommitteeList}" var="classCommittee">
                    <tr>
                        <td>${classCommittee.stuNumber}</td>
                        <td>${classCommittee.stuName}</td>
                        <td>${classCommittee.phone}</td>
                        <td>${classCommittee.position}</td>
                    </tr>
                </c:forEach>
            </table>
        </section>
        <!-- /main -->

        <!-- Sidebar -->
        <aside class="col-sm-4 sidebar sidebar-right">

            <div class="panel">
                <h3>班级简介</h3>
                <div>
                    ${classInfo.profile}
                </div>
                <h3>学生宿舍简介</h3>
                <div>
                    ${dromInfo.profile}
                </div>
            </div>

        </aside>
        <!-- /Sidebar -->

    </div>
</section>






<footer id="footer" name="foot">
    <div class="footer2">
        <div class="container">
            <div class="row">
                <div class="col-md-6 panel">
                    <div class="panel-body">
                        <p class="simplenav">
                            <a href="http://www.nuc.edu.cn/?token=wAZ1GZxMz+GtyCoIuH1e/A==" target="_blank">中北大学</a> |
                            <a href="http://jgy.nuc.edu.cn/#tips" target="_blank">经济与管理学院</a> |
                            <a href="http://zbjy.nuc.edu.cn/l" target="_blank">就业在线</a> |
                            <a href="http://www.nuc.edu.cn/?token=wAZ1GZxMz+GtyCoIuH1e/A==#" target="_blank">校园生活</a> |
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
<script src="${ctx}/view/parent/assets/js/bootstrap.min.js"></script>
<script src="${ctx}/view/parent/assets/js/jquery.cslider.js"></script>
<script src="${ctx}/view/parent/assets/js/custom.js"></script>

<script>
    function onclickA() {
        document.querySelector("#foot").scrollIntoView();
    }

</script>
</body>

</html>