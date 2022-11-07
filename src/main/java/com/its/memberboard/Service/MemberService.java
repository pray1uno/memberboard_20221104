package com.its.memberboard.Service;

import com.its.memberboard.DTO.MemberDTO;
import com.its.memberboard.Repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    public void save(MemberDTO memberDTO) throws IOException {

        if (!memberDTO.getMemberFileName().isEmpty()) {
            MultipartFile memberFileName = memberDTO.getMemberFileName();
            String originalFileName = memberFileName.getOriginalFilename();
            String storedFileName = System.currentTimeMillis() + "_" + originalFileName;
            memberDTO.setOriginalFileName(originalFileName);
            memberDTO.setStoredFileName(storedFileName);
            String saveFile = "D:\\spring_img\\" + storedFileName;
            memberFileName.transferTo(new File(saveFile));
            memberDTO.setFileAttached(1);

            MemberDTO saveResult = memberRepository.save(memberDTO);
            memberRepository.fileSave(saveResult);

        } else {
            memberDTO.setFileAttached(0);
            memberRepository.save(memberDTO);
        }
    }

    public String duplicate(String memberEmail) {
        String checkResult = memberRepository.duplicate(memberEmail);
        if (checkResult == null) {
            return "OK";
        } else {
            return "NO";
        }
    }
}
