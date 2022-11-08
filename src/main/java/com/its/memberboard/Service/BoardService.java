package com.its.memberboard.Service;

import com.its.memberboard.DTO.BoardDTO;
import com.its.memberboard.Repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    public void boardWrite(BoardDTO boardDTO) throws IOException {

        if (!boardDTO.getBoardFileName().isEmpty()) {
            MultipartFile boardFileName = boardDTO.getBoardFileName();
            String boardOriginalFileName = boardDTO.getOriginalFileName();
            String boardStoredFileName = boardDTO.getStoredFileName();
            boardDTO.setOriginalFileName(boardOriginalFileName);
            boardDTO.setStoredFileName(boardStoredFileName);
            String savePath = "D:\\spring_board_img\\" + boardStoredFileName;
            boardFileName.transferTo(new File(savePath));
            boardDTO.setFileAttached(1);

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
}
