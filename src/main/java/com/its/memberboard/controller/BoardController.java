package com.its.memberboard.controller;

import com.its.memberboard.DTO.BoardDTO;
import com.its.memberboard.DTO.PageDTO;
import com.its.memberboard.Service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
        return "redirect:/board/paging";
    }

    @GetMapping("/board")
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        boardService.hits(id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("boardList", boardDTO);
        model.addAttribute("page", page);
        return "boardDetail";
    }

    @GetMapping("/board/paging")
    public String paging(Model model,
                         @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        List<BoardDTO> pagingList = boardService.pagingList(page);
        PageDTO pageDTO = boardService.pagingParam(page);
        model.addAttribute("boardList", pagingList);
        model.addAttribute("paging", pageDTO);
        return "boardPaging";
    }

    @GetMapping("/board/search")
    public String search(@RequestParam("type") String type,
                         @RequestParam("q") String q,
                         Model model) {
        List<BoardDTO> searchResult = boardService.search(type, q);
        model.addAttribute("boardList", searchResult);
        return "boardPaging";
    }

}