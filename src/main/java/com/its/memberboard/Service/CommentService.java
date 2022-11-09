package com.its.memberboard.Service;

import com.its.memberboard.DTO.CommentDTO;
import com.its.memberboard.Repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);
    }

    public List<CommentDTO> listLoad(Long boardId) {
        System.out.println("boardId = " + boardId);
        return commentRepository.listLoad(boardId);
    }
}
