package com.its.memberboard.Repository;

import com.its.memberboard.DTO.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

    public BoardDTO findById(Long id) {
        BoardDTO boardDTO = sql.selectOne("Board.findById", id);
        if (boardDTO.getFileAttached() == 1) {
            return sql.selectOne("Board.findByIdFile", id);
        } else {
            return boardDTO;
        }
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.pagingList", pagingParam);
    }

    public int boardCount() {
        return sql.selectOne("Board.boardCount");

    }


    public void hits(Long id) {
        sql.update("Board.hitsPlus", id);
    }

    public List<BoardDTO> search(Map<String, String> searchParam) {
        return sql.selectList("Board.search", searchParam);
    }
}
