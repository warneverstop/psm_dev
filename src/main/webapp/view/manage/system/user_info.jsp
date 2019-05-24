<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/23
  Time: 16:47
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
    <title>用户管理</title>

    <link rel="shortcut icon" href="${ctx}/favicon.ico">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${ctx}/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<!-- 用户修改的模态框 -->
<div class="modal fade" id="userEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabe2">用户修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <input type="hidden" name="userId" id="userId_edit_input">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">用户名：</label>
                        <div class="col-sm-9">
                            <input type="text" name="userName" class="form-control" id="userName_edit_input" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">性别：</label>
                        <div class="col-sm-9">
                            <select name="genter" class="form-control" id="genter_edit_input">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">联系方式：</label>
                        <div class="col-sm-9">
                            <input type="text" name="phone" class="form-control" id="phone_edit_input" >
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
                        <label class="col-sm-3 control-label">角色：</label>
                        <div class="col-sm-9">
                            <select name="roleId" class="form-control" id="roleId_edit_input">
                                <c:forEach items="${roleList}" var="role">
                                    <option value="${role.roleId}">${role.roleName}</option>
                                </c:forEach>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">备注：</label>
                        <div class="col-sm-9">
                            <input type="text" name="remarks" class="form-control" id="remarks_edit_input" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="user_edit_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 用户添加的模态框 -->
<div class="modal fade" id="userAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">用户添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">用户名：</label>
                        <div class="col-sm-9">
                            <input type="text" name="userName" class="form-control" id="userName_add_input" placeholder="张三">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">性别：</label>
                        <div class="col-sm-9">
                            <select name="genter" class="form-control">
                                <option value="男">男</option>
                                <option value="男">女</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">联系方式：</label>
                        <div class="col-sm-9">
                            <input type="text" name="phone" class="form-control" id="phone" placeholder="182********">
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
                        <label class="col-sm-3 control-label">角色：</label>
                        <div class="col-sm-9">
                            <select name="roleId" class="form-control">
                                <option style='display: none'></option>
                                <c:forEach items="${roleList}" var="role">
                                    <option value="${role.roleId}">${role.roleName}</option>
                                </c:forEach>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">备注：</label>
                        <div class="col-sm-9">
                            <input type="text" name="remarks" class="form-control">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="user_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <button type="button" class="btn btn-primary" id="addUser">添加</button>
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
                            <th style="">用户名</th>
                            <th style="">性别</th>
                            <th style="">联系方式</th>
                            <th style="">添加时间</th>
                            <th style="">添加人</th>
                            <th>状态</th>
                            <th style="">角色</th>
                            <th style="">备注</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="userInfo" items="${userList}">
                            <tr class="gradeX">
                                <td>${userInfo.userName}</td>
                                <td>${userInfo.genter}</td>
                                <td>${userInfo.phone}</td>
                                <td><fmt:formatDate value="${userInfo.addTime}" type="both"/></td>
                                <td>${userInfo.addUser}</td>
                                <td>
                                    <c:if test="${userInfo.state == 0}">不可用</c:if>
                                    <c:if test="${userInfo.state == 1}">正常</c:if>
                                </td>
                                <td>${userInfo.roleName}</td>
                                <td>${userInfo.remarks}</td>
                                <td>
                                    <c:if test="${userInfo.userId != 1}">
                                        <button type="button" class="btn btn-warning btn-xs" onclick="editUser(${userInfo.userId})">修改</button>
                                        <button type="button" class="btn btn-danger btn-xs" onclick="deleteUser(${userInfo.userId})">删除</button>
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
    $("#addUser").click(function () {
        reset_form("#userAddModal form");
        $("#userAddModal").modal({
            backdrop:"static"
        });
    });
    //保存按钮
    $("#user_save_btn").click(function () {
        var userDate = $("#userAddModal form").serialize();
        console.info(userDate);
        $.ajax({
            url:"${ctx}/user/save",
            type:"POST",
            data:userDate,
            success:function (data) {
                if(data.code == 100){
                    $("#userAddModal").modal('hide');
                    layer.msg(data.msg);
                    window.location.reload();
                }else{
                    layer.msg(data.msg)
                }
            }
        })
    });

    //修改用户信息
    function editUser(userId){
        reset_form("#userEditModal form");
        setEditModalData(userId);
        $("#userEditModal").modal({
            backdrop:"static"
        });
    }

    function setEditModalData(userId){
        $.ajax({
            url:"${ctx}/user/selectById",
            type:"POST",
            data:{"userId":userId},
            async:false,
            success:function (data) {
                console.info(data);
                var userInfo = data.extend.userInfo;
                $("#userId_edit_input").val(userInfo.userId);
                $("#userName_edit_input").val(userInfo.userName);
                $("#genter_edit_input").val(userInfo.genter);
                //$("#genter_edit_input").find("option:contains('"+userInfo.genter+"')").attr("selected",true);
                $("#phone_edit_input").val(userInfo.phone);
                $("#state_edit_input").val(userInfo.state);
                $("#roleId_edit_input").val(userInfo.roleId);
                //$("#state_edit_input").find("option:contains('"+userInfo.state+"')").attr("selected",true);
                //$("#roleId_edit_input").find("option:contains('2')").attr("selected",true);
                $("#remarks_edit_input").val(userInfo.remarks);
            }
        })
    }

    $("#user_edit_btn").click(function () {
        var userData = $("#userEditModal form").serialize();
        console.info(userData);
        $.ajax({
            url:"${ctx}/user/save",
            type:"POST",
            data:userData,
            success:function (data) {
                if(data.code == 100){
                    $("#userEditModal").modal('hide');
                    layer.msg(data.msg);
                    window.location.reload();
                }else{
                    layer.msg(data.msg)
                }
            }
        })
    });

    function deleteUser(userId){
        layer.confirm('确定要删除吗?', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url:"${ctx}/user/delete",
                type:"POST",
                data:{"userId":userId},
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
</script>


</body>

</html>

