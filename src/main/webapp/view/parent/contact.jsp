<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/31
  Time: 19:48
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
                <li >
                    <a href="${ctx}/student/basicInfo">基本信息</a>
                </li>
                <li >
                    <a href="${ctx}/student/synthesizeSelect">综合查询</a>
                </li>
                <li class="dropdown">
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
                <li class="active">
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
        <div class="col-md-6">
            <h3 class="section-title">给班主任留言</h3>
            <p>
                如果你有一些其他的问题了，可以选择给班主任留言，这也是一种不错的沟通留言方式，如果有问题不方便留言，你也可以选择其他方式
                ，如可以直接电话沟通，或者去老师的办公室找老师，找老师请注意时间，每个人都有自己的工作时间和私人时间。
            </p>
            <form name="sentMessage" novalidate id="message_form">
                <div class="control-group">
                    <div class="controls">
                        <input type="text" class="form-control" placeholder="标题" name="title" id="title" required data-validation-required-message="请输入你的标题"
                        />
                        <p class="help-block"></p>
                    </div>
                </div>

                <div class="control-group">
                    <div class="controls">
							<textarea rows="10" cols="100" class="form-control" placeholder="内容" name="content" id="content" required data-validation-required-message="请输入你的内容"
                                      minlength="5" data-validation-minlength-message="Min 5 characters" maxlength="999" style="resize:none"></textarea>
                    </div>
                </div>
                <button class="btn btn-primary pull-right" id="send_btn">发送</button>
                <br />
            </form>
        </div>
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-6">
                    <h3 class="section-title">联系</h3>
                    <div class="contact-info">
                        <h5>办公室地址</h5>
                        <p>${teacherInfo.officeAddress}</p>

                        <h5>邮箱</h5>
                        <p>${teacherInfo.email}</p>

                        <h5>电话</h5>
                        <p>${teacherInfo.phone}</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <h3 class="section-title">工作时间</h3>
                    <div class="contact-info">
                        <h5>周一 - 周五</h5>
                        <p>08:00 AM - 9:30 PM</p>

                        <h5>周六</h5>
                        <p>休息</p>

                        <h5>周日</h5>
                        <p>休息</p>
                    </div>
                </div>
            </div>
            <h3 class="section-title">Get connected</h3>
            <p>
                Lorem ipsumn qersl ioinm sersoe non urna dolor sit amet, consectetur piesn qersl ioinm sersoe non urna dolor aecena.
            </p>
        </div>
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
<script type="text/javascript" src="${ctx}/dist/layer-v3.1.1/layer/layer.js"></script>

<script>
    history.pushState(null,null,'http://localhost:8080/parent/contact');
    $("#send_btn").click(function () {
        var data = $("#message_form").serialize();
        console.info(data);
        $.ajax({
            url:"${ctx}/message/add",
            type:"POST",
            data:data,
            success:function (data) {
                console.info(data);
                if(data.code == 100){
                    layer.msg(data.msg, {icon: 1,time: 5000}, function(){
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
