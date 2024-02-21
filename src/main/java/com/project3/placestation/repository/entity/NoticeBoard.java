package com.project3.placestation.repository.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoticeBoard {
	
	private Integer nbno;	// 글번호
	private Integer nwriterid;	// 글쓴이 기본키
	private String ncontent;	// 내용
	private String ntitle;	// 글제목
	private String filepath; // 첨부사진 URL
	private Timestamp nregdate;	// 등록일
	private Timestamp nupdatedate;	// 수정일
	private Integer categoryid;	// 카테고리 ID
	private String ndeleteyn;	// 삭제 YN
	private Timestamp ndeleteat;	// 삭제일
	private Integer nreadcount;		// 조회수
	

}
