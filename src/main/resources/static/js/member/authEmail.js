/**
 * 이메일 인증
 */
$(function(){
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
	
	$('#btnEmailCode').click(function(){
		
		const division = $('input[name=division]').val();
		const name = $('input[name=name]').val();
		const uid = $('input[name=uid]').val();
		const email = $('#lo_email1').val()+"@"+$('#lo_email2').val();

		
		const jsonData = {
									"division" : division,
									"name": name, 
									"uid": uid, 
									"email":email
									};
		
		if(preventDoubleClick){
			return;
		}
		preventDoubleClick = true;
		$('.msgEmail').css('color', 'black').text('잠시만 기다리세요...');
		$('.resultEmailForId').css('color', 'black').text('잠시만 기다리세요...');
		$('.resultEmailForPass').css('color', 'black').text('잠시만 기다리세요...');
		
		setTimeout(function(){
			if(!email.match(reEmail)) {
				$('.msgEmail').css('color', 'red').text('이메일이 유효하지 않습니다.');
				isEmailOk = false;
				preventDoubleClick = false;
				return;
			}else{
				$.ajax({
					url:'/LotteON/member/email/authEmail',
					type:'GET',
					data: jsonData,
					dataType:'json',
					success: function (data) {
						console.log("result : "+data.result);
						console.log("status : "+data.status);
						if(data.result > 0) {
							$('.msgEmail').css('color', 'red').text('이미 사용중인 이메일입니다.');
							isEmaileOk =false;

							if(data.status > 0){
								$('.resultEmailForId').css('color', 'green').text('이메일을 확인 후 인증코드를 입력하세요.');
								$('.resultEmailForPass').css('color', 'green').text('이메일을 확인 후 인증코드를 입력하세요.');
								$('input[name=auth]').prop('disabled', false);
							}else{
								$('.resultEmailForId').css('color', 'red').text('이메일 인증코드 전송이 실패했습니다. 잠시후 다시 시도하십시오.');
								$('.resultEmailForPass').css('color', 'red').text('이메일 인증코드 전송이 실패했습니다. 잠시후 다시 시도하십시오.');

							}

						}else {
							if(data.status > 0){
								$('.msgEmail').css('color', 'green').text('이메일을 확인 후 인증코드를 입력하세요.');
								$('.auth').show();
								$('input[name=email]').attr('readonly', true);
							}else{
								$('.msgEmail').css('color', 'red').text('이메일 인증코드 전송이 실패했습니다. 잠시후 다시 시도하십시오.');
								$('.resultEmailForId').css('color', 'red').text('해당하는 사용자, 이메일이 일치하지 않습니다.');
								$('.resultEmailForPass').css('color', 'red').text('해당하는 아이디, 이메일이 일치하지 않습니다.');
							}
						}
						preventDoubleClick = false;
					}

				});

			}

		}, 1000);
	});
	$('#btnEmailAuth').click(function(){
		const email = $('#lo_email1').val()+"@"+$('#lo_email2').val();
		console.log("email : "+email);
		const code = $('input[name=auth]').val();
		$.ajax({
			url:'/LotteON/member/email/confirmEmail/'+code,
			type:'POST',
			dataType:'json',
			success: function(data){
				if(data > 0) {
					console.log("result : "+ data);
					$('.msgEmail').css('color', 'green').text('이메일 인증이 완료 되었습니다.');
					$('.resultEmailForId').css('color', 'green').text('이메일 인증이 완료 되었습니다.');
					$('.resultEmailForPass').css('color', 'green').text('이메일 인증이 완료 되었습니다.');
					$('input[name=email]').val(email);
					isEmailOk = true;
				}else{
					$('.msgEmail').css('color', 'red').text('이메일 인증에 실패했습니다.');
					$('.resultEmailForId').css('color', 'red').text('이메일 인증에 실패했습니다.');
					$('.resultEmailForPass').css('color', 'red').text('이메일 인증에 실패했습니다.');
					isEmailOk = false;
				}
			}
		});
	});
});