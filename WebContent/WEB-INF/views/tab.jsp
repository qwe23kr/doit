<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
<ul class="nav nav-tabs">
<li class="nav-item">
<a class="nav-link active" data-toggle="tab" href="#t1">TAB1</a>
</li>
<li class="nav-item">
<a class="nav-link" data-toggle="tab" href="#t2">TAB2</a>
</li>
<li class="nav-item">
<a class="nav-link" data-toggle="tab" href="#t3">TAB3</a>
</li>


</ul>
<div class="tab-content">
<div class="tab-pane container"id="t1"><img src="https://i20.tcafe2a.com/1906/20190609140331_ee4dc8f6d3da7fb303ca7637b9533902_asfp.gif" width="200px" class="rounded-circle mx-auto d-block"> </div>
<div class="tab-pane container"id="t2"><img src="https://i.pinimg.com/originals/db/01/88/db0188cd9ec202b69ea7c439e76caae0.gif" width="200px" class="rounded-circle mx-auto d-block"> </div>
<div class="tab-pane container"id="t3"><img src="https://file3.instiz.net/data/file3/2018/02/15/e/1/c/e1c5740f893d3164f93e358a473c09ed.gif" width="200px" class="rounded-circle mx-auto d-block"> </div>
</div>
</body>
</html>