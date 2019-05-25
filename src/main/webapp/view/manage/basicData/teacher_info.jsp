<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/24
  Time: 16:18
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
    <title>教师管理</title>

    <link rel="shortcut icon" href="${ctx}/favicon.ico">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${ctx}/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<!-- 修改的模态框 -->
<div class="modal fade" id="objectEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabe2">教师修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <input type="hidden" name="teacherId" id="teacherId_edit_input">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">编号：</label>
                        <div class="col-sm-9">
                            <input type="text" name="teacherNumber" class="form-control" id="teacherNumber_edit_input" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">姓名：</label>
                        <div class="col-sm-9">
                            <input type="text" name="teacherName" class="form-control" id="teacherName_edit_input" >
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
                        <label class="col-sm-3 control-label">职务：</label>
                        <div class="col-sm-9">
                            <input type="text" name="job" class="form-control" id="job_edit_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">政治面貌：</label>
                        <div class="col-sm-9">
                            <input type="text" name="background" class="form-control" id="background_edit_input" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">邮箱：</label>
                        <div class="col-sm-9">
                            <input type="email" name="email" class="form-control" id="email_edit_input" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">电话：</label>
                        <div class="col-sm-9">
                            <input type="text" name="phone" class="form-control" id="phone_edit_input" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">办公地址：</label>
                        <div class="col-sm-9">
                            <input type="text" name="officeAddress" class="form-control" id="officeAddress_edit_input" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">家庭住址：</label>
                        <div class="col-sm-9">
                            <input type="text" name="address" class="form-control" id="address_edit_input" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">学科：</label>
                        <div class="col-sm-9">
                            <input type="text" name="subject" class="form-control" id="subject_edit_input" >
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
                <button type="button" class="btn btn-primary" id="object_edit_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 添加的模态框 -->
<div class="modal fade" id="objectAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">教师添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">编号：</label>
                        <div class="col-sm-9">
                            <input type="text" name="teacherNumber" class="form-control" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">姓名：</label>
                        <div class="col-sm-9">
                            <input type="text" name="teacherName" class="form-control" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">性别：</label>
                        <div class="col-sm-9">
                            <select name="genter" class="form-control">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">电话：</label>
                        <div class="col-sm-9">
                            <input type="text" name="phone" class="form-control" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">学科：</label>
                        <div class="col-sm-9">
                            <input type="text" name="subject" class="form-control" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">办公地址：</label>
                        <div class="col-sm-9">
                            <input type="text" name="officeAddress" class="form-control" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">备注：</label>
                        <div class="col-sm-9">
                            <input type="text" name="remarks" class="form-control" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="object_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <button type="button" class="btn btn-primary" id="addObject">添加</button>
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
                            <th style="">编号</th>
                            <th style="">姓名</th>
                            <th style="">性别</th>
                            <th style="">邮箱</th>
                            <th style="">联系方式</th>
                            <th style="">学科</th>
                            <th style="">办公地址</th>
                            <th style="">备注</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="teacherInfo" items="${teacherList}">
                            <tr class="gradeX">
                                <td>${teacherInfo.teacherNumber}</td>
                                <td>${teacherInfo.teacherName}</td>
                                <td>${teacherInfo.genter}</td>
                                <td>${teacherInfo.email}</td>
                                <td>${teacherInfo.phone}</td>
                                <td>${teacherInfo.subject}</td>
                                <td>${teacherInfo.officeAddress}</td>
                                <td>${teacherInfo.remarks}</td>
                                <td>
                                    <button type="button" class="btn btn-warning btn-xs" onclick="editObject(${teacherInfo.teacherId})">修改</button>
                                    <button type="button" class="btn btn-danger btn-xs" onclick="deleteObject(${teacherInfo.teacherId})">删除</button>
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
    //添加按钮
    $("#addObject").click(function () {
        reset_form("#objectAddModal form");
        $("#objectAddModal").modal({
            backdrop:"static"
        });
    });
    //保存按钮
    $("#object_save_btn").click(function () {
        var addFormDate = $("#objectAddModal form").serialize();
        console.info(addFormDate);
        $.ajax({
            url:"${ctx}/teacher/save",
            type:"POST",
            data:addFormDate,
            success:function (data) {
                if(data.code == 100){
                    $("#objectAddModal").modal('hide');
                    layer.msg(data.msg, {icon: 1,time: 1000}, function(){
                        window.location.reload();
                    });
                }else{
                    layer.msg(data.msg)
                }
            }
        })
    });

    //修改对象信息
    function editObject(id){
        reset_form("#objectEditModal form");
        setEditModalData(id);
        $("#objectEditModal").modal({
            backdrop:"static"
        });
    }

    function setEditModalData(id){
        $.ajax({
            url:"${ctx}/teacher/selectById",
            type:"POST",
            data:{"teacherId":id},
            async:false,
            success:function (data) {
                console.info(data);
                var teacherInfo = data.extend.teacherInfo;
                $("#teacherId_edit_input").val(teacherInfo.teacherId);
                $("#teacherNumber_edit_input").val(teacherInfo.teacherNumber);
                $("#teacherName_edit_input").val(teacherInfo.teacherName);
                $("#genter_edit_input").val(teacherInfo.genter);
                $("#job_edit_input").val(teacherInfo.job);
                $("#background_edit_input").val(teacherInfo.background);
                $("#email_edit_input").val(teacherInfo.email);
                $("#phone_edit_input").val(teacherInfo.phone);
                $("#officeAddress_edit_input").val(teacherInfo.officeAddress);
                $("#address_edit_input").val(teacherInfo.address);
                $("#subject_edit_input").val(teacherInfo.subject);
                $("#remarks_edit_input").val(teacherInfo.remarks);
            }
        })
    }

    $("#object_edit_btn").click(function () {
        var editFormData = $("#objectEditModal form").serialize();
        console.info(editFormData);
        $.ajax({
            url:"${ctx}/teacher/save",
            type:"POST",
            data:editFormData,
            success:function (data) {
                if(data.code == 100){
                    $("#objectEditModal").modal('hide');
                    layer.msg(data.msg, {icon: 1,time: 1000}, function(){
                        window.location.reload();
                    });
                }else{
                    layer.msg(data.msg)
                }
            }
        })
    });

    function deleteObject(id){
        layer.confirm('确定要删除吗?', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url:"${ctx}/teacher/delete",
                type:"POST",
                data:{"teacherId":id},
                async:false,
                success:function (data) {
                    if(data.code == 100){
                        layer.msg(data.msg, {icon: 1,time: 1000}, function(){
                            window.location.reload();
                        });
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




