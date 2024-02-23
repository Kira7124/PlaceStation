<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="/WEB-INF/view/member/layout/header.jsp" %>
    <style>
      @import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');

  
      /* 로그인폼 스타일 */

      * {
          box-sizing: border-box;
      }


   
      h2 {
          text-align: center;
          margin: 0 0 20px;
      }
      
      .sbody{
        display: block;
      }

      .form {
          padding: 30px 40px;
      }

      .register-form {
          margin-bottom: 10px;
          padding-bottom: 20px;
          position: relative;
      }

      .register-form label {
          color: #777;
          display: block;
      }

      .register-form input {
          border: 2px solid #f0f0f0;
          border-radius: 4px;
          display: block;
          width: 100%;
          padding: 10px;
          font-size: 14px;
      }

      .register-form input:focus {
          outline: 0;
          border-color: #777;
      }

      .register-form.success input {
          border-color: var(--success-color);
      }

      .register-form.error input {
          border-color: var(--error-color);
      }

      .register-form small {
          color: var(--error-color);
          position: absolute;
          bottom: 0;
          left: 0;
          visibility: hidden;
      }

      .register-form.error small {
          visibility: visible;
      }


      /* 라디오 버튼 */

      .form_radio_btn {
			width: 47%;
			height : 45px;
    		border: 1px solid #EAE7E7;
    		border-radius: 10px;
        float: left;
		}
		.form_radio_btn input[type=radio] {
			display: none;
		}
		.form_radio_btn label {
			display: block;
    		border-radius: 10px;
   			margin: 0 auto;
    		text-align: center;
    		height: -webkit-fill-available;
    		line-height: 45px;
		}
		 
		/* Checked */
		.form_radio_btn input[type=radio]:checked + label {
			background: #777;
			color: #fff;
		}
		 
		/* Hover */
		.form_radio_btn label:hover {
			color: #666;
		}
		 
		/* Disabled */
		.form_radio_btn input[type=radio] + label {
			background: #F9FAFC;
			color: #666;
		}


/* 
      .form button {
          cursor: pointer;
          background-color: #3498db;
          border: 2px solid #3498db;
          border-radius: 4px;
          color: #fff;
          display: block;
          font-size: 16px;
          padding: 10px;
          margin-top: 20px;
          width: 100%;
      } */
</style>
     <!-- register content 시작 -->
        <!--   회원가입 폼 시작 -->
        <section class="module">
        <div class="container" style="background: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        width: 550px;">
          <form action="" id="form" class="form">
              <h2>Register With Us</h2>
                  <h4><c:out value= "${id}"/>sss</h4>
              <div class="register-form" style="margin-bottom: 10px;">
                  <label for="id">id</label>
                  <input type="text" id="id" placeholder="Enter id">
                  <small>Error message</small>
              </div>
              <div class="register-form">
                  <label for="password">Password</label>
                  <input type="password" id="password" placeholder="Enter password">
                  <small>Error message</small>
              </div>
              <div class="register-form">
                  <label for="password">Confirm Password</label>
                  <input type="password" id="password2" placeholder="Enter password again">
                  <small>Error message</small>
              </div>
              <div class="register-form">
                <label for="email">Email</label>
                <input type="text" id="email" placeholder="Enter email">
                <small>Error message</small>
              </div>
              <div class="register-form">
                  <label for="name">name</label>
                  <input type="text" id="name" placeholder="Enter name">
                  <small>Error message</small>
              </div>
              <div class="register-form">
                  <label for="hp">hp</label>
                  <input type="text" id="hp" placeholder="Enter hp">
                  <small>Error message</small>
              </div>
              <div class="register-form">
                <div class="mb-3">
                  <label for="userSex" class="form-label">성별</label>
                  <div class="form_toggle row-vh d-flex flex-row justify-content-between" >
                    <div class="form_radio_btn radio_male">
                      <input id="radio-1" type="radio" name="userSex" value="male" checked>
                      <label for="radio-1">남자</label>
                    </div>
                                   
                    <div class="form_radio_btn">
                      <input id="radio-2" type="radio" name="userSex" value="female">
                      <label for="radio-2">여자</label>
                    </div>
                  </div>
                </div>
            </div>
              <br>
              <br>
              <div class="input-group mb-3">
                <label for="name">사업자 등록증</label>
                <input type="file" class="form-control" id="inputGroupFile02" style="width: 123%;">
                <label class="input-group-text" for="inputGroupFile02"></label>
              </div>
              <br>
              <br>
              <button class="terms-btn" style="margin: auto; display: block; color: white;">가입 하기</button>
          </form>
        </div>
      </section>
        <!-- 회원가입 폼 종료 -->
    <%@ include file ="/WEB-INF/view/member/layout/footer.jsp" %>