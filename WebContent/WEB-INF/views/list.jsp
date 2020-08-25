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
<script>
var func = function(){
	document.querySelector('#deleteBtn').onclick = function(){
		var uiNumObjs = document.querySelectorAll('[name=uiNum]:checked');
		if(!uiNumObjs.length){
			alert('선택을 하고 누르라고!');
			return;
		}
		
		var uiNums=[];
		for(var i=0;i<uiNumObjs.length;i++){
			uiNums.push(uiNumObjs[i].value);
		}
		var params = {
			uiNums : uiNums,
			cmd : 'deleteUsers'
		}
		$.ajax({
			url : '/ajax/user',
			method : 'POST',
			data : JSON.stringify(params),
			success : function(res){
				if(res.result){
					alert('삭제 완료');
				}
			}
		})
		
	}
	document.querySelector('#allCheck').onchange = function(){
		$('[name=uiNum]').prop('checked',this.checked);
	}
	$.ajax({
		url:'/ajax/user',
		method:'GET',
		data : {cmd:'list'},
		success:function(res){
			var ths = document.querySelectorAll('th[data-col],th[data-pk]');
			var html = '';
			for(var i=0;i<res.list.length;i++){
				var user = res.list[i];
				html += '<tr>';
				for(var j=0;j<ths.length;j++){
					var th = ths[j];
					var col = th.getAttribute('data-col');
					if(col){
						html += '<td>' + user[col] + '</td>';
					}else{
						col = th.getAttribute('data-pk');
						html += '<td><input type="checkbox" name="'+col +'" value="' + user[col] + '"></td>';
					}
				}
				html += '</tr>';
			}
			$('#tBody').html(html);
		}
	})
}
$(document).ready(func);
</script>
<h3><img src="data:image/jpeg;base64,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"></h3>
<input type="text" data-type="text" id="in">
<div id="userListDiv">
	<table class="table table-bordered">
		<tr>
			<th data-pk="uiNum"><input type="checkbox" id="allCheck" ></th>
			<th data-col="uiNum">번호</th>
			<th data-col="uiAge">나이</th>
			<th data-col="uiName">이름</th>
			<th data-col="uiId">아이디</th>
			<th data-col="uiBirth">생년월일</th>
			<th data-col="uiEmail">이메일</th>
			<th data-col="uiPhone">전번</th>
			<th data-col="uiCredat">가입일</th>
			<th data-col="uiNickName">별명</th>
			<th data-col="uiAdmin">어드민</th>
		</tr>
		<tbody id="tBody">
		</tbody>
	</table>
	<button class="btn btn-danger" id="deleteBtn">유저삭제</button>
</div>
</body>
</html>
