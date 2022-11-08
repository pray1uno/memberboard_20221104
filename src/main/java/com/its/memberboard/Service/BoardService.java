package com.its.memberboard.Service;

import com.its.memberboard.DTO.BoardDTO;
import com.its.memberboard.DTO.PageDTO;
import com.its.memberboard.Repository.BoardRepository;
import com.its.memberboard.commons.PagingConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    public void boardWrite(BoardDTO boardDTO) throws IOException {

        if (!boardDTO.getBoardFileName().isEmpty()) {
            MultipartFile boardFileName = boardDTO.getBoardFileName();
            String boardOriginalFileName = boardFileName.getOriginalFilename();
            String boardStoredFileName = System.currentTimeMillis() + "_" + boardOriginalFileName;
            boardDTO.setOriginalFileName(boardOriginalFileName);
            boardDTO.setStoredFileName(boardStoredFileName);
            String savePath = "D:\\spring_board_img\\" + boardStoredFileName;
            boardFileName.transferTo(new File(savePath));
            boardDTO.setFileAttached(1);
            System.out.println("boardDTO = " + boardDTO);

            BoardDTO saveResult = boardRepository.boardWrite(boardDTO);
            boardRepository.boardFile(saveResult);
        } else {
            boardRepository.boardWrite(boardDTO);
            boardDTO.setFileAttached(0);
        }
    }

    public List<BoardDTO> boardList() {
        return boardRepository.boardList();
    }

    public BoardDTO findById(Long id) {
        return boardRepository.findById(id);
    }

    public List<BoardDTO> pagingList(int page) {
        int pagingStart = (page - 1) * PagingConst.PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PagingConst.PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParam);
        return pagingList;
    }

    public PageDTO pagingParam(int page) {
        int boardCount = boardRepository.boardCount();
        int maxPage = (int) Math.ceil((double) boardCount / PagingConst.PAGE_LIMIT);
        int startPage = (((int) (Math.ceil((double) page / PagingConst.BLOCK_LIMIT))) - 1) * PagingConst.BLOCK_LIMIT + 1;
        int endPage = startPage + PagingConst.BLOCK_LIMIT - 1;

        if (endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);

        return pageDTO;
    }


    public void hits(Long id) {
        boardRepository.hits(id);
    }
}
