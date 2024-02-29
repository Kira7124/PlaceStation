/**
 * 유효성 검사
 */
// 폼 데이터 검증 상태변수
	let isUidOk 		= false;
	let isPassOk1 	= false;
	let isPassOk2 	= false;
	let isNameOk 	= false;
	let isEmailOk 	= false;
	let isHpOk 		= false;
	
	// 데이터 검증에 사용하는 정규표현식
	const reUid   = /^[a-z]+[a-z0-9]{4,19}$/g;
	const rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
	const reName  = /^[가-힣]{2,10}$/ 
	const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	const reHp    = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;

	// 유효성 검사(Validation)
	$(function(){
		
		// 아이디 검사
		$('input[name=uid]').keydown(function(){
			$('.msgId').text('');
			isUidOk = false;
		});
		
		// 비밀번호 검사
		// pass1과 pas2를 같게 만든 다음 pass1만 수정하면 넘어가는지 확인
		$('input[name=pass1]').focusout(function(){
			const pass1 = $('input[name=pass1]').val();
			console.log(pass1);
			const pass2 = $('input[name=pass2]').val();
			console.log(pass2);
			if(pass1.match(rePass)) {
				$('.msgPass1').css('color', 'green').text('사용할 수 있는 비밀번호입니다.');
				if(pass2 != '' && pass1 != pass2){
					$('.msgPass1').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
					isPassOk1 = false;
				}else {
					isPassOk1 = true;
				}
			}else {
				$('.msgPass1').css('color', 'red').text('사용할 수 없는 비밀번호입니다.');
				isPassOk1 = false;
			}
			console.log(isPassOk1);
			console.log(isPassOk2);
		});

		$('input[name=pass2]').focusout(function(){
			const pass1 = $('input[name=pass1]').val();
			console.log(pass1);
			const pass2 = $('input[name=pass2]').val();
			console.log(pass2);
				if(pass1 == pass2){
					$('.msgPass1').text('');
					$('.msgPass2').css('color', 'green').text('비밀번호가 일치합니다.');
					isPassOk1 = true;
					isPassOk2 = true;
				}else {
					$('.msgPass2').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
					isPassOk2 = false;
				}
			console.log(isPassOk1);
			console.log(isPassOk2);
		});


		$('input[name=pass1]').keydown(function(){
			$('.msgPass1').text('');
			$('.msgPass2').text('');
			isPassOk1 = false; // 공백은 유효하지 않은 별명임
		});
		$('input[name=pass2]').keydown(function(){
			$('.msgPass2').text('');
			isPassOk2 = false; // 공백은 유효하지 않은 별명임
		});

		// 이름 검사
		$('input[name=name]').focusout(function(){
			const name = $(this).val();
			if(name.match(reName)){
				$('.msgName').text('');
				isNameOk = true;
			}else{
				$('.msgName').css('color', 'red').text('유효한 이름이 아닙니다.');
				isNameOk = false;
			}
		});
		// 담당자 이름 검사
		$('input[name=manager]').focusout(function(){
			const manager = $(this).val();
			if(manager.match(reName)){
				$('.msgManager').text('');
				isNameOk = true;
			}else{
				$('.msgManager').css('color', 'red').text('유효한 이름이 아닙니다.');
				isNameOk = false;
			}
		});
		
		// 이메일 검사
		$('input[name=email]').keydown(function(){
			$('.msgEmail').text('');
			isEmailOk = false; // 공백은 유효하지 않은 별명임
		});	
		
		// 휴대폰 검사
		$('input[name=hp]').keydown(function(){
			
			$('.msgHp').text('');
			isHpOk = false; // 공백은 유효하지 않은 별명임
		});		
		// 담당자 휴대폰 검사
		$('input[name=managerHp]').keydown(function(){

			$('.msgManagerHp').text('');
			isHpOk = false; // 공백은 유효하지 않은 별명임
		});

		// 최종 확인
		$('#registerForm').submit(function(){

			// true면 전송, false면 전송 취소
			if(!isUidOk) {
				alert('아이디를 확인하십시오.');
				return false; // 폼 전송 취소
			}
			if(!isPassOk1 || !isPassOk2) {
				alert('비밀번호를 확인하십시오.');
				return false;// 폼 전송 취소
			}
			if(!isNameOk) {
				alert('이름을 확인하십시오.');
				return false;// 폼 전송 취소
			}
			if(!isEmailOk) {
				alert('이메일을 확인하십시오.');
				return false;// 폼 전송 취소
			}
			if(!isHpOk) {
				alert('휴대폰 번호를 확인하십시오.');
				return false;// 폼 전송 취소
			}

			return true; // 폼 전송 시작
		});

	});