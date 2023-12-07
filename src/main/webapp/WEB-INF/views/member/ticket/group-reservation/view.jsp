<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<style>
#main>#title {
	background-color: white;
}

#pagetitle {
	margin-top: 70px;
}

#title {
	font-size: 48px;
	display: block;
	color: #fff;
	font-weight: 700;
	margin-bottom: 20px;
}

.middle-flat {
	color: #000;
	margin-top: 50px;
	width: 400px;
	height: 40px;
	padding: 10px;
	border: 1px solid #ccc;
	font-size: 16px;
	margin: 0;
	align-items: center;
	justify-content: center;
}

#content {
	margin-top: 0px;
	padding-top: 20px;
}

.containers {
	width: 60%;
    margin: 20px auto 50px auto;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

form > #condition {
	box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.4);
	text-align: center;
	background-color: rgba(43, 114, 201, 0.3);
	height: 70px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-bottom: 15px;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.form-group input[type="text"], .form-group input[type="password"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.form-group input[type="password"] {
	margin-bottom: 10px;
}

.form-group input[type="tel"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.address-group {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
}

.address-group input[type="text"] {
	flex: 1;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.btn-container {
	text-align: center;
	margin-top: 20px;
}

.btn {
	padding: 10px 20px;
	background-color: #0074cc;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.btn.cancel {
	background-color: #ccc;
}
</style>

<section id="stats-counter" class="stats-counter">
	<div id="pagetitle" class="container" data-aos="zoom-out">
		<div class="gy-4" style="justify-content: center; width: 100%;">
			<div class="col-lg-3 col-md-6" style="width: 100%;">
				<div class="stats-item text-center w-100 h-100">
					<div id="title">Group Reservation</div>
				</div>
			</div>
		</div>
	</div>
</section>

<main id="main">

	<div id="content">


		<div class="containers">
			<form id="form" action="/dd/member/ticket/group-reservation/view.do"
				method="post" accept-charset="UTF-8">
				<div id="condition">
					<h3>예약자 정보</h3>
				</div>
				<div class="form-group">
					<label for="name">이름</label> <input type="text" id="name"
						name="name" required value="<sec:authentication property='principal.dto.name'/>" readonly>
						
				</div>
				<div class="form-group">
					<label for="email">이메일</label> <input type="text" id="email"
						name="email" value="<sec:authentication property='principal.dto.email'/>" readonly>
				</div>
				<div id="condition">
					<h3>단체 방문 정보</h3>
				</div>
				<div class="form-group">
					<label for="division">단체구분</label> <input type="text" id="division"
						name="group_division" required>
				</div>
				<div class="form-group">
					<label for="region">지역</label> <input type="text" id="region"
						name="region" required>
				</div>
				<div class="form-group">
					<label for="group-name">단체명</label> <input type="text"
						id="group-name" name="group_name" required>
				</div>
				<div class="form-group">
					<label for="address">주소</label>
					<div class="address">
						<input type="text" name="postCode" id="post-code"
							class="middle-flat" placeholder="우편번호" readonly>
						<button type="button" class="button check"
							onclick="execDaumPostcode()">우편번호 검색</button>
					</div>
					<div class="address">
						<input type="text" name="addressBasis" id="address-basis"
							class="middle-flat" placeholder="기본주소" readonly required>
					</div>
					<div class="address">
						<input type="text" name="addressDetail" id="address-detail"
							class="middle-flat" placeholder="상세주소" required>
					</div>
				</div>
				<div class="form-group">
					<label for="date">방문일</label> <input type="date" id="date"
						name="visit_date" required class="middle-flat">
				</div>
				<div class="form-group">
					<label for="time">방문시간</label> <input type="text" id="time"
						name="visit_time" required>
				</div>

				<div class="btn-container">
					<button type="submit" class="btn"
						onclick="location.href='/ddstudio/ticket/group-reservation.do'">예약</button>
				</div>
				<input type="hidden" name="user_seq" value="<sec:authentication property='principal.dto.user_seq'/>">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div>

	</div>

</main>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = '';
				var extraAddr = '';

				if (data.userSelectedType === 'R') { // 도로명 주소 선택
					addr = data.roadAddress;
				} else { // 지번 주소 선택
					addr = data.jibunAddress;
				}

				if (data.userSelectedType === 'R') {
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
				} else {
					document.getElementById("address-basis").value = '';
				}

				// 우편번호와 주소 정보를 input 박스에 삽입
				document.getElementById('post-code').value = data.zonecode;
				document.getElementById("address-basis").value = addr;
				document.getElementById("address-basis").value += extraAddr;
				document.getElementById("address-detail").focus(); // 상세주소로 포커스 이동
			}
		}).open();
	}

	document.getElementById('form').addEventListener('submit', function(event) {
		event.preventDefault(); // 기본 폼 제출을 막습니다.

		// 필수 입력란을 확인합니다.
		let name = document.getElementById('name').value;
		let email = document.getElementById('email').value;
		let division = document.getElementById('division').value;
		let region = document.getElementById('region').value;
		let groupName = document.getElementById('group-name').value;
		// 다른 필드에 대한 유효성 검사를 추가할 수 있습니다.

		// 필수 입력란이 비어 있는지 확인합니다.
		if (!name || !email || !division || !region || !groupName) {
			alert('필수 입력란을 모두 작성해주세요.');
		} else {
			this.submit(); // 모든 필수 입력란이 채워졌다면 폼을 제출합니다.
		}
	});
</script>