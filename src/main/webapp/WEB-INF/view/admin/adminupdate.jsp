<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>


	<script>
		function checkId(){
			const userid = document.getElementById("join-id").value;
			
			   if (userid.trim() === "") {
				   Swal.fire({
				        title: '빈칸입니다!',
				        icon: 'error',
				        text: '빈칸입니다! 입력해주세요.',
				    });	            
				   return;
		        }
			
			$.ajax({
				url:"/admin/checkID",
				type: "GET",
				data:{
					userid : userid
				},
				success: function(data){
					
					if(data === "duplicate"){
						 Swal.fire({
						        title: '아이디존재!',
						        icon: 'error',
						        text: '중복된아이디입니다! 다른 아이디를 입력해주세요.',
						    });	     
					}
					
					if(data === "not-duplicate"){
						 Swal.fire({
						        title: '사용사능한아이디!',
						        icon: 'success',
						        text: '사용가능한아이디입니다!',
						    });	     
					}
					
					
					
				},
				error: function(data){
					alert('에러가발생했습니다!');
				}
				
				
			});
			
		}
	</script>


	


	<form action="/admin/admin-update" method="post" enctype="multipart/form-data">
		<div class="card mb-3" style="max-width: 700px;">
		  <div class="row g-0">
		    <div class="col-md-4">
		      <img src="/adimg/users.png" style="width: 100px; height: 130px; margin-left: 30px; margin-top: 60px;" class="img-fluid rounded-start" alt="...">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h3 class="card-title">회원정보수정</h3>
		        <div class="row" style ="margin-top: 30px;">
		        	 <div class="col-md-3">
				        <label for="name" class="form-label">번호</label>
				     </div>
				    <div class="col-md-5">
				        <div class="input-box">
				            <input type="text" class="form-control" name ="userno" id="user_no_input" >
				        </div>
				    </div>
				  </div>
		 		  <div class="row" style ="margin-top: 30px;">
				    <div class="col-md-3">
				        <label for="name" class="form-label">아이디</label>
				    </div>
				    <div class="col-md-5">
					    <div class="input-group">
					        <input type="text" class="form-control" name="userid" id="join-id" placeholder="아이디입력">
					    </div>
					    <button type="button" class="btn btn-success" id="check-id" onclick="checkId()">중복확인</button>
					</div>
									    
   
				  </div>
				  <div class="row" style ="margin-top: 10px;">
				    <div class="col-md-3">
				        <label for="name" class="form-label">이름</label>
				    </div>
				    <div class="col-md-5">
				        <div class="input-box">
				            <input type="text" class="form-control" name = "username" id="username" placeholder="이름">
				        </div>
				    </div>
				</div>
				<div class="row" style ="margin-top: 10px;">
				    <div class="col-md-3">
				        <label for="email" class="form-label">이메일</label>
				    </div>
				    <div class="col-md-7">
				        <div class="input-box">
				            <input type="email" class="form-control" name = "useremail" id="useremail" placeholder="이메일">
				        </div>
				    </div>
				</div>
				<div class="row" style ="margin-top: 10px;">
				    <div class="col-md-3">
				        <label for="phone" class="form-label">전화번호</label>
				    </div>
				    <div class="col-md-7">
				        <div class="input-box">
				            <input type="tel" class="form-control" name = "userhp" id="userhp" placeholder="전화번호">
				        </div>
				    </div>
				</div>
				<div class="row" style ="margin-top: 10px;">
				    <div class="col-md-3">
				        <label for="phone" class="form-label">주소</label>
				    </div>
				    <div class="col-md-7">
				        <div class="input-box">
				            <input type="text" class="form-control" name ="zip" id="zip" placeholder="주소">
				            <input type="text" class="form-control" name ="addr1" id="addr1" placeholder="주소">
				            <input type="text" class="form-control" name ="addr2" id="addr2" placeholder="주소">
				            
				        </div>
				        <button type="button" class="btn btn-success" id="address"  onclick="zipcode()">주소확인</button>
				    </div>
				</div>
				<div class="row" style ="margin-top: 10px;">
				    <div class="col-md-3">
				        <label for="phone" class="form-label">등급</label>
				    </div>
				    <div class="col-md-4">
				        <div class="input-box">
				            <select class="form-control" name="grade" id="grade" aria-label="Default select example">
				                <option value="골드">골드</option>
				                <option value="실버">실버</option>
				                <option value="브론즈">브론즈</option>
				            </select>
				        </div>
				    </div>
				</div>
		 		
		 		
		 	  <div class="row" style ="margin-top: 10px;">
				    <div class="col-md-3">
				        <label for="name" class="form-label">사진수정</label>
				    </div>
				    <div class="col-md-5">
				        <div class="input-box">
						<input type='file' id='btnAtt' multiple='multiple' name="files">				        
				    </div>
				</div>
		      </div>
		 		
		 		
		 		
	
		      </div>
		    </div>
		  </div>
		  
		  <div class="row">
            <div class="col-md-12">
                <button type="submit" class="btn btn-success" id="updateButton" style="margin-left:450px; margin-bottom: 10px; margin-top:10px;">수정하기</button>
            </div>
          </div>
		  
		  
		   
		</div>
		
	</form>	

<script type="text/javascript" src="/js/member/zipcode.js"></script>
