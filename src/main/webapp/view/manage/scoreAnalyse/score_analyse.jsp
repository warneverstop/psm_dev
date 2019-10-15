<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/18
  Time: 9:55
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

    <title>库存类别分析</title>

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
                    <h5>各科成绩及格/不及格人数统计</h5>
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
                    <div class="row" style="margin-bottom: 20px;">
                        <div class="col-sm-3">
                            <select class="form-control m-b" name="schoolYear" id="schoolYear">
                                <option value="大一上">大一上</option>
                                <option value="大一下">大一下</option>
                                <option value="大二上">大二上</option>
                                <option value="大二下">大二下</option>
                                <option value="大三上">大三上</option>
                                <option value="大三下">大三下</option>
                                <option value="大四上">大四上</option>
                                <option value="大四下">大四下</option>
                            </select>
                        </div>
                    </div>
                    <div class="row" id="columnar_row_id">
                        <div class="echarts" id="echarts-bar-chart"></div>
                    </div>

                    <div class="row" style="margin-top: 20px;">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>课程名</th>
                                    <th>课程属性</th>
                                    <th>学分</th>
                                    <th>总人数</th>
                                    <th>不及格人数</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${scoreList}" var="score">
                                    <tr>
                                        <td>${score.courseName}</td>
                                        <td>${score.attribute}</td>
                                        <td>${score.credit}</td>
                                        <td>${score.passingNumber+score.noPassingNumber}</td>
                                        <td>${score.noPassingNumber}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- 全局js -->
<script src="${ctx}/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/js/bootstrap.min.js?v=3.3.6"></script>
<!-- ECharts -->
<script src="${ctx}/js/plugins/echarts/echarts-all.js"></script>
<!-- 自定义js -->
<script src="${ctx}/js/content.js?v=1.0.0"></script>

<script>

    $("#schoolYear").val("${schoolYear}");

    var i = 0;
    var courseNameData = new Array();
    var passingNumber = new Array();
    var noPassingNumber = new Array();

    <c:forEach items="${scoreList}" var="score">
    courseNameData[i] = "${score.courseName}";
    passingNumber[i] = "${score.passingNumber}";
    noPassingNumber[i] = "${score.noPassingNumber}";
    i = i + 1;
    </c:forEach>
    console.info(courseNameData);
    console.info(passingNumber);
    console.info(noPassingNumber);


    var id = "echarts-bar-chart";
    //建立柱状图
    if(Number(${size})<1){
        alert("无数据");
    }else{
        columnarEcharts(id,passingNumber,noPassingNumber);
    }
    function columnarEcharts(id,nameData,volumeData) {
        var barChart = echarts.init(document.getElementById(id));
        var option = {
            title : {
                text: '学期各科成绩统计',
                subtext: '班级：${classNumber}'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['及格人数','不及格人数']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : courseNameData
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'及格人数',
                    type:'bar',
                    data:passingNumber,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                },
                {
                    name:'不及格人数',
                    type:'bar',
                    data:noPassingNumber,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                }
            ]
        };

        barChart.setOption(option);
        window.onresize = barChart.resize;
    }

    //点击学期后重新查询
    $("#schoolYear").on("change",function(){
        var schoolYear = $("option:selected",this).val();
        console.info("学期学年:"+schoolYear);
        window.location.href = "${ctx}/score/scoreAnalyse?schoolYear="+schoolYear;
    });
</script>
</body>

</html>


