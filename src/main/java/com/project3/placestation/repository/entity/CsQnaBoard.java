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
public class CsQnaBoard {
	
	private Integer qbno;	// 글번호
	private Integer qwriter;	// 글쓴이 기본키
	private String qcontent;	// 내용
	private String qtitle;	// 글제목
	private String filepath;	// 첨부사진 URL
	private Timestamp qregdate;	// 등록일
	private Timestamp qupdatedate;	// 수정일
	private Integer categoryid;	// 카테고리 ID
	private String qdeleteyn;	// 삭제 YN
	private Timestamp qdeleteat;	// 삭제일
	private Integer qreadcount;	// 조회수
	private String qstatus;	// 답글 여부
	private String qreply;	// 관리자 답글

}
