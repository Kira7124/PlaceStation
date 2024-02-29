<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>
.card-header1 h1 {
    font-size: 30px;
    font-weight: 600;
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
</div>
</nav>


<div class="main">
	<section class="module-small">
		<div class="container">
			<div class="row">
				<!-- aside bar 시작 -->
				<%@ include file="/WEB-INF/view/cs/cs_aside.jsp"%>
				<!-- aside bar 끝 -->
				<!-- 메인 시작 -->
				<div class="col-sm-8 col-sm-offset-1">
					<div class="post">
						<div class="comment-form">
							<h4 class="comment-form-title font-alt">1:1 문의</h4>

						</div>
						<div class="post-header font-alt"></div>

						<!-- 입력 폼 섹션 -->
						<section class="module">
							<div class="container">
								<div class="row">
									<div class="col-sm-8">
										<h4 class="font-alt mb-0">문의 내용을 작성해주세요.</h4>
										<hr class="divider-w mt-10 mb-20">
										<form action="/cs/qna/qna-post"  class="form" role="form" enctype="multipart/form-data" method="POST">
										<input type="hidden" name="categoryId" value="${categoryId}"/>
											<div class="form-group">
												<input class="form-control input-lg" type="text"
													placeholder="Large input" name="title"/>
											</div>
											<textarea class="" id="textarea"
												placeholder="Textarea" name="content"></textarea>
											<!-- 게시물의 배너 이미지 -->
											<div id='image_preview'>
												<h4>해당 게시물에 들어갈 배너 이미지를 선택해 주세요!</h4>
												<input type='file' id='btnAtt'
													name="file" />
												<div id='att_zone'
													data-placeholder='이미지가 나옵니다!'></div>
											</div>
											
											<div style="text-align: right;">
											   <input type="submit" class="btn btn-info btn-round" value="제출"/>&nbsp;
											   </div>
										</form>
									</div>
								</div>
							</div>
						</section>
						<!-- 입력 폼 섹션 종료 -->


						<div></div>
					</div>




				</div>
				<!-- 메인 끝 -->
			</div>
		</div>
	</section>
	
	

	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
	<script src="/assets/lib/jquery/dist/jquery.js"></script>
	<script src="/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="/assets/lib/wow/dist/wow.js"></script>
	<script src="/assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="/assets/lib/isotope/dist/isotope.pkgd.js"></script>
	<script src="/assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="/assets/lib/flexslider/jquery.flexslider.js"></script>
	<script src="/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="/assets/lib/smoothscroll.js"></script>
	<script src="/assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	<script
		src="/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="/assets/js/plugins.js"></script>
	<script src="/assets/js/main.js"></script>

	<script>
// Textarea 자동 줄 바꿈
const DEFAULT_HEIGHT = 30; // textarea 기본 height

const $textarea1 = document.querySelector('#textarea'); // textarea 1

// textarea 1
$textarea1.oninput = (event) => {
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
</script>
	</body>
	</html>