<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     





	<form action="/admin/admin-bannerinsert" method="post" enctype="multipart/form-data">
		<div class="card mb-3" style="max-width: 700px;">
		  <div class="row g-0">
		    <div class="col-md-4">
		      <img src="/adimg/users.png" style="width: 100px; height: 130px; margin-left: 30px; margin-top: 60px;" class="img-fluid rounded-start" alt="...">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h3 class="card-title">배너등록</h3>
		       
		 		  <div class="row" style ="margin-top: 30px;">
				    <div class="col-md-3">
				        <label for="name" class="form-label">배너명</label>
				    </div>
				    <div class="col-md-5">
				        <div class="input-box">
				            <input type="text" class="form-control" name = "banname" id=banname" placeholder="배너명입력">
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
		  
		  <div class="row">
            <div class="col-md-12">
                <button type="submit" class="btn btn-info" id="insertButton" style="margin-left:450px; margin-bottom: 10px; margin-top:10px;">등록하기</button>
            </div>
          </div>
		  
		  
		   
		</div>
		
	</form>	


    