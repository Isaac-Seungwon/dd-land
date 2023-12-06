package com.project.dd.activity.attraction.mapper;

import java.util.List;

import com.project.dd.activity.attraction.domain.AttractionDTO;
import com.project.dd.activity.attraction.domain.AttractionImgDTO;
import com.project.dd.activity.attraction.domain.LocationDTO;

public interface AttractionMapper {

	//(운영종료 제외) 운영/운휴 어트랙션 List
	List<AttractionDTO> getAttractionList(String close);

	//어트랙션 상세 정보
	AttractionDTO getAttraction(String seq);
	
	//어트랙션 이미지 List
	List<AttractionImgDTO> getAttractionImgList(String seq);

}
