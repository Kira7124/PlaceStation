
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- adminheader.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_header.jsp"%>
<!-- adminside.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_aside.jsp"%>

<style>
#att_zone {
	width: 300px;
	min-height: 200px;
	padding: 10px;
	border: 1px solid #00f;
	border-radius: 10px;
	margin-bottom: 5px;
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
				<div class="col-md-9">
					<form action="/biz/account/update" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="_method" value="put" />
						<!-- RECENT PURCHASES -->
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">회원 정보 수정 페이지</h3>
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
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">이곳에서 회원 정보를 수정하실 수 있습니다!</h3>
								</div>
								<div class="panel-body">

									<!-- 게시물의 제목 -->
									<div class="col-md-5" style="margin-right: 10px">
										<h4>이름</h4>
										<input type="text" class="form-control"
											placeholder="이름을 입력해 주세요" name="userName"
											value="${biz.userName}" /> <br>
										<h4>이메일</h4>
										<input type="text" class="form-control"
											placeholder="아이디를 입력해 주세요" name="userId"
											value="${biz.userEmail}" disabled="disabled" /> <br>

										<h4>비밀번호 확인</h4>
										<div class="input-group">
											<input type="password" class="form-control"
												placeholder="현재 비밀번호를 입력해 주세요." id="current-password">
											<span class="input-group-btn"><button type="button"
													class="btn btn-primary" id="currentPasswordCheck"
													onclick="isPasswordRight()">확인</button></span>
										</div>
										<!-- 비밀번호 변경 -->
										<div id="change-password-form" style="display: none">
											<h4>비밀번호 변경</h4>
											<div class="input-group">
												<input type="password" class="form-control"
													placeholder="변경하실 비밀번호를 입력해 주세요" id="password1"> <span
													class="input-group-btn"><button type="button"
														class="btn btn-primary" id="checkPassword"
														onclick="changePasswordForm()">변경</button></span>
											</div>
											<ul class="list-unstyled activity-list regexDescription">
												<li>아래의 유효성을 검사합니다.</li>
												<li>1. 숫자가 최소한 1개 포함되어야 합니다. <br /> 2. 소문자가 최소한 1개
													포함되어야 합니다. <br /> 3. 대문자가 최소한 1개 포함되어야 합니다. <br /> 4. 특수
													문자(@, #, $, %, ^, &, +, =, ! 중 하나)가 최소한 1개 포함되어야 합니다. <br />
													5. 공백이 없어야 합니다. <br /> 6. 최소한 8자 이상의 문자열이어야 합니다.
												</li>
											</ul>
											<br>
											<div class="changePassword" style="display: none">
												<h4>
													비밀번호를 다시 한번 쳐주세요 <br />(검사를 하지 않으면 저장이 되지 않습니다.)
												</h4>
												<div class="input-group">
													<input type="password" value="비밀번호"
														class="form-control password2"
														placeholder="변경하실 비밀번호를 다시 한번 더 쳐주세요" name="userPassword">
													<span class="input-group-btn"><button type="button"
															class="btn btn-primary" onclick="checkPasswordRight()">변경</button></span>
												</div>
												<input type="hidden" name="changePassword" value="N"
													id="isChangePassword" />
											</div>
										</div>
										<!-- 비밀번호 변경 완료 -->
										<br>
										<h4>휴대폰 번호 (000-0000-0000)</h4>
										<input type="text" value="${biz.userHp}" class="form-control"
											placeholder="휴대폰 번호를 입력해 주세요" name="userHp"> <br>

										<h4>주소</h4>
										<input type="text" class="form-control"
											placeholder="주소를 입력해 주세요" name="userAddress"
											value="${biz.userAddress}" /> <br />
										<h4>포트원 uid (imp_uid)</h4>
										<input type="text" class="form-control"
											placeholder="주소를 입력해 주세요" name="impUid"
											value="${biz.impUid}" /> <br />
										<h4>포트원 key (imp_key)</h4>
										<input type="password" class="form-control"
											placeholder="주소를 입력해 주세요" name="impKey"
											value="${biz.impKey}" /> <br />
										<h4>포트원 secret (imp_secret)</h4>
										<input type="password" class="form-control"
											placeholder="주소를 입력해 주세요" name="impSecret"
											value="${biz.impSecret}" />
									</div>

									<!-- 게시물의 배너 이미지 -->
									<!-- 프로필 사진 -->
									<div class="col-md-4">
										<div id='image_preview'>
											<h4>해당 게시물에 들어갈 배너 이미지를 선택해 주세요!</h4>

											<div id='att_zone'
												data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하세요'>
												<img src="${biz.filePath}"
													style="width: 80%; height: 60%; z-index: none; margin-left: 30px;"
													class="originalImage" />
											</div>
											<input type="hidden" name="changeImage" value="N"
												id="changeImage" /> <input type='file' id='btnAtt'
												name="profile" />
										</div>
										<br> <br />

										<h3>사업자 회원</h3>
										<h4>사업자 상표명</h4>
										<input type="text" class="form-control"
											placeholder="사업자 상표명을 입력해 주세요" name="bizBrandName"
											value="${biz.bizBrandName}" /> <br>
										<h4>대표 휴대폰 번호 (000-0000-0000)</h4>

										<input type="text" value="${biz.bizTel}" class="form-control"
											placeholder="휴대폰 번호를 입력해 주세요" name="bizTel"> <br />
										<div>
											<h4>사업자 등록증</h4>
											<!-- <input type='file' id='btnAtt' name="bizFile"
												onchange="onChangeBizFile()" /> <input type="hidden"
												name="changeBizFile" value="N" id="changeBizFile" />
												 -->
											<h5>사업자 등록증 변경은 관리자에게 문의하세요.</h5>
										</div>
									</div>
								</div>
							</div>
							<!-- 푸터 부분 -->
							<div class="panel-footer">
								<div class="row">
									<div class="col-md-6">
										<span class="panel-note"><i class="fa fa-clock-o"></i>
											회원 정보를 수정하시겠습니까?</span>
									</div>
									<div class="col-md-6 text-right">
										<input type="submit" class="btn btn-primary" value="회원 정보 수정" />
									</div>
								</div>
							</div>
						</div>
						<!-- END INPUTS -->
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
<!-- ajax -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>

let count = 0;
	
//파일 미리보기
( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
  imageView = function imageView(att_zone, btn){
	

    var attZone = document.getElementById(att_zone);
    var btnAtt = document.getElementById(btn)
    var sel_files = [];
    
    // 이미지와 체크 박스를 감싸고 있는 div 속성
    var div_style = 'display:inline-block;position:relative;'
                  + 'width:270px;height:170px;margin:5px;border:1px solid #00f;z-index:1';
    // 미리보기 이미지 속성
    var img_style = 'width:100%;height:100%;z-index:none';
    // 이미지안에 표시되는 체크박스의 속성
    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
  
    btnAtt.onchange = function(e){
    
    	// 원래 이미지 없애기
    	var changImage = document.querySelector("#changeImage");
    	var original = document.querySelector(".originalImage");

 
    	if(count == 0) {
        	original.style.display = 'none'; // 스타일 변경 예시
        	changeImage.value="Y"; // changeImage == Y 로 변경
    	}

       	count++;
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
        
        // 원래 이미지 제거
        while (attZone.firstChild) {
        	attZone.removeChild(attZone.firstChild);
        }
        
        console.log("이미지가 추가됩니다.");
        // 현재 이미지 추가
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

	function onChangeBizFile() {
	var changeBizFile = document.querySelector("#changeBizFile");
	changeBizFile.value="Y"; // changeImage == Y 로 변경
}

// 현재 패스워드 검사
function isPasswordRight() {
    var currentPassword = document.querySelector("#current-password");
    var passwordForm = document.querySelector("#change-password-form");

    $.ajax({
        type: "post",
        url: "/biz/account/password-check",
        data: JSON.stringify({ "password": currentPassword.value }), // 데이터를 객체로 전달
        headers : {"Content-Type" : "application/json"},
		dataType : "json",
	       success: function (res) {
	           alert("비밀번호 확인이 되셨습니다.");
	           passwordForm.style.display = "block";
	           currentPassword.readOnly = true;
	         },
        error: function(e) {
            alert("비밀번호가 틀렸습니다.");
        }
    });
}


	// 비밀번호 유효성 검사
	function changePasswordForm() {
		var changePassword = document.querySelector(".changePassword");
		var regexDescription = document.querySelector(".regexDescription");
		var password1 = document.querySelector("#password1");
		// 유효성 검사후 변경
		const passwordRegex = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!])(?=\S+$).{8,}$/;
		if(passwordRegex.test(password1.value)) {

			changePassword.style.display = "block";
			regexDescription.style.display = "none";
			password1.readOnly = true;
		} else {
			alert("유효하지 않습니다.")
		}
	}
	

	
	// 바꿀 비밀번호 체크
	function checkPasswordRight() {
		var password1 = document.querySelector("#password1");
		var password2 = document.querySelector(".password2");
		var isChangePassword = document.querySelector("#isChangePassword");
		
		if(password1.value == password2.value) {
			alert("유효합니다.")
			password2.readOnly=true;
			isChangePassword.value = 'Y';
		} else {
			alert("비밀번호가 틀렸습니다.")
		}
	}
</script>
<!-- adminside.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_footer.jsp"%>