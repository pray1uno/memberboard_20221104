package com.its.memberboard.Repository;

import com.its.memberboard.DTO.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public MemberDTO save(MemberDTO memberDTO) {
        sql.insert("Member.memberSave", memberDTO);
        return memberDTO;
    }

    public void fileSave(MemberDTO memberDTO) {
        sql.insert("Member.fileSave", memberDTO);
     }

    public String duplicate(String memberEmail) {
        return sql.selectOne("Member.duplicateCheck", memberEmail);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }
}
