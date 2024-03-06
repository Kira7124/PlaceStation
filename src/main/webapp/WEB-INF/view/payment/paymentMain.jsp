<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>
#img {
	height: 75px
}

#paymentElement {
	display: none;
}
</style>

<section class="module">
	<div class="container">
		<div class="row">
			<div class="col-sm-2 col-sm-offset-5">
				<div class="alt-module-subtitle" style="margin-bottom: 10px;">
					<span class="holder-w"></span>
					<h5 class="font-serif">payment</h5>
					<span class="holder-w"></span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<h1 class="module-title font-alt">결제 페이지</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				<div class="post">
					<div class="post-images-slider">
						<ul class="slides post-thumbnail">
							<c:forEach var="file" items="${product.filePath}">
								<li><img src="${file}" alt="Blog Slider Image"
									style="width: 750px; height: 400px;" /></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="row col-sm-8 col-sm-offset-2">
			<div>
				<div class="shop-Cart-totalbox">
					<button class="btn btn-success btn-circle" type="button"
						style="margin-bottom: 10px;">상품 상세 목록</button>

					<table class="table table-striped table-border checkout-table">
						<tbody>
							<tr>
								<th>상품명 :</th>
								<td>${product.prodTitle}</td>
							</tr>
							<tr>
								<th>인원 당 가격 :</th>
								<td>${product.prodPrice}원</td>
							</tr>
							<tr>
								<th>상품 주소 :</th>
								<td>${product.prodFullAddress}</td>
							</tr>
							<tr>
								<th>구매 날짜 및 시간 :</th>
								<td>${order.date}&nbsp;${order.startTime}&nbsp;시&nbsp;~&nbsp;${order.endTime}&nbsp;시</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="row col-sm-8 col-sm-offset-2">
			<div>
				<div class="shop-Cart-totalbox">
					<button class="btn btn-success btn-circle" type="button"
						style="margin-bottom: 10px;">유저 목록</button>
					<table class="table table-striped table-border checkout-table">
						<tbody>
							<tr>
								<th>이름 :</th>
								<td>${memberDto.userName}</td>
							</tr>
							<tr>
								<th>등급 :</th>
								<td>${memberDto.userGrade}등급</td>
							</tr>
							<tr>
								<th>전화번호 :</th>
								<td>${memberDto.userHp}</td>
							</tr>
							<tr>
								<th>포인트 :</th>
								<td>
									<div class="row">
										<section style="margin-left: 10px;">
											<h5>현재 포인트 : ${memberDto.userPoint} 원</h5>
										</section>
									</div>
									<div class="row">
										<div class="col-sm-5">
											<input class="form-control input-lg " type="number"
												name="people" max="${memberDto.userPoint}" min="0" step="1000"
												required="required" style="height: 35px;"
												onchange="onChangePoint()" id="point" />
										</div>
										<div class="col-sm-3">
											<button onclick="onclickPoint()" class="btn btn-primary">전액
												사용</button>
										</div>
									</div>
								</td>

							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="row col-sm-8 col-sm-offset-2">
			<div>
				<div class="shop-Cart-totalbox">
					<button class="btn btn-success btn-circle" type="button"
						style="margin-bottom: 10px;">총 결제 목록</button>
					<table class="table table-striped table-border checkout-table">
						<tbody>
							<tr>
								<th>총 금액 :</th>
								<td>${order.getAmount()}원</td>
							</tr>
							<tr>
								<th>등급 할인 금액 :</th>
								<td><span id="dicount">${order.getDiscountAmount()}</span>
									원</td>
							</tr>
							<tr>
								<th>사용 포인트 :</th>
								<td><span id="checkoutPoint">0</span> 원</td>
							</tr>
							<tr>
								<th>총 결제 금액 :</th>
								<td><span id="checkoutAmount">${order.getAmount() - order.getDiscountAmount()}</span>
									원</td>

							</tr>
						</tbody>
					</table>
					<button class="btn btn-lg btn-block btn-round btn-d"
						onclick="onclickCheckout()">결제하기</button>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="module " id="paymentElement ">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="shop-Cart-totalbox">
					<button class="btn btn-success btn-circle" type="button">결제
						플랫폼</button>
					<h2>결제하실 플랫폼을 선택해 주세요</h2>

					<div style="margin: 20px; float: inline-start">
						<button onclick="kakaoPay()">
							<img src="/assets/images/payment/kakaoPay.png"
								style="width: 200px; height: 180px;" />
						</button>
					</div>
					<div style="margin: 20px; float: inline-start">
						<button onclick="tosspay()">
							<img src="/assets/images/payment/tosspay.png"
								style="width: 200px; height: 180px;" />
						</button>
					</div>
					<div style="margin: 20px; float: inline-start">
						<button onclick="payco()">
							<img src="/assets/images/payment/paypal.webp"
								style="width: 200px; height: 180px;" />
						</button>
					</div>
					<div style="margin: 20px; float: inline-start">
						<button onclick="kgPay()">
							<img src="/assets/images/payment/kgpay.png"
								style="width: 200px; height: 180px;" />
						</button>
					</div>

				</div>
			</div>
		</div>
	</div>

