<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/view/member/layout/header.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

    <!-- mypage content 시작 -->

      <!--  프로필 content 시작  -->
      <section class="module" style="
        align-items: center;
        align-content: space-between;
        flex-wrap: nowrap;
        flex-direction: row-reverse;
        justify-content: flex-start;
    ">
        <div class="container rounded bg-white mt-5 mb-5" style="
        display: flex;
        align-content: space-between;
        flex-wrap: wrap;
        flex-direction: row;
        align-items: baseline;
    ">
          <div class="row" style="
        flex-direction: column;
    ">

            <div class="col-md-10 border-right" style="
        display: flex;
        justify-content: space-between;
    ">
              <div class="col-md-2 border-right" style="
                      margin-top: 5%;
                      display: inline-block;
                      width: 250px;
                  ">
                <div>
                  <div class="d-flex flex-column align-items-center text-center p-3 py-5" style="
        position: relative;
    "><img class="rounded-circle mt-5" width="150px"
                      src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                    <span class="font-weight-bold"
                      style="border: solid 2px #a1a1a1 ; border-radius: 10px; width: 100px; height: 30px; display: inline-block;">
                      change photo</span>
                  </div>
                </div>
                <br>
                <br>
                <div style="width: 100%;">
                  <ul class="list-group" style="text-align: center ;">
                    <li class="list-group-item disabled" aria-disabled="true"><a href="/Titan-master/faq.html">결제내역 A disabled item</a></li>
                    <li class="list-group-item"><a href="/Titan-master/faq.html">찜목록 A second item</a></li>
                    <li class="list-group-item"><a href="/Titan-master/faq.html">문의 내역 A third item</a></li>
                    <li class="list-group-item"><a href="/Titan-master/faq.html">내정보 변경 A fourth item</a></li>
                  </ul>
                </div>
              </div>

              <div class="col-md-8 border-right" style="
        margin-top: 0%;
        /* display: inline-block; */
        /* float: right; */
    ">
                <div class="p-3 py-5">
                  <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-center" style="font-size: xx-large;">Profile Settings</h4>
                    <h4><c:out value= "${id}"/>ssssssssss</h4>
                    <p>principal : <sec:authentication property="principal" /></p>
                  </div>
                  <br>
                  <br>
                  <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">Name</label><input type="text" class="form-control"
                        placeholder="first name" value="" readonly></div>
                    <div class="col-md-6"><label class="labels">password</label><input type="text" class="form-control"
                        value="" placeholder="surname" readonly></div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Email</label><input type="text"
                        class="form-control" placeholder="enter phone number" value=""></div>
                    <div class="col-md-12"><label class="labels">Address Line 1</label><input type="text"
                        class="form-control" placeholder="enter address line 1" value=""></div>
                    <div class="col-md-12"><label class="labels">Address Line 2</label><input type="text"
                        class="form-control" placeholder="enter address line 2" value=""></div>
                    <div class="col-md-12"><label class="labels">gender</label><input type="text" class="form-control"
                        placeholder="enter address line 2" value="" readonly></div>
                    <div class="col-md-12"><label class="labels">hp</label><input type="text" class="form-control"
                        placeholder="enter address line 2" value=""></div>
                    <div class="col-md-12"><label class="labels">Education</label><input type="text"
                        class="form-control" placeholder="education" value=""></div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-md-6"><label class="labels">Country</label><input type="text" class="form-control"
                        placeholder="country" value=""></div>
                    <div class="col-md-6"><label class="labels">State/Region</label><input type="text"
                        class="form-control" value="" placeholder="state"></div>
                  </div>
                  <br>
                  <br>
                  <br>
                  <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="button">Save
                      Profile</button></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!--  프로필 content 끝 -->
    </div>
    </div>
    <%@ include file ="/WEB-INF/view/member/layout/footer.jsp" %>