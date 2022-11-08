package com.its.memberboard.controller;

import com.its.memberboard.DTO.BoardDTO;
import com.its.memberboard.Service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.io.IOException;
import java.util.List;

@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;


    @GetMapping("/board/list")
    public String board() {
        return "redirect:/board/listUp";
    }

    @GetMapping("/board/newBoardWrite")
    public String boardWrite() {
        return "boardWrite";
    }

    @PostMapping("/board/newBoardWrite")
    public String postBoardWrite(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.boardWrite(boardDTO);
        return "redirect:/board/listUp";
    }

    @GetMapping("/board/listUp")
    public String boardList(Model model) {
        List<BoardDTO> boardDTOList = boardService.boardList();
        model.addAttribute("boardList", boardDTOList);
        return "boardList";
    }

}