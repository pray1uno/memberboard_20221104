package com.its.memberboard.Repository;

import com.its.memberboard.DTO.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;


    public BoardDTO boardWrite(BoardDTO boardDTO) {
        sql.insert("Board.boardInsert", boardDTO);
        return boardDTO;
    }

    public void boardFile(BoardDTO boardDTO) {
        sql.insert("Board.boardFile", boardDTO);
    }

    public List<BoardDTO> boardList() {
        return sql.selectList("Board.boardList");
    }
}
