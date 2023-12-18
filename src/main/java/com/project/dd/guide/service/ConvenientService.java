package com.project.dd.guide.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.dd.guide.domain.ConvenientDTO;
import com.project.dd.guide.repository.ConvenientDAO;

@Service
public class ConvenientService {

	@Autowired
	private ConvenientDAO convenientDao;   //ConvenientDAO 객체 생성

	public List<ConvenientDTO> list(Map<String, String> map) {
		return convenientDao.list(map);
	}

	public ConvenientDTO one(String seq) {
		return convenientDao.one(seq);
	}

	public Map<String, String> paging(String solting, String searchStatus, String category, String word, int page) {  //페이징 메서드
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("solting", solting);
		map.put("searchStatus", searchStatus);
		map.put("category", category);
		map.put("word", word);
		
		int pageSize = 9;  //나타났으면 하는 개수
		
		int startIndex = (page - 1) * pageSize + 1;
		int endIndex = startIndex + pageSize - 1;

		map.put("startIndex", String.format("%d", startIndex));
		map.put("endIndex", String.format("%d", endIndex));
		
		int totalPosts = convenientDao.getTotalCount(map);
		int totalPages = (int)Math.ceil((double)totalPosts / pageSize);
		
		map.put("totalPosts", String.format("%d", totalPosts));
		map.put("totalPages", String.format("%d", totalPages));
		
		return map;
	}

	public int addConv(ConvenientDTO dto) {
		
		int result = convenientDao.checkNameDuplication(dto);  //이름 중복검사
		if (result > 0) {
			return -1;
		}
				
		result = convenientDao.checkLocationDuplication(dto);  //위치 중복검사
		if (result > 0) {
			return -1;
		}
		
		result = convenientDao.checkTelDuplication(dto);  //전화번호 중복검사
		if (result > 0) {
			return -1;
		}
		
		result= convenientDao.addConv(dto);
		
		//방금 등록한 seq 가져오기(위치테이블에 seq가 참조되어있어서)
		String seq = convenientDao.getConvSeq();
		dto.setConvenient_seq(seq);
				
		//Location 추가
		result = convenientDao.addConvLocation(dto);
		
		return result;
	}

	public int checkLocationDuplication(ConvenientDTO dto) {  
		//위치 중복 확인
		return convenientDao.checkLocationDuplication(dto);
	}

	public int checkNameDuplication(ConvenientDTO dto) {
		//이름 중복 확인
		return convenientDao.checkNameDuplication(dto);
	}
	
	public int checkTelDuplication(ConvenientDTO dto) {
		//전화번호 중복 확인
		return convenientDao.checkTelDuplication(dto);
	}
	

	public ConvenientDTO addFile(ConvenientDTO dto, HttpServletRequest req, MultipartFile image) {
		
		if (image == null || image.isEmpty()) {	
			dto.setImg(null);
		} else {
			dto.setImg(saveFile(req, image));
		}

		return dto;
	}

	private String saveFile(HttpServletRequest req, MultipartFile image) {
		// 파일 저장
		
		try {
			
        	String path = req.getRealPath("/resources/files/guide/convenient");
        	
        	File directory = new File(path);
        	
            if (!directory.exists()) {
            	
                directory.mkdirs();
                
            }

            UUID uuid = UUID.randomUUID();
            
            String fileName = uuid + "_" + image.getOriginalFilename();
           
            Path filePath = Paths.get(path, fileName);

            image.transferTo(filePath.toFile());
            
            return fileName;

        } catch (IOException e) {
            e.printStackTrace();
        }
		
		return null;
	}

	//삭제
	public int delConv(String[] convenient_seq) {
		int result=0;
		
		for(String seq : convenient_seq) {
			int locationCount = convenientDao.countConvenientLocation(seq);
			
			if(locationCount > 0) {  //있으면 삭제
				convenientDao.delConvenientLocation(seq);
			}
			
			result+=convenientDao.delConvenient(seq);
		}
		
		return result;
	}

	// 파일 수정
	public ConvenientDTO editFile(ConvenientDTO dto, HttpServletRequest req, MultipartFile image) {
		
		if (image == null) {
			dto.setImg(convenientDao.getFileName(dto.getConvenient_seq()));
		} else if (image.isEmpty()) {
			dto.setImg(null);
		} else {
			dto.setImg(saveFile(req, image));
		}

		return dto;
	}

	public int editConv(ConvenientDTO convenient) {
		
		int result=0;
		
		result=convenientDao.editConv(convenient);
		result=convenientDao.editConvLocation(convenient);
		
		return result;
	}

	

	
	
		
}
