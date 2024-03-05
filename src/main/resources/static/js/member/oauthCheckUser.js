/**
* 유효성 검사
*/
// 폼 데이터 검증 상태변수
let isHpOk = false;
let isZipOk = false;



// 데이터 검증에 사용하는 정규표현식
const reHp = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;



// 유효성 검사(Validation)
$(function() {
	
	// 주소 
	$('input[name=szip]').focusout(function() {
		$('.smsgZip').text('');
		isZipOk = false; // 공백은 유효하지 않은 별명임
	});
	// 휴대폰 검사
	$('input[name=suserHp]').focusout(function() {
		$('.smsgHp').text('');
		isHpOk = false; // 공백은 유효하지 않은 별명임
	});





	// 판매자 최종 확인
	$('button[name=socialRegister]').click(function() {

		if (!isZipOk) {
			alert('주소를 등록 하십시오.')
			return false // 폼 전송 취소
		}
		if (!isHpOk) {
			alert('휴대폰 번호를 확인하십시오.');
			return false;// 폼 전송 취소
		}


		return true; // 폼 전송 시작
	});

});

/**
 * 사용자 중복체크
 */
window.onload = function() {
	



	//주소 검증
	$('input[name=szip]').focusout(function() {
		const sZip = $(this).val();

		if (sZip.trim() === '') {
			$('.smsgZip').css('color', 'red').text('잘못된 입력 양식 입니다.');
			isZipOk = false;
			return;
		} else {
			$('.smsgZip').css('color', 'green').text('');
			isZipOk = true;
		}

	});

	// 휴대폰 중복체크
	$('input[name=suserHp]').focusout(function() {
		const hp = $(this).val();
		console.log('이체크 유저 맞아'+hp);
		if (!hp.match(reHp)) {
			$('.msgHp').css('color', 'red').text('휴대폰 번호가 유효하지 않습니다.');
			isHpOk = false;
			return;
		}
		console.log("유효성검사통과!");
		$.ajax({
			url: '/member/check/hp/' + hp,
			dataType: 'json',
			type: 'GET',
			contentType: 'application/json',
			success: function(data) {
				console.log(data);
				if (data > 0) {
					$('.msgHp').css('color', 'red').text('이미 사용중인 휴대폰 번호입니다.');
					isHpOk = false;
				} else {
					$('.msgHp').css('color', 'green').text('사용가능한 휴대폰 번호입니다.');
					isHpOk = true;
				}
			}
		});

	});
	



	


}; // onload end
