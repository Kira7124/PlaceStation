/**
 * 이메일 인증
 */
$(function() {
	// 이메일 입력방식 선택
	$('#selectEmail').change(function() {
		var selectedOption = $("#selectEmail option:selected").val();

		if (selectedOption === '1') { // 직접입력일 경우
			$("#lo_email2").attr("placeholder", '도메인 입력');
			$("#lo_email2").prop("disabled", false).val('');
		} else { // 직접입력이 아닐 경우
			$("#lo_email2").attr("placeholder", selectedOption);
			$("#lo_email2").prop("disabled", true).val(selectedOption);
		}
	});

	let preventDoubleClick = false;

	$('#btnEmailCode').click(function(event) {
	
		 event.preventDefault();
		//const name = $('input[name=name]').val();
		//const uid = $('input[name=uid]').val();
		const email = $('#lo_email1').val() + "@" + $('#lo_email2').val();

		console.log("프리벤트 아래!!!!!")

		const jsonData = {
			
			"email": email
		};


console.log("프리벤트 아래!!!!!22222")

		if (preventDoubleClick) {
			return;
		}
		preventDoubleClick = true;
		$('.msgEmail').css('color', 'black').text('잠시만 기다리세요...');
		$('.resultEmailForId').css('color', 'black').text('잠시만 기다리세요...');
		$('.resultEmailForPass').css('color', 'black').text('잠시만 기다리세요...');

		setTimeout(function() {
			if (!email.match(reEmail)) {
				$('.msgEmail').css('color', 'red').text('이메일이 유효하지 않습니다.');
				isEmailOk = false;
				preventDoubleClick = false;
				return;
			} else {
				console.log("프리벤트 아래!!!!!33333333333")
				$.ajax({
					url: '/user/email/authEmail',
					type: 'post',
					data: JSON.stringify(jsonData),
					dataType: 'json',
					contentType: 'application/json',
					success: function(data) {
						console.log("result : " + data.result);
						console.log("data : " + data);
						console.log("status : " + data.status);
						console.log("status : " + data.email);
						// status 만 1 이 떠야 이메일 확인후 코드를 입력하세요가 뜸 그래야 코드 입력하지 ㅡㅡ
						if (data.result > 0) {
							$('.msgEmail').css('color', 'red').text('이미 사용중인 이메일입니다.');
							isEmaileOk = false;
								
								console.log("프리벤트 아래!!!!!4444444444")
								
							if (data.status < 0) {
								$('.resultEmailForId').css('color', 'green').text('이메일을 확인 후 인증코드를 입력하세요.');
								$('.resultEmailForPass').css('color', 'green').text('이메일을 확인 후 인증코드를 입력하세요.');
								$('input[name=auth]').prop('disabled', false);
								
								
								console.log("프리벤트 아래!!!!!5555555555")
								
							} else {
								
								console.log("프리벤트 아래!!!!!66666666666")
								
								$('.resultEmailForId').css('color', 'red').text('이메일 인증코드 전송이 실패했습니다. 잠시후 다시 시도하십시오.');
								$('.resultEmailForPass').css('color', 'red').text('이메일 인증코드 전송이 실패했습니다. 잠시후 다시 시도하십시오.');

							}

						} else {
							console.log("프리벤트 아래!!!!!77777777777")
							if (data.status > 0) {
								$('.msgEmail').css('color', 'green').text('이메일을 확인 후 인증코드를 입력하세요.');
								$('.auth').show();
								$('input[name=email]').attr('readonly', true);
								console.log("프리벤트 아래!!!!!888888888888")
							} else {
								$('.msgEmail').css('color', 'red').text('이메일 인증코드 전송이 실패했습니다. 잠시후 다시 시도하십시오.');
								$('.resultEmailForId').css('color', 'red').text('해당하는 사용자, 이메일이 일치하지 않습니다.');
								$('.resultEmailForPass').css('color', 'red').text('해당하는 아이디, 이메일이 일치하지 않습니다.');
								console.log("프리벤트 아래!!!!!99999999999999999")
							}
						}
						preventDoubleClick = false;
					}

				});

			}

		}, 1000);
	});
	$('#btnEmailAuth').click(function() {
		const email = $('#lo_email1').val() + "@" + $('#lo_email2').val();
		console.log("email : " + email);
		const code = $('input[name=auth]').val();
		console.log("code : " + code);
		$.ajax({
			url: '/user/email/emailCheck?code='+code,
			type: 'post',
			dataType: 'json',
			success: function(data) {
				console.log('ㅇㅇ 이메일 검사 성공');
				if (data > 0) {
					console.log("result : " + data);
					$('.msgEmail').css('color', 'green').text('이메일 인증이 완료 되었습니다.');
					$('.resultEmailForId').css('color', 'green').text('이메일 인증이 완료 되었습니다.');
					$('.resultEmailForPass').css('color', 'green').text('이메일 인증이 완료 되었습니다.');
					$('input[name=email]').val(email);
					//update시에 모달에서 인증한 email값 uEmail로 전달
					$('input[name=uEmail]').val(email);
					isEmailOk = true;
				} else {
					$('.msgEmail').css('color', 'red').text('이메일 인증에 실패했습니다.');
					$('.resultEmailForId').css('color', 'red').text('이메일 인증에 실패했습니다.');
					$('.resultEmailForPass').css('color', 'red').text('이메일 인증에 실패했습니다.');
					isEmailOk = false;
				}
			}
		});
	});
});