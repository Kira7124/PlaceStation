package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project3.placestation.admin.dto.AdminBannerDTO;
import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.repository.entity.Banner;
import com.project3.placestation.repository.interfaces.BannerRepository;

@Service
public class BannerService {

	@Autowired
	private BannerRepository bannerRepository;
	
	
	//배너리스트출력
	public List<Banner> BannerListAll(Criteria cri) throws Exception{
		List<Banner> result = bannerRepository.BannerListAll(cri);
		return result;
		
	}
	
	//배너리스트갯수출력
	public int BannerListCount() throws Exception{
		return bannerRepository.BannerListCount();
	}
	
	
	
	//배너리스트 업데이트
	@Transactional
	public void AdminUpdateBanner(String filePath, AdminBannerDTO dto) {
		
		Banner banner = Banner.builder()
				.banNo(dto.getBanno())
				.banName(dto.getBanname())
				.filePath(filePath)
				.build();
		
		int result = bannerRepository.AdminUpdateBanner(banner);
		
	}
	
	
	
}
