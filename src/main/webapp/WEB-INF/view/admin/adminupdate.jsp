<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     


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
				        <div class="input-box">
				            <input type="text" class="form-control" name = "userid" id="userid" placeholder="아이디입력">
				        </div>
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
				            <input type="text" class="form-control" name = "useraddress" id="useraddress" placeholder="주소">
				        </div>
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
				        <label for="name" class="form-label">사진업로드</label>
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


