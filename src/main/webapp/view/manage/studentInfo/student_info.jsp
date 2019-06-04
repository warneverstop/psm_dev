<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/26
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>宿舍信息管理</title>

    <link rel="shortcut icon" href="${ctx}/favicon.ico">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${ctx}/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">

<!-- 家长信息的模态框 -->
<div class="modal fade" id="parentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabe2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabe2">家长信息</h4>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-bordered" >
                    <tr>
                        <th>家长姓名</th>
                        <th>与学生关系</th>
                        <th>联系方式</th>
                        <th>操作</th>
                    </tr>
                    <tbody id="parent_table">

                    </tbody>

                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <%--<button type="button" class="btn btn-primary" id="object_save_btn">添加</button>--%>
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
                <h4 class="modal-title" id="myModalLabel">学生添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">学号：</label>
                        <div class="col-sm-9">
                            <input type="text" name="stuNumber"  class="form-control" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">姓名：</label>
                        <div class="col-sm-9">
                            <input type="text" name="stuName"  class="form-control" >
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
                        <label class="col-sm-3 control-label">宿舍：</label>
                        <div class="col-sm-9">
                            <select name="dromId" class="form-control" id="dromId_input">
                                <option style='display: none'></option>
                                <c:forEach items="${dromList}" var="drom">
                                    <option value="${drom.dromId}">${drom.dromName}</option>
                                </c:forEach>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">状态：</label>
                        <div class="col-sm-9">
                            <input type="text" name="state"  class="form-control" >
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
                    <button type="button" class="btn btn-primary" id="export_btn">导出明细表</button>
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
                            <th style="">学号</th>
                            <th style="">姓名</th>
                            <th style="">性别</th>
                            <th style="">政治面貌</th>
                            <th style="">联系方式</th>
                            <th style="">宿舍</th>
                            <th style="">状态</th>
                            <th style="">备注</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="studentInfo" items="${studentInfoList}">
                            <tr class="gradeX">
                                <td>${studentInfo.stuNumber}</td>
                                <td>${studentInfo.stuName}</td>
                                <td>${studentInfo.genter}</td>
                                <td>${studentInfo.background}</td>
                                <td>${studentInfo.phone}</td>
                                <td>${studentInfo.dromName}</td>
                                <td>${studentInfo.state}</td>
                                <td>${studentInfo.remarks}</td>
                                <td>
                                    <button type="button" class="btn btn-info btn-xs" onclick="showDetail(${studentInfo.stuId})">详情</button>
                                    <c:if test="${fn:contains(user.powerNames, 'edit_stu_info')}">
                                    <button type="button" class="btn btn-info btn-xs" onclick="showParentModal(${studentInfo.stuId})">家长管理</button>
                                    <button type="button" class="btn btn-danger btn-xs" onclick="deleteObject(${studentInfo.stuId})">删除</button>
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
    //添加按钮
    $("#addObject").click(function () {
        reset_form("#objectAddModal form");
        $("#objectAddModal").modal({
            backdrop:"static"
        });
    });
    //保存按钮
    $("#object_save_btn").click(function () {
        var studentInfo = $("#objectAddModal form").serialize();
        console.info("要添加的学生" + studentInfo);
        $.ajax({
            url:"${ctx}/student/add",
            type:"POST",
            data:studentInfo,
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

    function deleteObject(id){
        console.info("要删除的学生id:" + id);
        layer.confirm('确定要删除吗?', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url:"${ctx}/student/delete",
                type:"POST",
                data:{"studentId":id},
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

    //点击宿舍后自动查找其他信息
    $("#dromId_input").on("change",function(){
        var dromId = $("option:selected",this).val();
        console.info("宿舍id:"+dromId);
        $.ajax({
            url:"${ctx}/drom/selectById",
            type:"get",
            data:{"dromId":dromId},
            dataType:"JSON",
            success:function (data) {
                var dromInfo = data.extend.dromInfo;
                layer.msg("这是一个"+dromInfo.standrad+"宿舍,现在已住人数：" +dromInfo.alreadyLived);
            }
        })
    });


    function showDetail(id) {
        window.location.href = "${ctx}/student/showDetail?studentId="+id;
    }

    $("#export_btn").click(function () {
        layer.confirm('确定要导出本班的学生明细信息吗?', {icon: 3, title:'提示'}, function(index){
            layer.close(index);//关闭弹窗方法
            window.location.href = "${ctx}/student/export"
        });
    });

    function showParentModal(stuId) {
        $.ajax({
            url:"${ctx}/parent/selectByStuId",
            type:"POST",
            data:{"studentId":stuId},
            async:false,
            success:function (data) {
                var parentList = data.extend.parentList;
                console.info(parentList)
                setTableData(parentList);
            }
        });
        $("#parentModal").modal({
            backdrop:"static"
        });
    }

    //设置表格中的数据
    function setTableData(parentList) {
        $("#parent_table").html("");
        var parentTable = $("#parent_table");
        for (var i = 0 ;i<parentList.length;i++){
            var tr = $("<tr></tr>");
            var parentName = $("<td>"+parentList[i].parentName+"</td>");
            var relation = $("<td>"+parentList[i].relation+"</td>");
            var phone = $("<td>"+parentList[i].phone+"</td>");
            var handle = $("<td><button type=\"button\" class=\"btn btn-primary btn-xs\" onclick='initParent("+parentList[i].parentId+")'>密码初始化</button></td>");
            tr.append(parentName).append(relation).append(phone).append(handle);
            parentTable.append(tr)
        }
    }

    function initParent(id) {
        console.info("家长编号是："+id);
        $.ajax({
            url:"${ctx}/parent/initData",
            type:"POST",
            data:{"parentId":id},
            async:false,
            success:function (data) {
                layer.msg(data.msg);
            }
        });
    }
</script>


</body>

</html>




