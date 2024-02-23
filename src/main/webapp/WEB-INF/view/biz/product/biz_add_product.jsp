
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- adminheader.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_header.jsp"%>
<!-- adminside.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_aside.jsp"%>

<style>
#att_zone {
	width: 660px;
	min-height: 150px;
	padding: 10px;
	border: 1px dotted #00f;
}

#att_zone:empty:before {
	content: attr(data-placeholder);
	color: #999;
	font-size: .9em;
}
</style>

<!-- MAIN -->
<div class="main">
	<!-- MAIN CONTENT -->
	<div class="main-content">
		<div class="container-fluid">
			<!-- OVERVIEW -->


			<!-- END OVERVIEW -->
			<div class="row">
				<div class="col-md-12">
					<!-- RECENT PURCHASES -->
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">상품 추가 페이지</h3>
							<div class="right">
								<button type="button" class="btn-toggle-collapse">
									<i class="lnr lnr-chevron-up"></i>
								</button>
								<button type="button" class="btn-remove">
									<i class="lnr lnr-cross"></i>
								</button>
							</div>
						</div>
						<!-- 메인 부분 시작 -->
						<form action="/biz/product/add-product" method="post"
							enctype="multipart/form-data">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">이곳에서 상품을 추가하실 수 있습니다!</h3>
								</div>
								<div class="panel-body">
									<!-- 게시물의 제목 -->
									<h4>게시물의 제목을 입력해 주세요</h4>
									<input type="text" class="form-control"
										placeholder="게시물의 제목을 입력해 주세요" name="prodTitle" value="제목" />
									<br>
									<!-- 게시물의 배너 이미지 -->
									<div id='image_preview'>
										<h4>해당 게시물에 들어갈 배너 이미지를 선택해 주세요!</h4>
										<input type='file' id='btnAtt' multiple='multiple'
											name="files" />
										<div id='att_zone'
											data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
									</div>
									<br>
									<h4>영업 시작 시간을 입력해 주세요</h4>
									<input type="number" class="form-control"
										placeholder="영업 시작 시간을 입력해 주세요" name="prodStartTime" value="1"
										max="24" min="1"> <br>
									<h4>영업 종료 시간을 입력해 주세요</h4>
									<input type="number" class="form-control"
										placeholder="영업 종료 시간을 입력해 주세요" name="prodEndTime" value="24"
										max="24" min="1" /> <br>
									<h4>한번 예약시 최대 인원 수를 입력해 주세요</h4>
									<input type="number" class="form-control"
										placeholder="한번 예약시 최대 인원 수를 입력해 주세요" name="prodMaximumPeople"
										value="1" max="100" min="1" /> <br>
									<h4>한 시간 당 / 한 사람 당 가격을 책정해 주세요</h4>
									<div class="input-group">
										<span class="input-group-addon">₩</span> <input
											class="form-control" type="number" name="prodPrice"
											value="1000" step="1000" min="1000" max="10000000" /> <span
											class="input-group-addon">원</span>
									</div>
									<br>
									<h4>공간을 소개해주세요</h4>
									<textarea class="form-control" placeholder="공간을 소개해주세요"
										rows="4" id="textarea1" name="prodSpaceInfo"></textarea>
									<br>
									<h4>대여할 물품을 소개해주세요</h4>
									<textarea class="form-control" placeholder="대여할 물품을 소개해주세요"
										rows="4" id="textarea2" name="prodGoodsInfo"></textarea>
									<br>
									<h4>예약시 주의 사항을 소개해주세요</h4>
									<textarea class="form-control" placeholder="예약시 주의 사항을 소개해주세요"
										rows="4" id="textarea3" name="prodCautionInfo"></textarea>
									<br>
									<h4>대분류 카테고리</h4>
									<select class="form-control" name="prodMajorCategoryId"
										id="mainCategory" onchange="updateSubcategories()">
										<c:forEach items="${mainCategory}" var="category">
											<option value="${category.categoryId}">${category.mainCategoryName}</option>
										</c:forEach>
									</select> <br>

									<h4>소분류 카테고리</h4>
									<select class="form-control" name="prodSubcategoryId"
										id="subcategory">
										<!-- 이 부분은 JavaScript로 동적으로 업데이트됩니다 -->
									</select> <br>
								</div>
							</div>
							<!-- END INPUTS -->

							<!-- INPUT GROUPS -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">위치 선정</h3>
								</div>
								<div class="panel-body">
									<!-- 지도 시작 -->
									<h4>주소를 입력해 주세요</h4>
									<button type="button" class="btn btn-primary"
										style="margin-bottom: 10px;" onclick="findAddress()">주소
										검색</button>
									<input type="text" id="adress" placeholder="주소"
										class="form-control" readonly name="prodAddress" /> <br />

									<h4>주소의 상세 정보를 입력해 주세요</h4>
									<input type="text" id="detailedAddress" placeholder="주소"
										class="form-control" name="prodDetailedAddress"
										onchange="changeFullAddress()" /> <br />

									<!-- 주소 종합 -->
									<input type="text" id="fullAddress" placeholder="주소 종합"
										class="form-control" name="prodFullAddress" readonly /> <br />

									<!-- 위도 -->
									<input type="text" id="lat" placeholder="위도"
										class="form-control" name="prodLocationY" readonly /> <br />

									<!-- 경도 -->
									<input type="text" id="lng" placeholder="경도"
										class="form-control" name="prodLocationX" readonly /> <br />

									<h4 style="margin-top: 20px;">지도 상세 위치를 지정해 주세요</h4>
									<div id="map"
										style="height: 300px; margin-top: 10px; display: none"></div>

									<!-- 지도 끝 -->
								</div>
							</div>
							<!-- END INPUT GROUPS -->

							<!-- 푸터 부분 -->
							<div class="panel-footer">
								<div class="row">
									<div class="col-md-6">
										<span class="panel-note"><i class="fa fa-clock-o"></i>
											상품을 등록해 보세요!!</span>
									</div>
									<div class="col-md-6 text-right">
										<input type="submit" class="btn btn-primary" value="제품 등록하기" />
									</div>
								</div>
							</div>
						</form>
					</div>
					<!-- END 푸터 부분 -->
				</div>
			</div>
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
</div>
<!-- END WRAPPER -->

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66d1a68d1892ba5335686cc3e3bd8537&libraries=services"></script>
<script>

