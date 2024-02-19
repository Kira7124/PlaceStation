<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
</head>

<body>


	<form action="/admin/admin-delete" method="post">
		<div class="card mb-3" style="max-width: 700px;">
		  <div class="row g-0">
		    <div class="col-md-4">
		      <img src="/adimg/users.png" style="width: 100px; height: 130px; margin-left: 30px; margin-top: 60px;" class="img-fluid rounded-start" alt="...">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h3 class="card-title">회원탈퇴처리</h3>
		 		  <div class="row" style ="margin-top: 30px;">
				    <div class="col-md-3">
				        <label for="name" class="form-label">아이디</label>
				    </div>
				    <div class="col-md-5">
				        <div class="input-box">
				            <input type="text" class="form-control" id="name" placeholder="아이디입력">
				        </div>
				    </div>
				  </div>
				  <div class="row" style ="margin-top: 10px;">
				    <div class="col-md-3">
				        <label for="name" class="form-label">이름</label>
				    </div>
				    <div class="col-md-5">
				        <div class="input-box">
				            <input type="text" class="form-control" id="name" placeholder="이름">
				        </div>
				    </div>
				</div>
				<div class="row" style ="margin-top: 10px;">
				    <div class="col-md-3">
				        <label for="email" class="form-label">이메일</label>
				    </div>
				    <div class="col-md-7">
				        <div class="input-box">
				            <input type="email" class="form-control" id="email" placeholder="이메일">
				        </div>
				    </div>
				</div>
				<div class="row" style ="margin-top: 10px;">
				    <div class="col-md-3">
				        <label for="phone" class="form-label">전화번호</label>
				    </div>
				    <div class="col-md-7">
				        <div class="input-box">
				            <input type="tel" class="form-control" id="phone" placeholder="전화번호">
				        </div>
				    </div>
				</div>
				<div class="row" style ="margin-top: 10px;">
				    <div class="col-md-3">
				        <label for="phone" class="form-label">주소</label>
				    </div>
				    <div class="col-md-7">
				        <div class="input-box">
				            <input type="text" class="form-control" id="phone" placeholder="주소">
				        </div>
				    </div>
				</div>
				<div class="row" style ="margin-top: 10px;">
				    <div class="col-md-3">
				        <label for="phone" class="form-label">등급</label>
				    </div>
				    <div class="col-md-4">
				        <div class="input-box">
				            <input type="text" class="form-control" id="phone" placeholder="회원등급">
				        </div>
				    </div>
				</div>
		 		
		 		
	
		      </div>
		    </div>
		  </div>
		  
		  <div class="row">
            <div class="col-md-12">
                <button type="submit" class="btn btn-danger" id="deleteButton" style="margin-left:450px; margin-bottom: 10px; margin-top:10px;">탈퇴처리</button>
            </div>
          </div>
		  
		  
		   
		</div>
		
	</form>	





</body>
</html>