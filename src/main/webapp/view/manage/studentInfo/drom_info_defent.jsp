<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/26
  Time: 17:00
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
    <title>宿舍信息维护</title>

    <link rel="shortcut icon" href="${ctx}/favicon.ico">
    <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${ctx}/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">

<!-- 添加的模态框 -->
<div class="modal fade" id="objectAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">宿舍添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
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
                        <label class="col-sm-3 control-label">地址：</label>
                        <div class="col-sm-9">
                            <input type="text" name="dromAddress" id="dromAddress_input" class="form-control" disabled>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">标准：</label>
                        <div class="col-sm-9">
                            <input type="text" name="standrad" id="standrad_input" class="form-control" disabled>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">已住：</label>
                        <div class="col-sm-9">
                            <input type="text" name="alreadyLived" id="alreadyLived_input" class="form-control" disabled>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">备注：</label>
                        <div class="col-sm-9">
                            <input type="text" name="remarks" id="remarks_input" class="form-control" disabled>
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
                    <button type="button" class="btn btn-primary" id="addObject">添加新宿舍</button>
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
                            <th style="">宿舍</th>
                            <th style="">地址</th>
                            <th style="">标准</th>
                            <th style="">已住</th>
                            <th style="">备注</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="dromInfo" items="${dromInfoList}">
                            <tr class="gradeX">
                                <td>${dromInfo.dromName}</td>
                                <td>${dromInfo.dromAddress}</td>
                                <td>${dromInfo.standrad}</td>
                                <td>${dromInfo.alreadyLived}</td>
                                <td>${dromInfo.remarks}</td>
                                <td>
                                    <button type="button" class="btn btn-primary btn-xs" onclick="showDetail(${dromInfo.dromId})">详情</button>
                                    <c:if test="${fn:contains(user.powerNames, 'edit_dorm_info')}">
                                    <button type="button" class="btn btn-danger btn-xs" onclick="deleteObject(${dromInfo.dromId})">删除</button>
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
        var dromId = $("#dromId_input").val();
        console.info("要添加的宿舍" + dromId);
        $.ajax({
            url:"${ctx}/drom/addForClass",
            type:"POST",
            data:{'dromId':dromId},
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
        layer.confirm('确定要删除吗?', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url:"${ctx}/drom/deleteInClass",
                type:"POST",
                data:{"dromId":id},
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
                if(data.code == 100){
                    var dromInfo = data.extend.dromInfo;
                    $("#dromAddress_input").val(dromInfo.dromAddress);
                    $("#standrad_input").val(dromInfo.standrad);
                    $("#alreadyLived_input").val(dromInfo.alreadyLived);
                    $("#remarks_input").val(dromInfo.remarks);
                }else{
                    layer.msg(data.msg);
                }
            }
        })
    });

    function showDetail(id) {
        window.location.href = "${ctx}/drom/showDetail?dromId="+id;
    }
</script>


</body>

</html>




