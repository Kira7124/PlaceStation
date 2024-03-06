/**
* 유효성 검사
*/
// 폼 데이터 검증 상태변수
let isUidOk = false;
let isPassOk1 = false;
let isPassOk2 = false;
let isNameOk = false;
let isHpOk = false;
let isImpuid = false;
let isImpkey = false;
let isImpsecret = false;
let isFileOk = false;
let isAddressOk = false;


// 데이터 검증에 사용하는 정규표현식
const reUid = /^[a-z]+[a-z0-9]{4,19}$/g;
const rePass = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
const reName = /^[가-힣]{2,10}$/
const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const reHp = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;
const reImpuid = /^[0-9a-z-]{7,20}$/;     // /^[0-9]{9}$/;  숫자만
const reImpkey = /^[0-9a-z-]{20,60}$/;
const reImpsecret = /^[0-9a-z-]{20,60}$/;


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
			$('input[name=uppass]').val(pass2);
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
	$('input[name=userName]').focusout(function() {
		const name = $(this).val();
		if (name.match(reName)) {
			$('.msgName').text('');
			isNameOk = true;
		} else {
			$('.msgName').css('color', 'red').text('유효한 이름이 아닙니다.');
			isNameOk = false;
		}
	});

	
	

	// 이메일 검사
	$('input[name=email]').focusout(function() {
		$('.msgEmail').text('');
		isEmailOk = false; // 공백은 유효하지 않은 별명임
	});

	// 휴대폰 검사
	$('input[name=userHp]').focusout(function() {
		$('.msgHp').text('');
		isHpOk = false; // 공백은 유효하지 않은 별명임
	});
	// 
	$('input[name=impuid]').focusout(function() {
		$('.impuid').text('');
		isImpuid = false; // 공백은 유효하지 않은 별명임
	});
	// 
	$('input[name=impkey]').focusout(function() {
		$('.impkey').text('');
		isImpkey = false; // 공백은 유효하지 않은 별명임
	});
	// 
	$('input[name=impsecret]').focusout(function() {
		$('.impsecret').text('');
		isImpsecret = false; // 공백은 유효하지 않은 별명임
	});




	// 판매자 최종 확인
	$('button[name=sRegister]').click(function() {

	
	
	
		if (!isEmailOk) {
			alert('이메일을 확인하십시오.');
			return false;// 폼 전송 취소
		}
		if (!isHpOk) {
			alert('휴대폰 번호를 확인하십시오.');
			return false;// 폼 전송 취소
		}


		// 포트원 변수
		if (!isImpuid) {
			alert('포트원 아이디를 입력 하십시오.')
			return false // 폼 전송 취소
		}
		if (!isImpkey) {
			alert('포트원 키를 입력 하십시오.')
			return false // 폼 전송 취소
		}
		if (!isImpsecret) {
			alert('포트원 시크릿을 입력 하십시오.')
			return false // 폼 전송 취소
		}

		if (!isFileOk) {
			alert('사업자 등록증을 첨부 하십시오.')
			return false // 폼 전송 취소
		}

		return true; // 폼 전송 시작
	});

	// 일반유저 최종 확인
	$('button[name=uRegister]').click(function() {

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

		return true; // 폼 전송 시작
	});

	// 소셜유저 최종 확인
	$('button[name=socialRegister]').click(function() {

	

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
	$('input[name=userHp]').focusout(function() {
		const hp = $(this).val();
		console.log('설마 이체크 유저냐?'+hp);
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
	$('input[name=filePath]').change(function() {
		// 파일이 선택되었는지 여부 확인
		if ($(this).prop('files').length === 0) {      //property값 가져오고 
			console.log('파일이 선택되지 않았습니다.');
			$('.msgFile').css('color', 'red').text('사업자 등록증 파일을 등록하셔야 합니다.');
		} else {
			console.log('파일이 선택되었습니다.');
			$('.msgFile').css('color', 'red').text('사업자 등록증 첨부 완료');
		}
	});

	//포트원키 검증
	$('input[name=impuid]').focusout(function() {
		const impuid = $(this).val();

		if (!impuid.match(reImpuid)) {
			$('.msgUid').css('color', 'red').text('잘못된 입력 양식 입니다.');
			isImpuid = false;
			return;
		} else {
			$('.msgUid').css('color', 'green').text('');
			isImpuid = true;
			console.log('impuid '+ isImpuid)
		}

	});
	//포트원키 검증
	$('input[name=impsecret]').focusout(function() {
		const impsecret = $(this).val();

		if (!impsecret.match(reImpsecret)) {
			$('.msgSecret').css('color', 'red').text('잘못된 입력 양식 입니다.');
			isImpsecret = false;
			return;
		} else {
			$('.msgSecret').css('color', 'green').text('');
			isImpsecret = true;
			console.log('impsecret: '+ isImpsecret)
		}

	});


	//포트원키 검증
	$('input[name=impkey]').focusout(function() {
		const impkey = $(this).val();

		if (!impkey.match(reImpkey)) {
			$('.msgKey').css('color', 'red').text('잘못된 입력 양식 입니다.');
			isImpkey = false;
			return;
		} else {
			$('.msgKey').css('color', 'green').text('');
			isImpkey = true;
			console.log('impkey: '+ isImpkey)
		}

	});

	// 파일 입력 요소의 변경 이벤트 핸들러
	$('input[name=filePath]').change(function() {
		const fileInput = $(this)[0];
		const files = fileInput.files;

		// 파일 목록의 길이를 확인하여 파일이 선택되었는지 여부를 판단

		if(files.length < 0){
			isFileOk = false
		}else if(files.length > 0){
			isFileOk = true		
		}
		
	});
	
}; // onload end
