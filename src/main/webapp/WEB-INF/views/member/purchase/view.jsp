<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>
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

#content {
	margin-top: 20px;
}

.containers {
	width: 55%;
	margin: 0 auto 50px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

form>#condition {
	box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.4);
	border-radius: 15px;
	text-align: center;
	color: #fff;
	background-color: #ce1212;
	opacity: 0.85;
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

.btn-container {
	text-align: center;
	margin-top: 20px;
}

.btn {
	color: #fff;
	background: #ce1212;
	border: none;
	font-size: 14px;
	padding: 8px 20px;
	margin-left: 30px;
	border-radius: 15px;
	font-weight: bold;
}

.btn.cancel {
	background-color: #ccc;
}

#personnel {
	display: flex;
	flex-wrap: wrap;
}

#personnel>div {
	flex: 0 0 calc(33.33% - 20px);
	align-text: center;
	margin: 10px;
	justify-content: space-around;
	align-items: center;
}

#content ul {
	list-style-type: none;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 200px;
	font-size: 14px;
	width: 100%;
}

.line {
	display: inline-block;
	width: 80%;
	position: relative;
	vertical-align: top;
}

.amountWrap {
	color: #505050;
	border: 3px solid #61656a;
}

.payWrap .amountWrap .totalOrder {
	border-width: 3px 0 3px 0;
	background-color: #fff;
	display: flex;
	justify-content: center;
	align-items: center;
}

.amountWrap ul li {
	margin: auto 0;
	margin-top: 10px;
}

.amountWrap ul li:first-child {
	margin-top: 0;
}

.tit_order {
	padding-bottom: 8px;
	border-bottom: 1px solid #ccc;
	font-weight: 500;
	font-size: 16px;
}

.txtColorType03, table td.txtColorType03 {
	color: #e12f36 !important;
}

.amountWrap ul li span, .amountWrap .total span {
	float: right;
	font-size: 16px;
	font-weight: 600;
}

.inlineblock {
	display: inline-block !important;
}

.fn {
	float: none !important;
}

.amountWrap .price i {
	margin-right: 6px;
	font-size: 15px;
	font-style: normal;
	text-decoration: line-through;
	color: #aaa;
}

b {
	font-weight: 700;
}

.amountWrap .scheduledPay {
	padding-right: 140px;
	padding-left: 140px;
	padding: 18px 3.74%;
	color: #fff;
	background-color: #61656a;
}

.amountWrap .scheduledPay .total span {
	font-size: 23px;
	color: #ff5b62;
}

#content {
	margin-top: 20px;
}
</style>

<section id="stats-counter" class="stats-counter">
	<div id="pagetitle" class="container" data-aos="zoom-out">
		<div class="gy-4" style="justify-content: center; width: 100%;">
			<div class="col-lg-3 col-md-6" style="width: 100%;">
				<div class="stats-item text-center w-100 h-100">
					<div id="title">Item Purchase</div>
				</div>
			</div>
		</div>
	</div>
</section>

<div id="content">
	<div class="containers">
		<form action="/dd/member/purchase/ok.do" method="post">
			<div id="condition">
				<h3>Information</h3>
			</div>
			<div class="form-group">
				<label for="name">이름</label> <input type="text" id="name"
					name="name" required
					value="<sec:authentication property='principal.dto.name'/>"
					disabled>
			</div>
			<div class="form-group">
				<label for="email">이메일</label> <input type="text" id="email"
					name="email"
					value="<sec:authentication property='principal.dto.email'/>"
					disabled>
			</div>

			<div id="condition">
				<h3>선택 상품 확인</h3>
			</div>
			<c:if test="${not empty list}">
				<div class="payWrap">
					<div class="amountWrap">
						<div class="totalOrder">
							<ul id="order-list">
								<li class="tit_order fs18 txtColorType03 line"><span>선택
										상품 확인</span></li>

								<c:forEach items="${list}" var="dto">
									<li class="line">${dto.name}x${dto.ea}<span class="price"><b>${dto.ea * dto.price}
												원</b></span>
									</li>
									<input type="hidden" name="user_cart_seq"
										value="${dto.user_cart_seq}">
									<input type="hidden" name="item_seq" value="${dto.item_seq}">
									<input type="hidden" name="ea" value="${dto.ea}">
									<input type="hidden" name="price" value="${dto.price}">
									<input type="hidden" name="total_price"
										value="${dto.ea * dto.price}">
								</c:forEach>
								<li class="total line">총 주문금액 <span class="price"> <b
										class="total-price">${totalPrice} 원</b>
								</span>
								</li>
							</ul>
						</div>
						<div class="scheduledPay">
							<div class="total">
								결제예정금액 <span class="price"> <b id="payPreAmt"
									class="total-price">${totalPrice} 원</b>
								</span>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${empty list}">
				<div class="payWrap">
					<div class="amountWrap">
						<div class="totalOrder">
							<ul id="order-list">
								<li class="tit_order fs18 txtColorType03 line"><span>선택
										상품 확인</span></li>
								<li class="line">${dto.name}x${dto.ea}<span class="price"><b>${dto.ea * dto.price}
											원</b></span>
								</li>
								<input type="hidden" name="item_seq" value="${dto.item_seq}">
								<input type="hidden" name="ea" value="${dto.ea}">
								<input type="hidden" name="buy_option" value="${totalPrice}">
								<input type="hidden" name="price" value="${totalPrice}">
								<li class="total line">총 주문금액 <span class="price"> <b
										class="total-price">${totalPrice} 원</b>
								</span>
								</li>
							</ul>
						</div>
						<div class="scheduledPay">
							<div class="total">
								결제예정금액 <span class="price"> <b id="payPreAmt"
									class="total-price">${totalPrice} 원</b>
								</span>
							</div>
						</div>
					</div>
				</div>
			</c:if>

			<div id="condition" style="margin-top: 30px;">
				<h3>배송지 입력(필수 입력)</h3>
			</div>
			<div class="form-group">
				<label for="post-code">우편번호</label> <input type="text"
					name="post-code" id="post-code" class="middle-flat"
					placeholder="우편번호" required>
				<button type="button" class="button check"
					onclick="execDaumPostcode()">우편번호 검색</button>
			</div>
			<div class="form-group">
				<label for="address-basis">기본주소</label> <input type="text"
					name="address-basis" id="address-basis" class="middle-flat"
					placeholder="기본주소" required>
			</div>
			<div class="form-group">
				<label for="address-detail">상세주소</label> <input type="text"
					name="address-detail" id="address-detail" class="middle-flat"
					placeholder="상세주소" required>
			</div>
			<div class="btn-container">
				<button type="submit" class="btn">결제</button>
				<button type="button" class="btn cancel"
					onclick="location.href='/ddstudio/member/cart/list.do'">취소</button>
			</div>
			
			<input type="hidden" name="user_seq" value="<sec:authentication property='principal.dto.user_seq'/>">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>
	</div>
</div>

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
				document.getElementById("address-detail").focus(); // 상세주소로 포커스 이동
			}
		}).open();
	}
</script>