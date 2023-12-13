package com.project.dd.test.worldcup.attraction.service;

import java.util.List;
import java.util.Map;

import com.project.dd.activity.attraction.domain.AttractionDTO;
import com.project.dd.test.worldcup.attraction.domain.WorldCupAttractionDTO;

public interface WorldCupAttractionService {

	Map<String, String> paging(int page);
	
    List<AttractionDTO> getAllAttraction(Map<String, String> map);
    
    List<AttractionDTO> getRunAttraction(String close);

    List<WorldCupAttractionDTO> getAllAWC(String isTest);

    List<WorldCupAttractionDTO> getAllAWCWin();

    List<WorldCupAttractionDTO> getAllAWCFinalWin();

	void updateAttractionStatus(Map<String, String> map);
	
    List<AttractionDTO> getRemainingAttractions(List<String> selectedAttractions);

    List<AttractionDTO> getRandomTwoAttractions(List<AttractionDTO> attractions);

	int getAWCFinalWinTotalCount();

}
