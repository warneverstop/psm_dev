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
                        <button type="button" class="btn btn-primary btn-xs" id="back_btn">返回</button>
                        <button type="button" class="btn btn-primary btn-xs" id="save_power">保存权限</button>
                    </div>
                </div>
                <div class="ibox-content">
                    <form>
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                        <tr>
                            <th style="width:60px;">编号</th>
                            <th style="width:80px;">权限名</th>
                            <th>说明</th>
                            <th class="text-center" style="width:80px;">选择</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${powerList}" var="power">
                            <tr class="gradeX">
                                <td>${power.powerId}</td>
                                <td>${power.powerName}</td>
                                <td>${power.remark}</td>
                                <td class="text-center">
                                    <input type="checkbox" id="${power.powerId}" name="power" value="${power.powerId}">
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    </form>
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

        <c:forEach items="${havePowerList}" var="havePower">
            $('#${havePower.powerId}').attr('checked',true)
        </c:forEach>
    });

    $("#back_btn").click(function () {
        window.location.href = "${ctx}/role/select";
    });

    $("#save_power").click(function () {
        var powerIds = [];
        $("input:checkbox[name='power']:checked").each(function(){
            //操作
            var powerId = $(this).val();
            powerIds.push(powerId);
        });
        updateRolePower(powerIds);
    });

    function updateRolePower(powerIds) {
        var roleId = ${roleId};
        $.ajax({
            url:"${ctx}/power/updateRolePower",
            type:"POST",
            traditional: true,//使ajax支持数组数据
            data:{'powerIds':powerIds,'roleId':roleId},
            success:function (data) {
                layer.msg(data.msg);
            }
        })
    }
</script>

</body>

</html>