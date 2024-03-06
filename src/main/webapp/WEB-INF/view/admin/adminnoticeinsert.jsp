<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<script>
	    function updateTitle() {
	         var postTypeSelect = document.getElementById("postType");
	         var titleInput = document.getElementById("join-id");
	
	         var selectedOptionText = "[" + postTypeSelect.options[postTypeSelect.selectedIndex].text + "]";
	
	         // 글제목 입력란에 설정
	         titleInput.value = selectedOptionText;
	     }
	</script>




    
	<form action="/admin/admin-noticeinsert" method="post">
		<div class="card mb-3" style="max-width: 700px;">
		  <div class="row g-0">
		    <div class="col-md-4">
		      <img src="/adimg/users.png" style="width: 100px; height: 130px; margin-left: 30px; margin-top: 60px;" class="img-fluid rounded-start" alt="...">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h3 class="card-title">글등록하기</h3>
		        	
		       <div class="row" style="margin-top: 30px; margin-left:3px; display: flex; align-items: center;">
				    <label for="postType" class="form-label" style="margin-right: 10px;">게시글 종류</label>
				    <div class="input-box">
				        <select name="postType" id="postType" onchange="updateTitle()">
				            <option value="normal">일반</option>
				            <option value="notice">공지</option>
				            <option value="alert">알림</option>
				        </select>
				    </div>    
				</div>	
		        	
		 		  <div class="row" style ="margin-top: 30px;">
		        	 <div class="col-md-3">
				        <label for="name" class="form-label">글제목</label>
				     </div>
				     
				    <div class="col-md-5">
				        <div class="input-box">
				            <input type="text" class="form-control" name ="ntitle" id="join-id" placeholder="글제목" >
				        </div>
				    </div>
				  </div>
				  	
				  
				  
				  <div class="row" style ="margin-top: 10px;">
				    <div class="col-md-3">
				        <label for="name" class="form-label">글쓴이</label>
				    </div>
				    <div class="col-md-5">
				        <div class="input-box">
				            <input type="text" class="form-control" id="userpassword" name="nwriter" placeholder="글쓴이">
				        </div>
				    </div>
				</div>
				
				
				  <div class="row" style ="margin-top: 10px;">
				    <div class="col-md-3">
				        <label for="name" class="form-label">내용작성</label>
				    </div>
				    <div class="col-md-10">
				        <div class="input-box">
     					   <textarea class="form-control" id="userpassword" name="ncontent" placeholder="내용작성" cols="5" rows="7"></textarea>
				        </div>
				    </div>
				</div>
				
		      </div>
		    </div>
		  </div>
		  
		  <div class="row">
            <div class="col-md-12">
                <button type="submit" class="btn btn-info" id="noticeInsertButton" style="margin-left:450px; margin-bottom: 10px; margin-top:10px;">글등록하기</button>
            </div>
          </div>
		  
		  
		   
		</div>
		
	</form>	
    