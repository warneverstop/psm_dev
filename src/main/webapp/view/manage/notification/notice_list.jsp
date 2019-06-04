<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/30
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>通知列表</title>
    <link rel="shortcut icon" href="${ctx}/favicon.ico">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content  animated fadeInRight blog">
    <div class="row">
        <div class="col-lg-12" id="list_div">

        </div>
    </div>
</div>

<!-- 全局js -->
<script src="${ctx}/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/js/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="${ctx}/js/content.js?v=1.0.0"></script>
<script>
    $(document).ready(function () {
        <c:forEach var="noticeInfo" items="${noticeList}">
        var ibox = $("<div class=\"ibox\"></div>");
        var ibox_content= $(" <div class=\"ibox-content\"></div>");
        var a = $("<a href=\"\" class=\"btn-link\">\n" +
            "                        <h2>\n" +
            "                            ${noticeInfo.title}\n" +
            "                        </h2>\n" +
            "                    </a> <h3>类别：${noticeInfo.category}</h3>");
        var author_div = $("<div class=\"small m-b-xs\">\n" +
            "                        <strong>${noticeInfo.author}</strong> <span class=\"text-muted\"><i class=\"fa fa-clock-o\"></i><fmt:formatDate value='${noticeInfo.addTime}' type='both'/> </span>\n" +
            "                    </div>");
        var p = $("<p>${noticeInfo.profile}</p>");

        var context = $("<div class=\"row\">\n" +
            "                        <div class=\"col-md-6\">\n" +
            "                            <h5>标签：</h5>\n" +
            "                            <button class=\"btn btn-white btn-xs\" type=\"button\">${noticeInfo.label}</button>\n" +
            "                        </div>\n" +
            "                        <div class=\"col-md-6\">\n" +
            "                            <div class=\"small text-right\">\n" +
            "                                <h5>状态：</h5>\n" +
            "                                <i class=\"fa fa-eye\"> </i> ${noticeInfo.visitCount} 浏览\n" +
            "                            </div>\n" +
            "                        </div>\n" +
            "                    </div>");


        ibox_content.append(a).append(author_div).append(p).append(context);
        ibox.append(ibox_content);
        $("#list_div").append(ibox);
        </c:forEach>
    });
</script>

</body>

</html>
