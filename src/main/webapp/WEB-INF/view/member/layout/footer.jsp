<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <div class="module-small bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">About Titan</h5>
                  <p>The languages only differ in their grammar, their pronunciation and their most common words.</p>
                  <p>Phone: +1 234 567 89 10</p>Fax: +1 234 567 89 10
                  <p>Email:<a href="#">somecompany@example.com</a></p>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Recent Comments</h5>
                  <ul class="icon-list">
                    <li>Maria on <a href="#">Designer Desk Essentials</a></li>
                    <li>John on <a href="#">Realistic Business Card Mockup</a></li>
                    <li>Andy on <a href="#">Eco bag Mockup</a></li>
                    <li>Jack on <a href="#">Bottle Mockup</a></li>
                    <li>Mark on <a href="#">Our trip to the Alps</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Blog Categories</h5>
                  <ul class="icon-list">
                    <li><a href="#">Photography - 7</a></li>
                    <li><a href="#">Web Design - 3</a></li>
                    <li><a href="#">Illustration - 12</a></li>
                    <li><a href="#">Marketing - 1</a></li>
                    <li><a href="#">Wordpress - 16</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Popular Posts</h5>
                  <ul class="widget-posts">
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="/assets/img/rp-1.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Designer Desk Essentials</a></div>
                        <div class="widget-posts-meta">23 january</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="/assets/img/rp-2.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Realistic Business Card Mockup</a></div>
                        <div class="widget-posts-meta">15 February</div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <hr class="divider-d">
        <footer class="footer bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-6">
                <p class="copyright font-alt">&copy; 2017&nbsp;<a href="index.html">TitaN</a>, All Rights Reserved</p>
              </div>
              <div class="col-sm-6">
                <div class="footer-social-links"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a>
                </div>
              </div>
            </div>
          </div>
        </footer>
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
                <!--  
    JavaScripts
    =============================================
    -->
    <script>

      function checkForm() {
            var checkbox1 = document.getElementById("check_terms1");
            var checkbox2 = document.getElementById("check_terms2");

            if (checkbox1.checked && checkbox2.checked) {
                // 모든 약관이 체크되었을 때 submit 버튼을 눌러 다음 화면으로 이동
                // 여기에 submit 버튼을 눌렀을 때의 동작을 추가
                // 예: document.getElementById("myForm").submit();
                alert("약관에 모두 동의하셨습니다. 다음 화면으로 이동합니다.");
            } else {
                // 체크되지 않은 약관명을 출력하여 사용자에게 안내
                var errorMessage = "약관에 동의해야 합니다";
                if (!checkbox1.checked) {
                  errorMessage += "\n- 일반 회원";
                }
                if (!checkbox2.checked) {
                  errorMessage += "\n- 14세 이상 이용자";
                }
                alert(errorMessage);
            }
        }

      </script>
    <script src="/assets/lib/jquery/dist/jquery.js"></script>
    <script src="/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/assets/lib/wow/dist/wow.js"></script>
    <script src="/assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="/assets/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="/assets/lib/imgloaded/imgloaded.pkgd.js"></script>
    <script src="/assets/lib/flexslider/jquery.flexslider.js"></script>
    <script src="/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="/assets/lib/smoothscroll.js"></script>
    <script src="/assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="/assets/js/plugins.js"></script>
    <script src="/assets/js/main.js"></script>
  </body>
</html>