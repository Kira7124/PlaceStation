/**
 * 프로필 사진 전송
 */

// 파일 선택기 오픈

$(document).ready(function() {
    // 파일 선택기 변경 이벤트
    $('#fileInput').change(function() {
		console.log("**************************** start")
        var filepath = this.files[0];
        console.log("**************************** start2222222")
        var userno = $('#hiddenuserNo').val();
        console.log("**************************** start33333" + userno)
        var formData = new FormData();
        formData.append('Profilefilepath', filepath);
        formData.append('userno', userno);
        console.log("**************************** start55555555")

		console.log('1111111111111111111111111111111' + filepath);
		console.log('444444444444444444444444444444' + userno);
		
        // AJAX 요청
        $.ajax({
			
            url: '/member/changePhoto',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(data) {
				console.log('22222222222222222222222222222222222');
                // 성공 시 이미지의 src 속성에 파일 경로 할당
                console.log('77777777777777777'+ data.filepath);
                $('#profileImage').attr('src', data.filepath);
            },
            error: function(xhr, status, error) {
                console.error('에러 발생:', error);
                
            }
        });
    });

    // 이미지를 클릭하여 파일 선택기 트리거
    $('#profileImage').click(function() {
		console.log('3333333333333333333333333333333333333');
        $('#fileInput').click();
    });
    
});