
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
						<form action="/biz/product/add-product" method="post"
							enctype="multipart/form-data">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">이곳에서 회원 정보를 수정하실 수 있습니다!</h3>
								</div>
								<div class="panel-body">

									<!-- 게시물의 제목 -->
									<div class="col-md-5">
										<h4>이름</h4>
										<input type="text" class="form-control"
											placeholder="이름을 입력해 주세요" name="userName" value="이름" /> <br>
										<h4>유저의 아이디</h4>
										<input type="text" class="form-control"
											placeholder="아이디를 입력해 주세요" name="userId" value="아이디"
											disabled="disabled" /> <br>
										<h4>비밀번호 변경</h4>
										<div class="input-group">
											<input type="text" value="비밀번호" class="form-control"
												placeholder="변경하실 비밀번호를 입력해 주세요"> <span
												class="input-group-btn"><button type="button"
													class="btn btn-primary" id="checkPassword">Go</button></span>
										</div>
										<br>
										<h4>비밀번호를 다시 한번 쳐주세요</h4>
										<div class="input-group">
											<input type="text" value="비밀번호" class="form-control"
												placeholder="변경하실 비밀번호를 다시 한번 더 쳐주세요"> <span
												class="input-group-btn"><button type="button"
													class="btn btn-primary">Go</button></span>
										</div>
										<br>
										<h4>휴대폰 번호</h4>
										<div class="input-group">
											<input type="text" value="번호" class="form-control"
												placeholder="휴대폰 번호를 입력해 주세요"> <span
												class="input-group-btn"><button type="button"
													class="btn btn-primary">Go</button></span>
										</div>
										<br />
										<h4>이메일</h4>
										<input type="text" class="form-control"
											placeholder="이메일을 입력해 주세요" name="userEmail" value="이메일" /> <br>
										<h4>주소</h4>
										<input type="text" class="form-control"
											placeholder="주소를 입력해 주세요" name="userAddress" value="주소" />

									</div>

									<!-- 게시물의 배너 이미지 -->
									<!-- 프로필 사진 -->
									<div id='image_preview' class="col-md-4">
										<div style="margin-bottom: 22px">
											<h4>프로필 사진</h4>

											<div id='att_zone'
												data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하세요!'></div>
											<input type='file' id='btnAtt' name="userProfile" />
										</div>
										<br> <br />
										<h3>사업자 회원</h3>
										<h4>사업자 상표명</h4>
										<input type="text" class="form-control"
											placeholder="게시물의 제목을 입력해 주세요" name="prodTitle" value="제목" />
										<br>
										<div>
											<h4>사업자 등록증</h4>
											<input type='file' id='btnAtt' name="bizFile" />
										</div>
									</div>
									<!-- 프로필 사진 -->
									<br>

								</div>
							</div>
							<!-- END INPUTS -->

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
	
// 파일 미리보기
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
        
        // 현재 이미지 삽입
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

	


</script>
<!-- adminside.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_footer.jsp"%>