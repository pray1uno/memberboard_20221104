package com.its.memberboard.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
    private int page;
    private int maxPage;
    private int startPage;
    private int endPage;
}
