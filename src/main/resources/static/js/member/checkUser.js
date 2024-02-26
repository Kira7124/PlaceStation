	/**
	 * 사용자 중복체크
	 */
	$(function(){
		// 아이디 중복체크
		const inputUid = document.getElementsByName('uid')[0];
		const msgId = document.getElementsByClassName('msgId')[0];
		
		if(inputUid != null) {
			inputUid.addEventListener("focusout", function(){
				const uid = inputUid.value;
				
				// 아이디 유효성 검증(중복 버튼을 눌렀을 때 서버로 보냄으로써 생기는 부하를 줄이기 위해 위치를 위로 올려준다.)
				if(!uid.match(reUid)){
					msgId.innerText = '유효한 아이디가 아닙니다.';
					msgId.style.color = 'red';
					isUidOk = false;
					return;
				}
				
				// 서버 전송
				const xhr = new XMLHttpRequest();
				xhr.open('GET', '/LotteON/member/check/uid/'+uid);
				xhr.send();
				
				xhr.onreadystatechange = function(){
					if(xhr.readyState == XMLHttpRequest.DONE){
						if(xhr.status == 200) {
							console.log(xhr.response);
							const data = JSON.parse(xhr.response);
							if(data > 0){
								msgId.innerText = '이미 사용중인 아이디 입니다.';
								msgId.style.color = 'red';
								isUidOk = false;
							}else{
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
			if(!hp.match(reHp)) {
				$('.msgHp').css('color', 'red').text('휴대폰 번호가 유효하지 않습니다.');
				isHpOk = false;
				return;
			}
			console.log("유효성검사통과!");
			console.log
			$.ajax({
				url: '/LotteON/member/check/hp/'+hp,
				dataType: 'json',
				type: 'GET',
				contentType: 'application/json',
				success: function(data){
					console.log(data);
					if(data > 0) {
						$('.msgHp').css('color', 'red').text('이미 사용중인 휴대폰 번호입니다.');
						isHpOk = false;
					}else {
						$('.msgHp').css('color', 'green').text('사용가능한 휴대폰 번호입니다.');
						isHpOk = true;
					}
				}
			});
			
		});
		// 담당자 휴대폰 중복체크
		$('input[name=managerHp]').focusout(function() {
			const managerHp = $(this).val();

			if(!managerHp.match(reHp)) {
				$('.msgManagerHp').css('color', 'red').text('휴대폰 번호가 유효하지 않습니다.');
				isHpOk = false;
				return;
			}
			const url = '/LotteON/member/check/managerHp/'+managerHp;
			$.get(url, function(data){
				console.log(data);
				if(data > 0) {
					$('.msgManagerHp').css('color', 'red').text('이미 사용중인 휴대폰 번호입니다.');
					isHpOk = false;
				}else{
					$('.msgManagerHp').css('color', 'green').text('사용가능한 휴대폰 번호입니다.');
					isHpOk = true;
				}
			});

		});

	}); // onload end
	