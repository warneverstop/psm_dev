<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/22
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>高校家长服务系统</title>
    <link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span><img alt="image" class="img-circle" src="${ctx}/img/profile_small.jpg" /></span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">${user.userName}</strong></span>
                                <span class="text-muted text-xs block">${user.roleName}<b class="caret"></b></span>
                                </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a class="J_menuItem" href="form_avatar.html">修改头像</a>
                            </li>
                            <li><a class="J_menuItem" href="profile.html">个人资料</a>
                            </li>
                            <li><a class="J_menuItem" href="contacts.html">联系我们</a>
                            </li>
                            <li><a class="J_menuItem" href="mailbox.html">信箱</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="login.html">安全退出</a>
                            </li>
                        </ul>
                    </div>
                    <div class="logo-element">H+
                    </div>
                </li>

                <c:if test="${fn:contains(user.powerNames, 'show_system')}">
                    <li>
                    <a href="#">
                        <i class="fa fa-cog"></i>
                        <span class="nav-label">系统维护</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${ctx}/user/select">用户管理</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${ctx}/role/select">角色管理</a>
                        </li>
                    </ul>
                    </li>
                </c:if>

                <c:if test="${fn:contains(user.powerNames, 'show_basic_info')}">
                    <li>
                        <a href="#">
                            <i class="fa fa-database"></i>
                            <span class="nav-label">基础数据</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="${ctx}/major/select">专业管理</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/class/select">班级管理</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/drom/select">宿舍管理</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/course/select">课程管理</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/teacher/select">教师管理</a>
                            </li>
                        </ul>
                    </li>
                </c:if>

                <c:if test="${fn:contains(user.powerNames, 'show_stu_info')}">
                    <li>
                    <a href="#">
                        <i class="fa fa-user"></i>
                        <span class="nav-label">学生信息</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="class_list.html">班级信息管理</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${ctx}">宿舍信息管理</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="student_list.html">学生信息管理</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="score_list.html">成绩信息管理</a>
                        </li>
                        <li>
                            <a href="#">技能成绩管理 <span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li><a class="J_menuItem" href="skill_manage.html">技能管理</a>
                                </li>
                                <li><a class="J_menuItem" href="skill_score.html">成绩管理</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="J_menuItem" href="">学生行为管理</a>
                        </li>
                    </ul>
                </li>
                </c:if>

                <c:if test="${fn:contains(user.powerNames, 'show_score_analysis')}">
                    <li>
                    <a href="#">
                        <i class="fa fa-line-chart"></i>
                        <span class="nav-label">成绩分析</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="">学生个人成绩分析</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="">班级成绩分析</a>
                        </li>
                    </ul>
                </li>
                </c:if>

                <c:if test="${fn:contains(user.powerNames, 'show_notic')}">
                    <li>
                    <a href="#">
                        <i class="fa fa-volume-up"></i>
                        <span class="nav-label">通知服务</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="">有关电话</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="">日常通知</a>
                        </li>
                        <li>
                            <a href="#">教师寄语 <span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li><a class="J_menuItem" href="message.html">文章列表</a>
                                </li>
                                <li><a class="J_menuItem" href="article-management.html">文章管理</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="J_menuItem" href="">规章制度</a>
                        </li>
                    </ul>
                </li>
                </c:if>

                <c:if test="${fn:contains(user.powerNames, 'show_communication')}">
                    <li>
                    <a class="J_menuItem" href="communicate.html">
                        <i class="fa fa-commenting"></i>
                        <span class="nav-label">沟通留言</span>
                    </a>
                </li>
                </c:if>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i> <span class="label label-warning"></span>
                        </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell"></i> <span class="label label-primary"></span>
                        </a>
                    </li>
                    <li class="dropdown hidden-xs">
                        <a class="right-sidebar-toggle" aria-expanded="false">
                            <i class="fa fa-tasks"></i> 主题
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id="${pageContext.request.contextPath}/user/personal">首页</a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
            </button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a>
                    </li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                    </li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                    </li>
                </ul>
            </div>
            <a href="login.html" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${pageContext.request.contextPath}/user/personal" frameborder="0" data-id="${pageContext.request.contextPath}/user/personal" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">&copy; 2014-2015 junjie su
            </div>
        </div>
    </div>
    <!--右侧部分结束-->
    <!--右侧边栏开始-->
    <div id="right-sidebar">
        <div class="sidebar-container">
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="sidebar-title">
                        <h3> <i class="fa fa-comments-o"></i> 主题设置</h3>
                        <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                    </div>
                    <div class="skin-setttings">
                        <div class="title">主题设置</div>
                        <div class="setings-item">
                            <span>收起左侧菜单</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                    <label class="onoffswitch-label" for="collapsemenu">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>固定顶部</span>

                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                    <label class="onoffswitch-label" for="fixednavbar">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                                <span>
                        固定宽度
                    </span>

                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                    <label class="onoffswitch-label" for="boxedlayout">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="title">皮肤选择</div>
                        <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                         <a href="#" class="s-skin-0">
                             默认皮肤
                         </a>
                    </span>
                        </div>
                        <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-1">
                            蓝色主题
                        </a>
                    </span>
                        </div>
                        <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-3">
                            黄色/紫色主题
                        </a>
                    </span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!--右侧边栏结束-->
</div>

<!-- 全局js -->
<script src="${ctx}/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${ctx}/js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="${ctx}/js/hplus.js?v=4.1.0"></script>
<script src="${ctx}/js/contabs.js"></script>

<!-- 第三方插件 -->
<script src="${ctx}/js/plugins/pace/pace.min.js"></script>
<script>
    history.pushState(null,null,'http://localhost:8080/system/index');
</script>

</body>
</html>

