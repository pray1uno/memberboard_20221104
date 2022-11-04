package com.its.memberboard.DTO;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class CommentDTO {
    private Long id;
    private Long boardId;
    private String commentWriter;
    private String commentContents;
    private Timestamp commentCreatedDate;
}
