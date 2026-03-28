package kr.or.ddit.controller.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.controller.member.mapper.IMemberMapper;
import kr.or.ddit.vo.Member;
import kr.or.ddit.vo.MemberAuth;

import java.util.List;

@Service
public class MemeberServiceImpl implements IMemberService {

    @Autowired
    IMemberMapper mapper;

    @Override
    public int insert(Member member) {
        int rslt = 0;
        rslt = mapper.insert(member);

        MemberAuth memberAuth = new MemberAuth();
        memberAuth.setUserNo(member.getUserNo());
        memberAuth.setAuth("ROLE_USER");

        mapper.insertAuth(memberAuth);
        return rslt;
    }

    @Override
    public List<Member> list() {
        return mapper.list();
    }

    @Override
    public Member read(int userNo) {
        return mapper.read(userNo);
    }

    @Override
    public int delete(int userNo) {
        mapper.deleteAuth(userNo);
        return mapper.delete(userNo);
    }

    @Override
    public int deleteAuth(int userNo) {
        return mapper.deleteAuth(userNo);
    }

    @Override
    public int createAuth(MemberAuth memberAuth){
        return createAuth(memberAuth);
    }

    @Override
    public int modify(Member member) {

        mapper.deleteAuth(member.getUserNo());

        List<MemberAuth> authList = member.getAuthList();
        for(MemberAuth a : authList){
            if(a.getAuth().isBlank()) a.setAuth(" ");
            a.setUserNo(member.getUserNo());
            mapper.insertAuth(a);
        }

        return mapper.modify(member);
    }

    @Override
    public List<Member> searchList(String keyword) {
        return mapper.searchList(keyword);
    }
}
