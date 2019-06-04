<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/6/2
  Time: 10:39
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
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">通知服务 <b class="caret"></b></a>
                    <ul class="dropdown-menu" style="z-index:99999;">
                        <li><a href="${ctx}/notice/selectForParent?category=日常通知">日常通知</a></li>
                        <li><a href="${ctx}/notice/selectForParent?category=教师寄语">教师寄语</a></li>
                        <li><a href="${ctx}/notice/selectForParent?category=规章制度">规章制度</a></li>
                        <li><a href="${ctx}/notice/selectForParent?category=缴费信息">缴费信息</a></li>
                    </ul>
                </li>
                <li class="active">
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
        <section class="col-sm-12 maincontent">
            <h3>班级活动信息列表</h3>
            <p>以下信息是学生所在班级在校期间已举办或参与的各项活动列表，如果对以下信息有疑问，可以进行对班主任<a href="${ctx}/parent/contact">留言</a>。</p>
            <table class="table table-bordered" style="margin-top:30px;">
                <c:forEach items="${exerciseList}" var="exerciseInfo">
                <tr>
                    <th width="120px;">活动主题：</th>
                    <td>${exerciseInfo.theme}</td>
                    <td rowspan="3" width="150"><img class="pimg" src="${exerciseInfo.firstImgUrl}" height="90" width="130"></td>
                </tr>
                <tr>
                    <th>活动时间：</th>
                    <td ><fmt:formatDate value="${exerciseInfo.happenTime}" type="date"/></td>
                </tr>
                <tr>
                    <th colspan="2" class="text-center">活动内容</th>
                </tr>
                <tr>
                    <td colspan="3" height="100px">${exerciseInfo.content}</td>
                </tr>
                </c:forEach>
            </table>
            <div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
                <div id="innerdiv" style="position:absolute;">
                    <img id="bigimg" style="border:5px solid #fff;" src="" />
                </div>
            </div>
        </section>

    </div>



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
    $(function(){
        $(".pimg").click(function(){
            var _this = $(this);//将当前的pimg元素作为_this传入函数
            imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
        });
    });

    function imgShow(outerdiv, innerdiv, bigimg, _this){
        var src = _this.attr("src");//获取当前点击的pimg元素中的src属性
        $(bigimg).attr("src", src);//设置#bigimg元素的src属性

        /*获取当前点击图片的真实大小，并显示弹出层及大图*/
        $("<img/>").attr("src", src).load(function(){
            var windowW = $(window).width();//获取当前窗口宽度
            var windowH = $(window).height();//获取当前窗口高度
            var realWidth = this.width;//获取图片真实宽度
            var realHeight = this.height;//获取图片真实高度
            var imgWidth, imgHeight;
            var scale = 0.8;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放

            if(realHeight>windowH*scale) {//判断图片高度
                imgHeight = windowH*scale;//如大于窗口高度，图片高度进行缩放
                imgWidth = imgHeight/realHeight*realWidth;//等比例缩放宽度
                if(imgWidth>windowW*scale) {//如宽度扔大于窗口宽度
                    imgWidth = windowW*scale;//再对宽度进行缩放
                }
            } else if(realWidth>windowW*scale) {//如图片高度合适，判断图片宽度
                imgWidth = windowW*scale;//如大于窗口宽度，图片宽度进行缩放
                imgHeight = imgWidth/realWidth*realHeight;//等比例缩放高度
            } else {//如果图片真实高度和宽度都符合要求，高宽不变
                imgWidth = realWidth;
                imgHeight = realHeight;
            }
            $(bigimg).css("width",imgWidth);//以最终的宽度对图片缩放

            var w = (windowW-imgWidth)/2;//计算图片与窗口左边距
            var h = (windowH-imgHeight)/2;//计算图片与窗口上边距
            $(innerdiv).css({"top":h, "left":w});//设置#innerdiv的top和left属性
            $(outerdiv).fadeIn("fast");//淡入显示#outerdiv及.pimg
        });

        $(outerdiv).click(function(){//再次点击淡出消失弹出层
            $(this).fadeOut("fast");
        });
    }
</script>
</body>

</html>




