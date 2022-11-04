package com.its.memberboard.DTO;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class BoardDTO {
    private Long id;
    private String boardTitle;
    private String boardWriter;
    private String boardContents;
    private int boardHits;

    private MultipartFile boardFileName;
    private String originalFileName;
    private String storedFileName;
    private int fileAttached;


}
