<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>
/* Add padding to product boxes */
img {
	border-radius: 10px;
}

* {
	padding: 0;
	margin: 0;
}

/* Hover Effects */
.post-thumbnail img {
	transition: transform 0.3s ease;
}

.post-thumbnail:hover img {
	transform: scale(1.05); /* Enlarge image on hover */
}

/* Transition Effects */
.post-header .post-title a {
	transition: color 0.3s ease;
}

.post-header .post-title a:hover {
	color: #ff9900; /* Change to your desired hover color */
}

/* Border and Box Shadow */
.post {
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: box-shadow 0.3s ease;
	padding: 20px; /* Add padding around the content */
}

.post:hover {
	box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
}

/* Gradient Background */
.post {
	background: #fff; /* Fallback color */
	background: linear-gradient(to bottom, rgba(255, 255, 255, 0),
		rgba(255, 255, 255, 0.9));
}

/* Overlay on Images */
.imgBox {
	position: relative;
}

.imgBox::after {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.2); /* Semi-transparent overlay */
	opacity: 0;
	transition: opacity 0.3s ease;
}

.imgBox:hover::after {
	opacity: 1;
}

/* Animated Loading */
.post-thumbnail img {
	transition: opacity 0.3s ease;
}

.post-thumbnail img.loading {
	opacity: 0.5;
}

/* Carousel */
.multi-columns-row {
	display: flex;
	overflow-x: auto;
	scroll-snap-type: x mandatory;
}

.item {
	flex: 0 0 auto;
	scroll-snap-align: start;
}

/* Adjustments for better readability */
.post-entry h5 {
	margin-bottom: 10px;
}

.post-entry h6 {
	margin-bottom: 5px;
}

input-lg textarea{
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #999;
    border-radius: 10px;
    box-shadow: 3px 3px 10px #e6e6e6;
}

textarea {
    min-width: 100%;
    max-width: 100%;
    min-height : 200px;
    box-shadow: inset 3px 3px 10px #e6e6e6;

    /* vertical-align: 텍스트를 수직, 수평 정렬 할 수 있다. */
    vertical-align: top;
}
</style>
<div class="main">

	<!-- 배너 섹션 시작 -->
	<section class="module bg-dark-60 shop-page-header"
		data-background="/assets/images/product/image2.jpg">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">배너 이미지</h2>
					<div class="module-subtitle font-serif">A wonderful serenity
						has taken possession of my entire soul, like these sweet mornings
						of spring which I enjoy with my whole heart.</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 배너 섹션 종료 -->

	<!-- selected box 시작 -->
	<section class="module-small"></section>
	<!-- selected box 종료 -->

	<!-- 메인 섹션 시작 -->
	<section class="module">
		<div class="container">
			<div class="post-columns">

				<!-- 모임 생성 폼 -->
				<div class="col-sm-6 col-sm-offset-3">
					<div class="post">
						<div class="post-header font-alt">
							<h2 class="post-title">모임 생성</h2>
						</div>
						<div class="post-entry">
							<form id="partyCreateForm" action="/party/create" method="post" enctype="multipart/form-data">
							<input type="hidden" name="productNo" value="${product.prodNo}"/>
							<input type="hidden" name="adminHisNo" value="${adminProdHistory.adminHisNo}"/>
								<div class="form-group">
									<label for="partyName">모임 제목</label> <input type="text"
										class="form-control" id="partyName" name="partyTitle"
										placeholder="모임 이름을 입력하세요"> 
									<!-- 모임 설명 입력 폼 -->
									<label for="partyDescription">모임 설명</label>
									<textarea class="form-control" id="partyDescription"
										name="partyDescription" placeholder="모임 설명을 입력하세요" rows="30"></textarea>
									<!-- 모임 일 폼 -->
									<!--  <label for="#">모임일</label> <input type="date"
										class="form-control" id="#" name="#"> -->
									<!-- 모임 최대 인원 폼 -->
									<label for="partyMaximumPeople">모임 최대 인원</label> <input
										type="number" class="form-control" id="partyMaximumPeople"
										name="partyMaximumPeople" min="1" max="${adminProdHistory.peopleCount}">
									<!-- 사진 업로드 폼 -->
									<label for="partyImage">모임 사진</label> <input type="file"
										class="form-control" id="#" name="file">
								</div>
								<button type="submit" class="btn btn-d btn-circle">전송</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 메인 섹션 종료 -->

</div>

<script>
//Textarea 자동 줄 바꿈
const DEFAULT_HEIGHT = 30; // textarea 기본 height

const $textarea1 = document.querySelector('#partyDescription'); // textarea 1

// textarea 1
$textarea1.oninput = (event) => {

	 if(oninput.scrollHeight > oninput.clientHeight) //textarea height 확장
		 oninput.style.height= oninput.scrollHeight + "px";
	 else //textarea height 축소
		 oninput.style.height= (oninput.scrollHeight-18) + "px";
};

</script>
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>


<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>