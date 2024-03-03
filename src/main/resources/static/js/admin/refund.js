    // JavaScript 코드
    var cancelAmountInput = document.querySelector('input[name="cancelAmount"]');
    // 계산 중 메시지를 나타내는 p 엘리먼트 생성
    var calculatingMessage = document.createElement('p');
    calculatingMessage.textContent = '계산 중...';
    calculatingMessage.style.color = 'red'; // 색상을 회색으로 설정
    calculatingMessage.style.display = 'none'; // 기본적으로는 숨김

    // 입력 필드 앞에 계산 중 메시지를 추가
    cancelAmountInput.parentElement.parentElement.insertBefore(calculatingMessage, cancelAmountInput.parentElement);

    // 입력된 금액이 변환될 때마다 변환 작업 수행
    cancelAmountInput.addEventListener('input', function () {
        // 입력된 값이 있으면 계산 중 메시지를 보이도록 설정
        if (cancelAmountInput.value.trim() !== '') {
            calculatingMessage.style.display = 'block'; // 계산 중 메시지를 보이도록 설정
        } else {
            calculatingMessage.style.display = 'none'; // 입력된 값이 없으면 계산 중 메시지를 숨김
            return; // 입력된 값이 없으면 함수 종료
        }

        // 입력된 금액 가져오기
        var enteredAmount = parseFloat(cancelAmountInput.value);

        // 입력된 값이 숫자인지 확인
        if (!isNaN(enteredAmount)) {
            // 일정 시간이 지난 후에 변환 작업 수행
            setTimeout(function () {
                // 입력된 금액의 10% 계산
                var convertedAmount = enteredAmount * 0.05;

                // 변환된 금액을 입력 필드에 자동으로 설정
                // 이 부분을 실제로 입력 필드에 설정하는 코드로 변경하십시오
                cancelAmountInput.value = convertedAmount.toFixed(0); // 변환된 값을 소수점 둘째 자리까지 표시

                // 계산 중 메시지를 숨김
                calculatingMessage.style.display = 'none';
            }, 4000); // 4초 후에 변환 작업 실행
        }
    });
