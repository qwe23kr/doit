<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
					<span class="login100-form-title p-b-34"> <image
							src="https://lh3.googleusercontent.com/proxy/-4rqIbIa_i4MRZxg2guOHZNJc5
							ZUwVELStLHzIvc3FU_Lhkmv4cfH
							GUSaGrWf61NwicjkApB9C4pM5hux_CMti
							-Nul72y4U2zR7UkWc4yUG
							dZDieaBEAipVfGGn-aDPhO9TSaGM5yxLoVy02sTbKwRnorqdbiKU"></span>

					<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
						data-validate="Type user name">
						<input class="input100" type="text" name="ui_id" id="ui_id"
							placeholder="username"> <span class="focus-input100"></span>
						<input type="hidden" name="reid" size="20">
						<input type="button" value="중복확인" onclick="checkId()">
					</div>


					<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20"
						data-validate="Type password">
						<input class="input100" type="password" name="ui_password"
							id="ui_password" placeholder="password"> <span
							class="focus-input100"></span>
					</div>
					<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
						data-validate="Type user name">
						<input class="input100" type="number" name="ui_age" id="ui_age"
							placeholder="age"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
						data-validate="Type user name">
						<input class="input100" type="text" name="ui_name" id="ui_name"
							placeholder="name"> <span class="focus-input100"></span>
					</div>  
					<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20"
						data-validate="Type password">
						<input class="input100" type="date" name="ui_birth" id="ui_birth"
							placeholder="birth"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
						data-validate="Type user name">
						<input class="input100" type="text" name="ui_email" id="ui_email"
							placeholder="email"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20"
						data-validate="Type password">
						<input class="input100" type="text" name="ui_phone" id="ui_phone"
							placeholder="phone"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20"
						data-validate="Type password">
						<input class="input100" type="text" name="ui_Nickname"
							id="ui_Nickname" placeholder="nickname"> <span
							class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							 <button type="button" class="login100-form-btn"
                        onclick="doSignUp()">회원가입</button>
						</div>
				</form>

				<div class="login100-more"
					style="background-image: url('/res/imgs/img.jpg');"></div>
			</div>
		</div>
	</div>



	<div id="dropDownSelect1"></div>

	<script src="/res/vendor/select2/select2.min.js"></script>
	<script>
		function doSignUp() {
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
			params.cmd='signup';
			$.ajax({
				url:'/ajax/user',
				method: 'POST',
		        data:JSON.stringify(params),
		        contentType:'application/json',
		        success:function(res){
		        	if(res.result==1){
		        		alert('회원가입이 완료되었습니다.');
		        		location.href='/views/login';
		        	}else{
		        	alert('문제있음');	
		        	}
		        		
		        	}
		        	
		        
			})

		}
		   function setUiAge(f){
			   var birthDate = new Date(f.value);
			   var toDate = new Date();  
			   document.querySelector('#ui_age').value = (toDate.getFullYear()-birthDate.getFullYear()+1);
		   }
		   function checkId(){
			   var id = document.querySelector('#ui_id').value;
			   var url = '/ajax/user';
			   $.ajax({
				   url : url,
				   method : 'GET',
				   data : {uiId:id,cmd:'checkID'},
				   success : function(res){
					   if(res.result){
						   alert('가입 가능합니다.');
					   }else{
						   alert('가입이 불가능한 아이디입니다.');
					   }
				   }
			   });
		   }

	</script>

</body>
</html>