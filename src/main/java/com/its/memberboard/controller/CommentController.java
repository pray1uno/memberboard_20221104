package com.its.memberboard.controller;

import com.its.memberboard.DTO.CommentDTO;
import com.its.memberboard.Service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;

    @PostMapping("/comment/save")
    public @ResponseBody List<CommentDTO> commentSave(@ModelAttribute CommentDTO commentDTO) {
        commentService.save(commentDTO);
        List<CommentDTO> result = commentService.listLoad(commentDTO.getBoardId());
        return result;
    }


}
