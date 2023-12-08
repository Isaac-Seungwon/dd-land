<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#header {
	height: 90px !important;
	padding-left: 0;
}

.logo {
	width: 68px;
}

section {
	padding: 0;
}

#main h1 {
	margin-top: 45px !important;
}

h1 {
	font-size: 2rem !important;
	margin-left: 10px;
	text-align: center;
}

.d-md-block {
	margin-right: 15px;
}

.pagetitle {
	margin-top: 10px;
}

.col-12 {
	margin-top: 15px;
}

.col-lg-8 {
	width: 100%;
}

.card-body {
	min-height: 600px;
}

div.header {
	height: 60px;
	border-radius: 5px;
}

#search {
	margin-bottom: 15px;
	padding: 7px;
}

.search-form {
	width: 100%;
	margin: 0;
}

.header .search-form input {
	border: 0;
	height: 50px;
}

.header .search-form input:focus, .header .search-form input:hover {
	outline: none;
	border: none;
	box-shadow: none;
	transition: none;
}

.card-body .header {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.breadcrumb {
	margin-right: 15px;
	margin-top: 30px;
	margin-bottom: 10px;
}

.breadcrumb a {
	color: #012970;
}

.table {
	text-align: center;
}

th {
	background-color: #f2f2f2 !important;
}

.pagination {
	justify-content: center;
	margin-top: 40px;
}
/* 수정 */
.containers {
	width: 80%;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

<!-- ======= Main ======= -->
<main id="main" class="main">

	<div class="pagetitle">
		<h1>회원 정보 수정</h1>
	</div>

	<section class="section">
		<div class="row">
			<div class="col-lg-8">
				<div class="row">
					<div class="col-12">

						<div class="card">
							<div class="card-body">

								<nav class="d-flex justify-content-end">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="index.html">추가</a></li>
										<li class="breadcrumb-item"><a href="#">수정</a></li>
										<li class="breadcrumb-item active"><a href="#">삭제</a></li>
									</ol>
								</nav>

								<div class="containers">
									<form action="/dd/member/mypage/modify/edit.do" method="post">
										<div class="form-group">
											<label for="email">이메일</label> <input type="text" id="email"
												name="email" value=${dto.email} disabled>
										</div>
										<div class="form-group">
											<label for="name">이름</label> <input type="text" id="name"
												name="name" required value=${dto.name}>
										</div>
										<div class="form-group">
											<label for="birth">생년월일</label> <input type="text" id="birth"
												name="birth" required value=${dto.birth}>
										</div>
										<div class="form-group">
											<label for="tel">연락처</label> <input type="tel" id="tel"
												name="tel" required value=${dto.tel}>
										</div>
										<div class="form-group">
											<label for="post-code">우편번호</label> <input type="text"
												name="post-code" id="post-code" class="middle-flat"
												placeholder="우편번호">
											<button type="button" class="button check"
												onclick="execDaumPostcode()">우편번호 검색</button>
										</div>
										<div class="form-group">
											<label for="address-basis">기본주소</label> <input type="text"
												name="address-basis" id="address-basis" class="middle-flat"
												placeholder="기본주소" value=${dto.address}>
										</div>
										<div class="form-group">
											<label for="address-detail">상세주소</label> <input type="text"
												name="address-detail" id="address-detail"
												class="middle-flat" placeholder="상세주소">
										</div>
										<div class="btn-container">
											<button type="button" class="btn" onclick="combineAddress()">수정</button>
											<button type="button" class="btn cancel"
												onclick="location.href='/dd/member/mypage/view.do'">취소</button>
										</div>
									</form>
								</div>

								<ul class="pagination pagination-sm">
									<li class="page-item active" aria-current="page"><span
										class="page-link">1</span></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">4</a></li>
									<li class="page-item"><a class="page-link" href="#">5</a></li>
								</ul>
							</div>

						</div>
					</div>

				</div>
			</div>

		</div>
	</section>

</main>

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
				document.getElementById("address-detail").focus(); // 상세주소로 포커스 이동
			}
		}).open();
	}

	function combineAddress() {
		var basis = document.getElementById("address-basis").value;
		var detail = document.getElementById("address-detail").value;

		// 주소나 상세주소가 비어 있을 경우 빈 문자열로 처리
		basis = basis.trim() || "";
		detail = detail.trim() || "";

		var combinedAddress = basis + " " + detail;

		// 폼에 새로운 필드를 추가하고, 합쳐진 주소를 할당
		var addressInput = document.createElement("input");
		addressInput.type = "hidden";
		addressInput.name = "address";
		addressInput.value = combinedAddress;

		// 이전에 존재하던 주소 관련 필드들을 폼에서 제거
		var form = document.querySelector("form"); // 폼 요소에 대한 참조 가져오기
		var previousAddressInputs = document
				.querySelectorAll('[name^="address-"]');
		previousAddressInputs.forEach(function(input) {
			var parentNode = input.parentNode;
			if (parentNode.parentNode) {
				parentNode.parentNode.removeChild(parentNode);
			}
		});

		form.appendChild(addressInput);

		// 수정된 필드를 폼에 추가한 후에 서브밋
		form.submit();
	}
</script>