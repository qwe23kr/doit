<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<div class="tab-pane container"id="t1"><img src="https://i20.tcafe2a.com/1906/20190609140331_ee4dc8f6d3da7fb303ca7637b9533902_asfp.gif" width="800px" class="rounded-circle mx-auto d-block"> </div>
<div class="tab-pane container"id="t2"><img src="https://3.bp.blogspot.com/-pTWe5qgmkCM/WbyQ-kFuAQI/AAAAAAAAJOw/oHinC-IbuikEGlscd5gcVDImOQToJcoVQCLcBGAs/s1600/1.gif" width="800px" class="rounded-circle mx-auto d-block"> </div>
<div class="tab-pane container"id="t3"><img src="https://t1.daumcdn.net/thumb/R1024x0/?fname=http://cfile298.uf.daum.net/image/993B9B415A4F2F532E7299" width="800px" class="rounded-circle mx-auto d-block"> </div>
</div>

<div class="container">
${sessionScope.user.uiNickname}님 반갑습니다.<br>
<c:if test="${sessionScope.user.uiAdmin=='1'}">
<a href="/views/list"><button class="btn btn-info">유저리스트</button></a>
</c:if>

<button class="btn btn-info" onclick="doLogout()">로그아웃</button>
<button class="btn btn-info" onclick="doModify()">정보수정</button>
<button class="btn btn-info" onclick="toggleDeleteDiv('')">탈퇴하기</button>
	<div style="display:none" class="container" id="deleteDiv">
		정말로 삭제할라고?<br>
		<input type="password" name="ui_password" id="ui_password">
		<button onclick="doDeleteAccount()">확인</button>
		<button onclick="toggleDeleteDiv('none')">취소</button>
	</div>
	
</div>
<script>
function doLogout(){
	
	$.ajax({
	url:'/ajax/user',
	method:'POST',
	data:JSON.stringify({cmd:'logout'}),
	success:function(res){
		if(res.result){
			alert('로그아웃 되었습니다.');
			location.href='/views/login';
		}
		
	}
	
	})
	
	
}
function doModify(){

				alert('회원정보수정으로갑니다');
				location.href='/views/modify'
}
function toggleDeleteDiv(type){
	document.querySelector('#deleteDiv').style.display=type;
}
function doDeleteAccount(){
	var data = {
		cmd : 'deleteAccount',
		uiPassword : document.querySelector('#ui_password').value
	}
	$.ajax({
		url : '/ajax/user',
		method:'POST',
		data:JSON.stringify(data),
		contentType:'application/json',
		success : function(res){
			if(res.result===1){
				alert('탈퇴되었습니다.');
				location.href='/views/login';
			}else if(res.result===-1){  
				alert('비밀번호가 올바르지 않습니다.');
			}else{
				alert('실패하였습니다.');
			}
		}
	})
}

</script>
</body>
</html>

