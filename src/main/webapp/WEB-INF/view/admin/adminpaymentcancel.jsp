<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     

<script type="text/javascript" src="/js/admin/refund.js"></script>





	<form action="/admin/admin-paymentcancel" method="post">
		<div class="card mb-3" style="max-width: 700px;">
		  <div class="row g-0">
		    <div class="col-md-4">
		      <img src="/adimg/users.png" style="width: 100px; height: 130px; margin-left: 30px; margin-top: 60px;" class="img-fluid rounded-start" alt="...">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h3 class="card-title">환불처리</h3>

		        
		        <div class="row" style ="margin-top: 30px;">
		        	 <div class="col-md-3">
				        <label for="name" class="form-label">상품번호</label>
				     </div>
				    <div class="col-md-5">
				        <div class="input-box">
				            <input type="text" class="form-control" name ="adminHisProdNo" id="user_no_input" >
				        </div>
				    </div>
				  </div>
					
					
					
				<div class="row" style ="margin-top: 30px;">
				    <div class="col-md-3">
				        <label for="name" class="form-label">
				         사업자<br>
				         회원번호
				         </label>
				    </div>
				    <div class="col-md-5">
				        <div class="input-box">
				            <input type="text" class="form-control" name = "bizId" >
				        </div>
				    </div>
				  </div>	
					
					
					
				  
		 		  <div class="row" style ="margin-top: 30px;">
				    <div class="col-md-3">
				        <label for="name" class="form-label">환불금액</label>
				    </div>
				    <div class="col-md-5">
				        <div class="input-box">
				            <input type="text" class="form-control" id="user_price_input" name = "cancelAmount" >
				        </div>
				    </div>
				  </div>
				  
				  

				  
				  <div class="row" style ="margin-top: 30px;">
				    <div class="col-md-3">
				    </div>
				    <div class="col-md-5">
				        <div class="input-box">
				            <input type="hidden" class="form-control" name = "cancelYn"  value="Y">
				        </div>
				    </div>
				  </div>
				  
					
				 




		      </div>
		    </div>
		  </div>
	 </div>	
				
				
		  
		  <div class="row">
            <div class="col-md-12">
                <button type="submit" class="btn btn-info" id="cancelButton" style="margin-left:450px; margin-bottom: 10px; margin-top:10px;">환불하기</button>
            </div>
          </div>

		

	</form>	

		  
		  


    
    
    
    
