/**
* 유효성 검사
*/
// 폼 데이터 검증 상태변수
let isUidOk = false;
let isPassOk1 = false;
let isPassOk2 = false;
let isNameOk = false;
let isEmailOk = false;
let isHpOk = false;

// 데이터 검증에 사용하는 정규표현식
const reUid = /^[a-z]+[a-z0-9]{4,19}$/g;
const rePass = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
const reName = /^[가-힣]{2,10}$/
const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const reHp = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;

// 유효성 검사(Validation)
$(function() {

	// 아이디 검사
	$('input[name=userId]').keydown(function() {
		$('.msgId').text('');
		isUidOk = false;
	});

	// 비밀번호 검사
	// pass1과 pas2를 같게 만든 다음 pass1만 수정하면 넘어가는지 확인
	$('input[name=pass1]').focusout(function() {
		const pass1 = $('input[name=pass1]').val();
		console.log(pass1);
		const pass2 = $('input[name=userPassword]').val();
		console.log(pass2);
		if (pass1.match(rePass)) {
			$('.msgPass1').css('color', 'green').text('사용할 수 있는 비밀번호입니다.');
			if (pass2 != '' && pass1 != pass2) {
				$('.msgPass1').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
				isPassOk1 = false;
			} else {
				isPassOk1 = true;
			}
		} else {
			$('.msgPass1').css('color', 'red').text('사용할 수 없는 비밀번호입니다.');
			isPassOk1 = false;
		}
		console.log(isPassOk1);
		console.log(isPassOk2);
	});

	$('input[name=userPassword]').focusout(function() {
		const pass1 = $('input[name=pass1]').val();
		console.log(pass1);
		const pass2 = $('input[name=userPassword]').val();
		console.log(pass2);
		if (pass1 == pass2) {
			$('.msgPass1').text('');
			$('.msgPass2').css('color', 'green').text('비밀번호가 일치합니다.');
			isPassOk1 = true;
			isPassOk2 = true;
		} else {
			$('.msgPass2').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
			isPassOk2 = false;
		}
		console.log(isPassOk1);
		console.log(isPassOk2);
	});


	$('input[name=pass1]').keydown(function() {
		$('.msgPass1').text('');
		$('.msgPass2').text('');
		isPassOk1 = false; // 공백은 유효하지 않은 별명임
	});
	$('input[name=userPassword]').keydown(function() {
		$('.msgPass2').text('');
		isPassOk2 = false; // 공백은 유효하지 않은 별명임
	});

	// 이름 검사
	$('input[name=name]').focusout(function() {
		const name = $(this).val();
		if (name.match(reName)) {
			$('.msgName').text('');
			isNameOk = true;
		} else {
			$('.msgName').css('color', 'red').text('유효한 이름이 아닙니다.');
			isNameOk = false;
		}
	});
	// 담당자 이름 검사
	$('input[name=manager]').focusout(function() {
		const manager = $(this).val();
		if (manager.match(reName)) {
			$('.msgManager').text('');
			isNameOk = true;
		} else {
			$('.msgManager').css('color', 'red').text('유효한 이름이 아닙니다.');
			isNameOk = false;
		}
	});

	// 이메일 검사
	$('input[name=email]').keydown(function() {
		$('.msgEmail').text('');
		isEmailOk = false; // 공백은 유효하지 않은 별명임
	});

	// 휴대폰 검사
	$('input[name=hp]').keydown(function() {

		$('.msgHp').text('');
		isHpOk = false; // 공백은 유효하지 않은 별명임
	});
	// 담당자 휴대폰 검사
	$('input[name=managerHp]').keydown(function() {

		$('.msgManagerHp').text('');
		isHpOk = false; // 공백은 유효하지 않은 별명임
	});




	// 최종 확인
	$('button[name=register]').click(function() {

		// true면 전송, false면 전송 취소
		if (!isUidOk) {
			alert('아이디를 확인하십시오.');
			return false; // 폼 전송 취소
		}
		if (!isPassOk1 || !isPassOk2) {
			alert('비밀번호를 확인하십시오.');
			return false;// 폼 전송 취소
		}
		if (!isNameOk) {
			alert('이름을 확인하십시오.');
			return false;// 폼 전송 취소
		}
		if (!isEmailOk) {
			alert('이메일을 확인하십시오.');
			return false;// 폼 전송 취소
		}
		if (!isHpOk) {
			alert('휴대폰 번호를 확인하십시오.');
			return false;// 폼 전송 취소
		}
		if (!isFileOk) {
			alert('사업자 등록증을 첨부 하십시오.')
			return false // 폼 전송 취소
		}
		
		return true; // 폼 전송 시작
	});

});

