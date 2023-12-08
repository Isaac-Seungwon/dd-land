package com.project.dd.test.worldcup.attraction.mapper;

import java.util.List;
import java.util.Map;

import com.project.dd.activity.attraction.domain.AttractionDTO;
import com.project.dd.test.worldcup.attraction.domain.WorldCupAttractionDTO;

public interface WorldCupAttractionMapper {

	// 모든 어트랙션 리스트 조회
	List<AttractionDTO> getAllAttraction(Map<String, String> map);
	
    // 운영중인 어트랙션 리스트 조회
    List<AttractionDTO> getRunAttraction(String close);

    // 모든 어트랙션 월드컵 정보 조회
    List<WorldCupAttractionDTO> getAllAWC(String isTest);

    // 모든 어트랙션 월드컵 승리 정보 조회
    List<WorldCupAttractionDTO> getAllAWCWin();

    // 모든 어트랙션 월드컵 최종 승리 정보 조회
    List<WorldCupAttractionDTO> getAllAWCFinalWin();

    // 페이징
	int getTotalCount();

}
