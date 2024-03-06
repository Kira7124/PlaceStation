<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="/WEB-INF/view/layout/header.jsp" %>
<!-- terms content 시작 -->
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-8 col-sm-offset-2">
                <h4 class="font-alt mb-0">판매자 이용 약관</h4>
                <hr class="divider-w mt-10 mb-20">
                <div class="row multi-columns-row">
                  <div class="col-sm-6 col-md-6 col-lg-12">
                    <div class="form-group">
                      <textarea class="form-control" rows="8" readonly="readonly" id="message" name="message" placeholder="Your Message*" style="width: 100%;">
 
 
 
                      </textarea>
                      <div>판매자 이용 약관 동의 <input type="checkbox" id="check_terms1" style="float: left; margin-right: 1%;"></div>
                    </div>
                  </div>
                </div>

                <h4 class="font-alt mt-40 mb-0">14세 이상 이용자 약관 동의</h4>
                <hr class="divider-w mt-10 mb-20">
                <div class="row multi-columns-row mb-70">
                  <div class="col-sm-6 col-md-6 col-lg-12">
                    <textarea class="form-control" rows="8" readonly="readonly" id="message" name="message" placeholder="Your Message*" style="width: 100%;">
                      
                 
                 
                 
                    </textarea>
                    <div>14세 이상 약관 동의 <input type="checkbox" id="check_terms2" style="float: left; margin-right: 1%;"></div>
                  </div>
                </div>
              </div>
              <button type="submit" class="btn-round btn-b terms-btn" style="margin: auto; display: block;" onclick="checkForm()">다음 단계로</button>
              <br>
              <button type="submit" class="btn-round btn-b terms-btn" style="margin: auto; display: block; background-color: darkgrey; white-space: pre; color: #000;">  처음으로  </button>
            </div>
          </div>
        </section>
    <%@ include file ="/WEB-INF/view/member/layout/footer.jsp" %>