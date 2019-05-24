<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/23
  Time: 21:53
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
    <title>H+ 后台主题UI框架 - 权限管理</title>
    <link rel="shortcut icon" href="${ctx}/favicon.ico">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${ctx}/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>权限列表</h5>
                    <div class="ibox-tools" style="margin-top:-3px;">
                        <button type="button" class="btn btn-primary btn-xs">保存权限</button>
                    </div>
                </div>
                <div class="ibox-content">
                    <table class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                        <tr>
                            <th style="width:60px;">编号</th>
                            <th style="width:80px;">操作对象</th>
                            <th>权限</th>
                            <th class="text-center" style="width:80px;">全选</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="gradeX">
                            <td>1</td>
                            <td>个人信息</td>
                            <td>
                                <label>
                                    <input type="checkbox">查看页面
                                </label>
                            </td>
                            <td class="text-center">
                                <input type="checkbox">
                            </td>
                        </tr>
                        <tr class="gradeX">
                            <td>2</td>
                            <td>成员管理</td>
                            <td>
                                <label>
                                    <input type="checkbox">查看页面
                                    <input type="checkbox">编辑用户
                                </label>
                            </td>
                            <td class="text-center">
                                <input type="checkbox">
                            </td>
                        </tr>
                        <tr class="gradeX">
                            <td>3</td>
                            <td>角色管理</td>
                            <td>
                                <label>
                                    <input type="checkbox">查看页面
                                    <input type="checkbox">编辑角色
                                    <input type="checkbox">权限分配
                                </label>
                            </td>
                            <td class="text-center">
                                <input type="checkbox">
                            </td>
                        </tr>
                        <tr class="gradeX">
                            <td>4</td>
                            <td>班级管理</td>
                            <td>
                                <label>
                                    <input type="checkbox">查看页面
                                    <input type="checkbox">编辑班级
                                    <input type="checkbox">查看详情
                                </label>
                            </td>
                            <td class="text-center">
                                <input type="checkbox">
                            </td>
                        </tr>
                        <tr class="gradeX">
                            <td>5</td>
                            <td>班级明细</td>
                            <td>
                                <label>
                                    <input type="checkbox">查看页面
                                    <input type="checkbox">编辑成员
                                </label>
                            </td>
                            <td class="text-center">
                                <input type="checkbox">
                            </td>
                        </tr>
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


<!-- Page-Level Scripts -->
<script>
    $(document).ready(function () {
        $('.dataTables-example').dataTable();
    });
</script>

</body>

</html>