// Textarea 자동 줄 바꿈
const DEFAULT_HEIGHT = 30; // textarea 기본 height

const $textarea1 = document.querySelector('#textarea1'); // textarea 1
const $textarea2 = document.querySelector('#textarea2'); // textarea 2
const $textarea3 = document.querySelector('#textarea3'); // textarea 3

// textarea 1
$textarea1.oninput = (event) => {
  const $target = event.target;

  $target.style.height = 0;
  $target.style.height = DEFAULT_HEIGHT + $target.scrollHeight + 'px';
};

// textarea 2
$textarea2.oninput = (event) => {
	  const $target = event.target;

	  $target.style.height = 0;
	  $target.style.height = DEFAULT_HEIGHT + $target.scrollHeight + 'px';
	};
	
// textarea 3
$textarea3.oninput = (event) => {
		  const $target = event.target;

		  $target.style.height = 0;
		  $target.style.height = DEFAULT_HEIGHT + $target.scrollHeight + 'px';
	};

	
// 파일 미리보기
( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
  imageView = function imageView(att_zone, btn){

    var attZone = document.getElementById(att_zone);
    var btnAtt = document.getElementById(btn)
    var sel_files = [];
    
    // 이미지와 체크 박스를 감싸고 있는 div 속성
    var div_style = 'display:inline-block;position:relative;'
                  + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
    // 미리보기 이미지 속성
    var img_style = 'width:100%;height:100%;z-index:none';
    // 이미지안에 표시되는 체크박스의 속성
    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
  
    btnAtt.onchange = function(e){
    
        // 원래 이미지 제거
        while (attZone.firstChild) {
        	attZone.removeChild(attZone.firstChild);
        }
      var files = e.target.files;
      
      var fileArr = Array.prototype.slice.call(files)
      for(f of fileArr){
        imageLoader(f);
      }
    }  
    
    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
    imageLoader = function(file){
      sel_files.push(file);
      var reader = new FileReader();
      reader.onload = function(ee){
        let img = document.createElement('img')
        img.setAttribute('style', img_style)
        img.src = ee.target.result;
        attZone.appendChild(makeDiv(img, file));
      }
      
      reader.readAsDataURL(file);
    }
    
    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
    makeDiv = function(img, file){
      var div = document.createElement('div')
      div.setAttribute('style', div_style)
      
      var btn = document.createElement('input')
      btn.setAttribute('type', 'button')
      btn.setAttribute('value', 'x')
      btn.setAttribute('delFile', file.name);
      btn.setAttribute('style', chk_style);
      btn.onclick = function(ev){
        var ele = ev.srcElement;
        var delFile = ele.getAttribute('delFile');
        for(var i=0 ;i<sel_files.length; i++){
          if(delFile== sel_files[i].name){
            sel_files.splice(i, 1);      
          }
        }
        
        dt = new DataTransfer();
        for(f in sel_files) {
          var file = sel_files[f];
          dt.items.add(file);
        }
        btnAtt.files = dt.files;
        var p = ele.parentNode;
        attZone.removeChild(p)
      }
      div.appendChild(img)
      div.appendChild(btn)
      return div
    }
  }
)('att_zone', 'btnAtt')


	
	// 지도 API 
	var lat = document.getElementById('lat'); // 위도 
	var lng = document.getElementById('lng'); // 경도

	var mapContainer = document.getElementById("map"), // 지도를 표시할 div
	mapOption = {
		center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		level : 5, // 지도의 확대 레벨
	};

	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	//마커를 미리 생성
	var marker = new daum.maps.Marker({
		position : new daum.maps.LatLng(37.537187, 127.005476),
		map : map,
	});

	function findAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = data.address; // 최종 주소 변수
				console.log(addr); // 확인

				// 주소 정보를 해당 필드에 넣는다.
				document.getElementById("adress").value = addr;
				// 주소 fullAddress 업데이트
				changeFullAddress();
				// 주소로 상세 정보를 검색
				geocoder.addressSearch(data.address, function(results, status) {
					// 정상적으로 검색이 완료됐으면
					if (status === daum.maps.services.Status.OK) {
						var result = results[0]; //첫번째 결과의 값을 활용
						console.log(result);
						// 해당 주소에 대한 좌표를 받아서
						var coords = new daum.maps.LatLng(result.y, result.x);
						// 지도를 보여준다.
						mapContainer.style.display = "block";
						map.relayout();
						// 지도 중심을 변경한다.
						map.setCenter(coords);
						// 마커를 결과값으로 받은 위치로 옮긴다.
						marker.setPosition(coords);
						
						lat.value = result.y;
						lng.value = result.x;
					}
				});
			},
		}).open();
	}

	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {

		// 클릭한 위도, 경도 정보를 가져옵니다 
		var latlng = mouseEvent.latLng;

		// 마커 위치를 클릭한 위치로 옮깁니다
		marker.setPosition(latlng);

		var y = latlng.getLat();
		var x = latlng.getLng();
		lat.value = result.y;
		lng.value = result.x;

	});
	
	// 전체 주소 변경
	function changeFullAddress() {
		var address = document.querySelector('#adress');
		var detailedAddress = document.querySelector('#detailedAddress');
		var fullAdderss = document.querySelector('#fullAddress');
		
		fullAddress.value = address.value + " " + detailedAddress.value;
	}
	
	// 페이지 로드 시 초기 설정
	document.addEventListener("DOMContentLoaded", function() {
	    updateSubcategories();
	});
	
	// 비동기 통신 - 메인 카테고리 id 로 서브 카테고리 id 찾기
	function updateSubcategories() {
	    var mainCategoryId = document.getElementById("mainCategory").value;

	    $.ajax({
	        type: "get",
	        url: "/biz/product/subcategory?main-category=" + mainCategoryId,
	        headers : {"Content-Type" : "application/json"},
			dataType : "json",
		       success: function (res) {
					console.log(res);
					updateSubcategoriesForm(res , mainCategoryId);
		         },
	        error: function(e) {
	            console.log(e);
	        }
	    });
	}
	
	function updateSubcategoriesForm(subcategories , mainCategoryId) {
	    var subcategoryDropdown = document.getElementById("subcategory");
	    subcategoryDropdown.innerHTML = ""; // 이전의 옵션을 모두 지웁니다
	    for (var i = 0; i < subcategories.length; i++) {
	        var subcategory = subcategories[i];
	        if (subcategory.mainCategoryId == mainCategoryId) {
	            var option = document.createElement("option");
	            option.value = subcategory.categoryId;
	            option.textContent = subcategory.subcategoryName;
	            subcategoryDropdown.appendChild(option);
	        }
	    }
	}

</script>
<!-- adminside.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_footer.jsp"%>