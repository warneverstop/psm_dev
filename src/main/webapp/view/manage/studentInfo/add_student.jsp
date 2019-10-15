<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/6/5
  Time: 10:12
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
    <title>批量导入学生信息表</title>

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
                    <button type="button" class="btn btn-primary" id="submit_btn">提交</button>
                    <button type="button" class="btn btn-primary" id="back_btn">返回</button>
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
                    <table id="table-id" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>学号</th>
                            <th style="">姓名</th>
                            <th style="">性别</th>
                            <th style="">政治面貌</th>
                            <th style="">联系方式</th>
                            <th style="">状态</th>
                            <th style="width: 220px;">备注</th>
                        </tr>
                        </thead>
                        <tbody id="student_list">
                        <c:forEach var="studentInfo" items="${studentList}">
                            <tr class="gradeX">
                                <td>${studentInfo.stuNumber}</td>
                                <td>${studentInfo.stuName}</td>
                                <td>${studentInfo.genter}</td>
                                <td>${studentInfo.background}</td>
                                <td>${studentInfo.phone}</td>
                                <td>${studentInfo.state}</td>
                                <td>${studentInfo.remarks}</td>
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
    var stuData=new Array()
    var i = 0;

    $("#submit_btn").click(function () {
        $("#student_list").find("tr").each(function(){
            var tdArr = $(this).children();

            var stuNumber = tdArr.eq(0).text();//学号
            var stuName = tdArr.eq(1).text();//姓名
            var genter = tdArr.eq(2).text();//性别
            var backgroud = tdArr.eq(3).text();//政治面貌
            var phone = tdArr.eq(4).text();//联系方式
            var state = tdArr.eq(5).text();//状态
            var remarks = tdArr.eq(6).text();//备注

            stuData[i] = {'stuNumber':Number(stuNumber),'stuName':stuName,'genter':genter,'backgroud':backgroud,'phone':phone,'state':state,'remarks':remarks};
            i = i+1;
        });
        console.info(stuData);
        addStu(stuData);
    });

    function addStu(data){
        console.info(JSON.stringify(data));
        $.ajax({
            url:"${ctx}/student/addStudentList",
            type:"POST",
            //traditional: true,//使ajax支持数组数据
            //data:{'scoreInfoList':data},
            data:JSON.stringify(data),
            contentType: "application/json",
            dataType:"json",//必须
            success:function (data) {
                if(data.code == 100){
                    layer.msg(data.msg, {icon: 1,time: 2000}, function(){
                        window.location.href = "${ctx}/student/select";
                    });
                }else{
                    layer.msg(data.msg)
                }
            }
        })
    }

    $("#back_btn").click(function () {
        window.location.href = "${ctx}/student/select";
    });

</script>


</body>

</html>




