<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/29
  Time: 17:50
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
    <title>按课程添加成绩</title>

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
                            <th hidden>编号</th>
                            <th style="width: 100px;">学号</th>
                            <th style="width: 120px;">姓名</th>
                            <th style="">学年学期</th>
                            <th style="">课程</th>
                            <th style="width: 120px;">属性</th>
                            <th style="width: 120px;">学分</th>
                            <th style="width: 100px;">成绩</th>
                        </tr>
                        </thead>
                        <tbody id="score_list">
                        <c:forEach var="studentInfo" items="${studentList}">
                            <tr class="gradeX">
                                <td hidden><input type="hidden" name="stuId" value="${studentInfo.stuId}"></td>
                                <td>${studentInfo.stuNumber}</td>
                                <td>${studentInfo.stuName}</td>
                                <td>${schoolYear}</td>
                                <td>${courseInfo.courseName}</td>
                                <td>${courseInfo.attribute}</td>
                                <td>${courseInfo.credit}</td>
                                <td><input type="number" name="grade" class="form-control" autocomplete="off"/></td>
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


    var courseId = ${courseInfo.courseId};
    var schoolYear = "${schoolYear}";

    var scoreData=new Array()
    var i = 0;

    $("#submit_btn").click(function () {
        $("#score_list").find("tr").each(function(){
            var tdArr = $(this).children();
            var studentId = tdArr.eq(0).find('input').val();//学生编号
            var studentNumber = tdArr.eq(1).text();//学号
            var studentgrade = tdArr.eq(7).find('input').val();// 成绩

            if(studentgrade == null || studentgrade == ''){
                studentgrade = 0;
            }
            console.info(studentId +"/"+studentgrade);
            scoreData[i] = {'stuId':Number(studentId),'courseId':courseId,'schoolYear':schoolYear,'grade':Number(studentgrade)};
            i = i+1;
        });

        console.info(scoreData);
        addScore(scoreData);
    });

    function addScore(data){
        console.info(JSON.stringify(data));
        $.ajax({
            url:"${ctx}/score/addScoreList",
            type:"POST",
            //traditional: true,//使ajax支持数组数据
            //data:{'scoreInfoList':data},
            data:JSON.stringify(data),
            contentType: "application/json",
            dataType:"json",//必须
            success:function (data) {
                if(data.code == 100){
                    layer.msg(data.msg, {icon: 1,time: 2000}, function(){
                        window.location.href = "${ctx}/score/select";
                    });
                }else{
                    layer.msg(data.msg)
                }
            }
        })
    }

    $("#back_btn").click(function () {
        window.location.href = "${ctx}/score/select";
    });

</script>


</body>

</html>



