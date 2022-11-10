package com.its.memberboard.Repository;

import com.its.memberboard.DTO.BoardDTO;
import com.its.memberboard.DTO.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void save(CommentDTO commentDTO) {
        sql.insert("Comment.save", commentDTO);
    }

    public List<CommentDTO> listLoad(Long boardId) {
        return sql.selectList("Comment.listLoad", boardId);
    }

    public List<CommentDTO> commentListUpset(BoardDTO boardDTO) {
        return sql.selectList("Comment.commentUpset", boardDTO);
    }
}
