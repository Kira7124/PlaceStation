/**
 * 프로필 사진 전송
 */

// 파일 선택기 오픈

$(document).ready(function() {
    // 파일 선택기 변경 이벤트
    $('#fileInput').change(function() {
        var file = this.files[0];
        var username = this.files[0];
        var formData = new FormData();
        formData.append('Profilefilepath', file);
        formData.append('username', username);

		console.log('1111111111111111111111111111111' + file);
		console.log('444444444444444444444444444444' + username);
		
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