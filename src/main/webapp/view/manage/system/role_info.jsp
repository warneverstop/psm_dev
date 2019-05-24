<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/23
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>角色管理</title>

    <link rel="shortcut icon" href="${ctx}/favicon.ico">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${ctx}/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<!-- 角色修改的模态框 -->
<div class="modal fade" id="roleEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabe2">角色修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <input type="hidden" name="roleId" id="roleId_edit_input">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">角色名：</label>
                        <div class="col-sm-9">
                            <input type="text" name="roleName" class="form-control" id="roleName_edit_input" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">状态：</label>
                        <div class="col-sm-9">
                            <select name="state" class="form-control" id="state_edit_input">
                                <option value="1">正常</option>
                                <option value="0">不可用</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">说明：</label>
                        <div class="col-sm-9">
                            <input type="text" name="remark" class="form-control" id="remarks_edit_input" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="role_edit_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 角色添加的模态框 -->
<div class="modal fade" id="roleAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">角色添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">角色名：</label>
                        <div class="col-sm-9">
                            <input type="text" name="roleName" class="form-control" id="roleName_add_input" placeholder="张三">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">状态：</label>
                        <div class="col-sm-9">
                            <select name="state" class="form-control">
                                <option value="1">正常</option>
                                <option value="0">不可用</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">说明：</label>
                        <div class="col-sm-9">
                            <input type="text" name="remark" class="form-control">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="role_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <button type="button" class="btn btn-primary" id="addRole">添加</button>
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
                    <table id="table-id" class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                        <tr>
                            <th style="">角色名</th>
                            <th style="">说明</th>
                            <th style="">添加时间</th>
                            <th style="">添加人</th>
                            <th style="">状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="roleInfo" items="${roleList}">
                            <tr class="gradeX">
                                <td>${roleInfo.roleName}</td>
                                <td>${roleInfo.remark}</td>
                                <td><fmt:formatDate value="${roleInfo.addTime}" type="both"/></td>
                                <td>${roleInfo.addUser}</td>
                                <td>
                                    <c:if test="${roleInfo.state == 0}">不可用</c:if>
                                    <c:if test="${roleInfo.state == 1}">正常</c:if>
                                </td>
                                <td>
                                    <c:if test="${roleInfo.roleId != 1}">
                                        <button type="button" class="btn btn-warning btn-xs" onclick="editRole(${roleInfo.roleId})">修改</button>
                                        <button type="button" class="btn btn-danger btn-xs" onclick="deleteRole(${roleInfo.roleId})">删除</button>
                                        <button type="button" class="btn btn-info btn-xs" onclick="powerManage(${roleInfo.roleId})">权限管理</button>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
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
<script type="text/javascript" src="${ctx}/dist/layer-v3.1.1/layer/layer.js"></script>
<!-- Page-Level Scripts -->
<script>
    $(document).ready(function () {
        $('.dataTables-example').dataTable();
        $('#editable').dataTable();
    });

    //清空表单内容
    function reset_form(ele){
        $(ele)[0].reset();
    }
    //添加用户按钮
    $("#addRole").click(function () {
        reset_form("#roleAddModal form");
        $("#roleAddModal").modal({
            backdrop:"static"
        });
    });
    //保存按钮
    $("#role_save_btn").click(function () {
        var roleDate = $("#roleAddModal form").serialize();
        console.info(roleDate);
        $.ajax({
            url:"${ctx}/role/save",
            type:"POST",
            data:roleDate,
            success:function (data) {
                if(data.code == 100){
                    $("#roleAddModal").modal('hide');
                    layer.msg(data.msg);
                    window.location.reload();
                }else{
                    layer.msg(data.msg)
                }
            }
        })
    });

    //修改用户信息
    function editRole(roleId){
        reset_form("#roleEditModal form");
        setEditModalData(roleId);
        $("#roleEditModal").modal({
            backdrop:"static"
        });
    }

    function setEditModalData(roleId){
        $.ajax({
            url:"${ctx}/role/selectById",
            type:"POST",
            data:{"roleId":roleId},
            async:false,
            success:function (data) {
                console.info(data);
                var roleInfo = data.extend.roleInfo;
                $("#roleId_edit_input").val(roleInfo.roleId);
                $("#roleName_edit_input").val(roleInfo.roleName);
                $("#state_edit_input").val(roleInfo.state);
                $("#remarks_edit_input").val(roleInfo.remark);
                
            }
        })
    }

    $("#role_edit_btn").click(function () {
        var roleData = $("#roleEditModal form").serialize();
        console.info(roleData);
        $.ajax({
            url:"${ctx}/role/save",
            type:"POST",
            data:roleData,
            success:function (data) {
                if(data.code == 100){
                    $("#roleEditModal").modal('hide');
                    layer.msg(data.msg);
                    window.location.reload();
                }else{
                    layer.msg(data.msg)
                }
            }
        })
    });

    function deleteRole(roleId){
        layer.confirm('确定要删除吗?', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url:"${ctx}/role/delete",
                type:"POST",
                data:{"roleId":roleId},
                async:false,
                success:function (data) {
                    if(data.code == 100){
                        layer.msg(data.msg);
                        window.location.reload();
                    }else{
                        layer.msg(data.msg)
                    }
                }
            });
            layer.close(index);//关闭弹窗方法
        });
    }

    function powerManage(roleId) {
        window.location.href = "${ctx}/power/select?roleId="+roleId ;
    }
</script>


</body>

</html>


