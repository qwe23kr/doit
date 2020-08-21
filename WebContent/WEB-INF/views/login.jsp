<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 세러데낱</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>

<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<style>
.container-login100 {
	background-image: url('/res/imgs/22.jfif');
	background-repeat: no repeat;
	background-size: cover;
}





</style>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-34"> <image
							src="https://i.imgur.com/mKP2MeK.gif/"></span>

					<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
						data-validate="Type user name">
						<input class="input100" type="text" name="ui_id" id="ui_id"
							placeholder="username" > <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20"
						data-validate="Type password">
						<input class="input100" type="password" name="ui_password"
							id="ui_password" placeholder="password"> <span
							class="focus-input100"></span>
					</div>

						<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" onclick="doLogin()">
								Login
							</button>
						</div>

					<div class="w-full text-center p-t-27 p-b-239">
						<span class="txt1"> 회원정보 </span> <a href="#" class="txt2">
							아이디찾기 / 비밀번호찾기 </a>
					</div>
					
					<div class="flex-c-m">
						<a href="#" class="login100-social-item bg1">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="login100-social-item bg2">
							<i class="fa fa-twitter"></i>
						</a>

						<a href="#" class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a>
					</div>

					<div class="w-full text-center">
						<a href="/views/join" class="txt3"> 회원가입 </a>
					</div>
				</form>

				<div class="login100-more" style="background-image: url('/res/imgs/img.jpg');"></div>
			</div>
		</div>
	</div>



	<div id="dropDownSelect1"></div>

	<script src="/res/vendor/select2/select2.min.js"></script>
	<script>
		function doLogin() {
			var uiId = $('#ui_id').val();
			var uiPassword = $('#ui_password').val();
			var cmd = 'login';
			var param = {
				uiId : uiId,
				uiPassword : uiPassword,
				cmd : cmd

			}
			$.ajax({
				method : 'POST',
				url : '/ajax/user',
				data : JSON.stringify(param),
				contentType : 'application/json',
				success : function(res) {
					if (res.result) {
						alert('로그인 완료');
						location.href='/';
					} else {

						alert('아이디확인점!');
					}

				}
			});
		}
	</script>

</body>
</html>