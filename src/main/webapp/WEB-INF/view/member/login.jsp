<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file ="/WEB-INF/view/layout/header.jsp" %>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
     <!-- login content 시작 -->
      <!--로그인 섹션 시작-->
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-5 col-sm-offset-1 mb-sm-40" id="login" style="margin-left: 33%;">
                <h4 class="font-alt">Login</h4>
                <hr class="divider-w mb-10">
                <form class="form" action="/loginProc" method="post">
                  <div class="form-group">
                    <input class="form-control" id="username" type="text" name="RuserId" placeholder="Username"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="password" type="password" name="userPassword" placeholder="Password"/>
                  </div>
                  <div class="form-group">
                    <button class="btn-round btn-b login-btn" type="submit">Login </button>
                    <div style="float: right;">
                    <a class="social_btn" href="/oauth2/authorization/naver"
                    style="height: 38px !important;
                    width: 47px !important;
                    background-color: white !important; 
                    border: none !important;">
                      <img src="/assets/img/social_login/btnG_icon_square.png" class="social_btn" style="max-height: 39px">
                    </a>
                    <a  class="social_btn" href="/oauth2/authorization/kakao"
                    style="height: 38px !important;
                    width: 47px !important;
                    background-color: white !important; 
                    border: none !important;" >
                      <img src="/assets/img/social_login/Asset 1.png" class="social_btn" style="max-height: 39px">
                    </a>
                    <a class="social_btn" href="/oauth2/authorization/google"
                    style="height: 38px !important;
                    width: 47px !important;
                    background-color: white !important; 
                    border: none !important;">
                      <img src="/assets/img/social_login/web_light_sq_na@2x.png" class="social_btn" style="max-height: 39px">
                    </a>
                  </div>
                  </div>
                  <div class="form-group" style="position: absolute; width: 93%;">
                    <a href="" style="font-weight: 600;">Forgot Password?</a> 
                    <a href="/user/uterms" style="float: right; font-weight: 600; position: relative; padding-left: 5%;">User Register</a>
                    <a href="/user/sterms" style="float: right; font-weight: 600; position: relative;">Seller Regist</a>
                    </div>
                  <div class="form-group"></div>
                </form>
              </div>
            </div>
          </div>
        </section>
      <!--로그인 섹션 끝-->
  <%@ include file ="/WEB-INF/view/layout/footer.jsp" %>