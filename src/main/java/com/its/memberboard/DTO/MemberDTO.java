package com.its.memberboard.DTO;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class MemberDTO {
    private Long id;
    private String memberEmail;
    private String memberPassword;
    private String memberName;
    private String memberMobile;

    private MultipartFile memberFileName;
    private String originalFileName;
    private String storedFileName;
    private Long memberId;
    private int fileAttached;


}
