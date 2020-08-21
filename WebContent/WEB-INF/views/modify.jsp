<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>

<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<style>
.container-login100 {
	background-image: url('/res/imgs/22.jfif');
	background-repeat: no repeat;
	background-size: cover;
}

.id_overlap_button {
	position: absolute;
}
</style>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form">
				<input type="hidden" name="ui_num" id="ui_num" value="${user.uiNum}">
					<span class="login100-form-title p-b-34"> </span>

					<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
						data-validate="Type user name">
						<input class="input100" type="text" value="${user.uiId}" name="ui_id" id="ui_id"
							placeholder="username"> <span class="focus-input100"></span>
						
						<button type="button"  onclick="checkId()">중복확인</button>
					</div>


					<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20"
						data-validate="Type password">
						<input class="input100" type="password" value="${user.uiPassword}" name="ui_password"
							id="ui_password" placeholder="password"> <span
							class="focus-input100"></span>
					</div>
					<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
						data-validate="Type user name">
						<input class="input100" type="number"value="${user.uiAge}" name="ui_age" id="ui_age"
							placeholder="age"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
						data-validate="Type user name">
						<input class="input100" type="text" value="${user.uiName}" name="ui_name" id="ui_name"
							placeholder="name"> <span class="focus-input100"></span>
					</div>  
					<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20"
						data-validate="Type password">
						<input class="input100" type="date"value="${user.uiBirth}" name="ui_birth" id="ui_birth"
							placeholder="birth"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
						data-validate="Type user name">
						<input class="input100" type="text" value="${user.uiEmail}" name="ui_email" id="ui_email"
							placeholder="email"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20"
						data-validate="Type password">
						<input class="input100" type="text" value="${user.uiPhone}" name="ui_phone" id="ui_phone"
							placeholder="phone"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20"
						data-validate="Type password">
						<input class="input100" type="text" value="${user.uiNickname}" name="ui_Nickname"
							id="ui_Nickname" placeholder="nickname"> <span
							class="focus-input100"></span>
					</div>

						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							 <button type="button" class="login100-form-btn"
                        onclick="doModify()">회원정보수정</button>
                        </div>
                        <div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
                         <button type="button" class="login100-form-btn"
                        onclick="dodelete()">회원탈퇴</button>
						</div>
				</form>

				<div class="login100-more"
					style="background-image: url('/res/imgs/img.jpg');"></div>
			</div>
		</div>
	</div>



	<div id="dropDownSelect1"></div>

	<script>
		function doModify() {
			var els = document.querySelectorAll('input');
			var params = {};
			for (var i = 0; i < els.length; i++) {
				var el = els[i];
				var keys = el.name.split('_');
				for (var j = 1; j < keys.length; j++) {
					keys[j] = keys[j].substring(0, 1).toUpperCase()
							+ keys[j].substring(1);

				}
				params[keys.join('')] = el.value;
			}
			params.cmd='modify';
			$.ajax({
				url:'/ajax/user',
				method: 'POST',
		        data:JSON.stringify(params),
		        contentType:'application/json',
		        success:function(res){
		        	if(res.result==1){
		        		alert('회원수정이 완료되었습니다.');
		        		location.href='/views/index';
		        	}
		        
			}
			})
		}
		function dodelete() {
			var els = document.querySelectorAll('input');
			var params = {};
			for (var i = 0; i < els.length; i++) {
				var el = els[i];
				var keys = el.name.split('_');
				for (var j = 1; j < keys.length; j++) {
					keys[j] = keys[j].substring(0, 1).toUpperCase()
							+ keys[j].substring(1);

				}
				params[keys.join('')] = el.value;
			}
			params.cmd='delete';
			$.ajax({
				url:'/ajax/user',
				method: 'POST',
		        data:JSON.stringify(params),
		        contentType:'application/json',
		        success:function(res){
		        	if(res.result==1){
		        		alert('회원탈퇴가 완료되었습니다.');
		        		location.href='/views/index';
		        	}
		        
			}
			})
		}
		
	</script>

</body>
</html>