/**
 * 사용자 중복체크
 */
window.onload = function() {
	// 아이디 중복체크
	const inputUid = document.getElementsByName('userId')[0];
	const msgId = document.getElementsByClassName('msgId')[0];


	if (inputUid != null) {
		inputUid.addEventListener("focusout", function() {
			const uid = inputUid.value;

			// 아이디 유효성 검증(중복 버튼을 눌렀을 때 서버로 보냄으로써 생기는 부하를 줄이기 위해 위치를 위로 올려준다.)
			if (!uid.match(reUid)) {
				msgId.innerText = '유효한 아이디가 아닙니다.';
				msgId.style.color = 'red';
				isUidOk = false;
				return;
			}

			// 서버 전송
			const xhr = new XMLHttpRequest();
			xhr.open('GET', '/member/check/uid/' + uid);
			xhr.send();

			xhr.onreadystatechange = function() {
				if (xhr.readyState == XMLHttpRequest.DONE) {
					if (xhr.status == 200) {
						console.log(xhr.response);
						console.log('아이디 중복체크 서버 전송 완료')
						const data = JSON.parse(xhr.response);
						if (data > 0) {
							console.log('아이디 중복체크 서버 전송 완료2')
							msgId.innerText = '이미 사용중인 아이디 입니다.';
							msgId.style.color = 'red';
							isUidOk = false;
						} else {
							console.log('아이디 중복체크 서버 전송 완료3')
							msgId.innerText = '사용가능한 아이디 입니다.';
							msgId.style.color = 'green';
							isUidOk = true;
						}
					}
				}// readyState end
			}//onreadystatechange end 
		});// btnCheckUidonclick end
	}

	// 휴대폰 중복체크
	$('input[name=hp]').focusout(function() {
		const hp = $(this).val();
		console.log(hp);
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
	// 담당자 휴대폰 중복체크
	$('input[name=managerHp]').focusout(function() {
		const managerHp = $(this).val();

		if (!managerHp.match(reHp)) {
			$('.msgManagerHp').css('color', 'red').text('휴대폰 번호가 유효하지 않습니다.');
			isHpOk = false;
			return;
		}
		const url = '/member/check/managerHp/' + managerHp;
		$.get(url, function(data) {
			console.log(data);
			if (data > 0) {
				$('.msgManagerHp').css('color', 'red').text('이미 사용중인 휴대폰 번호입니다.');
				isHpOk = false;
			} else {
				$('.msgManagerHp').css('color', 'green').text('사용가능한 휴대폰 번호입니다.');
				isHpOk = true;
			}
		});

	});

		// 사업자 등록증 유무
	
		// 파일 input 요소가 변경될 때마다 호출되는 함수
		$('input[name=file]').change(function() {
			// 파일이 선택되었는지 여부 확인
			if ($(this).prop('files').length === 0) {      //property값 가져오고 
				console.log('파일이 선택되지 않았습니다.');
				$('.msgFile').css('color', 'red').text('사업자 등록증 파일을 등록하셔야 합니다.');
			} else {
				console.log('파일이 선택되었습니다.');
				$('.msgFile').css('color', 'red').text('사업자 등록증 첨부 완료');
			}
		});





}; // onload end