</section>


<!-- <%--  포트원  --%> -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>

	const con = ${order.getAmount() - order.getDiscountAmount()};
	let checkoutPoint = 0; 
	let checkoutAmount = con;
	
	// 포인트 바꿀 시
	const onChangePoint = () => {
	point = document.querySelector("#point").value;
	cPoint = document.querySelector("#checkoutPoint");
	aPoint = document.querySelector("#checkoutAmount");

	// point 가 더 크다면
	if(point > checkoutAmount) {
		alert("금액은 0보다 낮을 수는 없습니다.");
		return null;
	}
	
	// POINT 를 이상하게 쳤을 때
	if(point > ${memberDto.getUserPoint()}) {
		alert("현재 가지신 포인트보다 높게 사용하실 수 없습니다.");
		return null;
	}
	
	
	
	// 전역 변수에 넣기
	checkoutPoint = point;
	// 사용된 포인트 금액 확인
	cPoint.innerText = "- " + point;
	
	// 사용한 포인트만큼 가격 깎기
	checkoutAmount = (con - point);
	aPoint.innerText = (con - point);
	
	}
	
	// 전액 포인트 사용
	const onclickPoint = () => {
		point = document.querySelector("#point");
		cPoint = document.querySelector("#checkoutPoint");
		aPoint = document.querySelector("#checkoutAmount");
		
		
		point.value = (${memberDto.userPoint});
		
		// 전역 변수에 넣기
		checkoutPoint = point.value;
		// 사용된 포인트 금액 확인
		cPoint.innerText = "- " + point.value;
		
		// 사용한 포인트만큼 가격 깎기
		checkoutAmount = (con - point.value);
		aPoint.innerText = (con - point.value);
		
		console.log(checkoutPoint);
		console.log(checkoutAmount);	
	}
	
	
	// 결제 창 호버기능
	 const onclickCheckout = async () => {
        try {
            let dto = {
              prodNo : ${order.getProdNo()},
              sellerId : ${product.getProdWriterNo()}, 
              buyerId : ${memberDto.getUserNo()},
              startTime : ${order.getStartTime()} , 
              endTime : ${order.getEndTime()},
              purchaseDate : '${order.date}',
            };
            let response = await fetch(`/payment/valid-time`, {
              method: "POST",
              headers: {
                "Content-Type": "application/json",
                // authorization : `Bearer 베어러 토큰` 나중에 추가 부분
              },
              body: JSON.stringify(dto),
            });

            if(response.ok) {
        		payment = document.querySelector("#paymentElement");
      		  if (payment.style.display === "none") {
      			  payment.style.display = "block";
      			 } else {
      				  payment.style.display = "none";
      		}
            }else {
              alert("이미 예약이 있습니다.");
            }
            
        } catch (e) {
            console.error("서버 에러가 발생하였습니다.", e.message);
          }
	}
          

	// 포트원 결제 번호
	// var merchantUid;
	
      let imp_uid = "${fortOneKey.getImpUid()}";
      // 포트원
      // const IMP = window.IMP; // 생략 가능
      IMP.init(imp_uid); // 예: imp00000000a
      
      // 카카오 결제 요청
      function kakaoPay() {
        IMP.request_pay(
          {
            pg: "kakaopay.TC0ONETIME",
            pay_method: "card", // 생략 가능
           // merchant_uid: merchantUid, // 주문번호
            name: "${product.prodTitle}",
            amount: checkoutAmount, // 숫자 타입
            buyer_email: "${memberDto.userEmail}",
            buyer_name: "${memberDto.userName}",
            buyer_tel: "${memberDto.userHp}",
            buyer_addr: "${memberDto.userAddress}",
            buyer_postcode: "01181",
          },
          async function (rsp) {
            // callback
            //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
            if (rsp.success) {
              console.log("결제 성공");
              savePayment(rsp.merchant_uid);
            } else {
              alert(`결제에 실패하였습니다. ${rsp.error_msg}`);
            }
          }
        );
      }

      // 페이코 결제 요청
      function payco() {
        // 결제 초기화
        IMP.request_pay(
          {
            pg: "payco",
            // merchant_uid: merchantUid, // 상점에서 관리하는 주문 번호 (주석 == 난수 자동 생성)
            name: "${product.prodTitle}",
            amount: checkoutAmount, // 숫자 타입
            buyer_email: "${memberDto.userEmail}",
            buyer_name: "${memberDto.userName}",
            buyer_tel: "${memberDto.userHp}",
            buyer_addr: "${memberDto.userAddress}",
            buyer_postcode: "01181",
          },
          function (rsp) {
            // callback 로직
            if (rsp.success) {
              console.log("결제 성공");
              savePayment(rsp.merchant_uid);
            } else {
              alert(`결제에 실패하였습니다. ${rsp.error_msg}`);
            }
          }
        );
      }

      // kg 이니시스 결제 요청
      function kgPay() {
        // 결제 초기화
        IMP.request_pay(
          {
            pg: "html5_inicis.INIBillTst",
            pay_method: "card",
            // merchant_uid: merchantUid,
            name: "${product.prodTitle}",
            amount: checkoutAmount, // 숫자 타입
            buyer_email: "${memberDto.userEmail}",
            buyer_name: "${memberDto.userName}",
            buyer_tel: "${memberDto.userHp}",
            buyer_addr: "${memberDto.userAddress}",
            buyer_postcode: "01181",
            display: {
                card_quota: [3]  // 할부개월 3개월까지 활성화
            }
          },
          function (rsp) {
            if (rsp.success) {
              console.log("결제 성공");
              savePayment(rsp.merchant_uid);
            } else {
              alert(`결제에 실패하였습니다. ${rsp.error_msg}`);
            }
          }
        );
      }

      // 토스 페이 결제 요청
      function tosspay() {
        // 결제 초기화
        IMP.request_pay(
          {
            pg: "tosspay",
            pay_method: "card",
            // merchant_uid: merchantUid,
            name: "${product.prodTitle}",
            amount: checkoutAmount, // 숫자 타입
            buyer_email: "${memberDto.userEmail}",
            buyer_name: "${memberDto.userName}",
            buyer_tel: "${memberDto.userHp}",
            buyer_addr: "${memberDto.userAddress}",
            buyer_postcode: "01181"
          },
          function (rsp) {
            if (rsp.success) {
              console.log("결제 성공");
              savePayment(rsp.merchant_uid);
            } else {
              alert(`결제에 실패하였습니다. ${rsp.error_msg}`);
            }
          }
        );
      }

      async function savePayment(merchantUid) {
        try {
        	// 결제금액이 - 라면
        	if(Number(checkoutAmount) < 0) {
        		alert("금액이 0보다 작을 수는 없습니다.")
        		return null;
        	}
        	
          let dto = {
            merchantUid: merchantUid,
            prodNo : ${order.getProdNo()},
            amount: ${order.getAmount()},
            afterAmount: Number(checkoutAmount),
            usePoint : Number(checkoutPoint),
            discount : ${order.getDiscountPercent()},
            prodName : '${product.getProdTitle()}',
           	sellerId : ${product.getProdWriterNo()}, 
           	buyerId : ${memberDto.getUserNo()},
           	startTime : ${order.getStartTime()} , 
           	endTime : ${order.getEndTime()},
           	peopleCount : ${order.getPeople()},
           	purchaseDate : '${order.date}',
           	currentUserPoint : ${memberDto.getUserPoint()}
          };
          let response = await fetch(`/payment/save`, {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
              // authorization : `Bearer 베어러 토큰` 나중에 추가 부분
            },
            body: JSON.stringify(dto),
          });

          if (response.ok) {
        	console.log(response);
            console.log("포트원 결제 완료");
            alert("결제가 완료되었습니다.");
            location.href = "/main/index";
            
            // 저장 완료시 로직
          } else {
            console.error("실패", response.statusText);
            alert("결제에 실패하셨습니다. 자동으로 환불처리 됩니다.");
            location.href = "/main/index";
          }
        } catch (e) {
          console.error("실패", e.message);
          alert("결제에 실패하셨습니다. 자동으로 환불처리 됩니다.");
          location.href = "/main/index";
        }
      }
    </script>
<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>