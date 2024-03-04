package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.repository.entity.Banner;

@Mapper
public interface BannerRepository {
	
	// 배너전체리스트출력(페이징)
	public List<Banner> BannerListAll(Criteria cri) throws Exception;
	
	
	// 배너전체갯수카운팅(페이징)
	public int BannerListCount() throws Exception;
	
	
	// 배너등록(관리자)
	public Integer AdminInsertBanner(Banner banner);
	
	
	// 배너수정(관리자)
	public Integer AdminUpdateBanner(Banner banner);
	
	
	//배너삭제(관리자)
	public Integer AdminDeleteBanner(Banner banner);
	
	
	
	
	
	
	
	
}
