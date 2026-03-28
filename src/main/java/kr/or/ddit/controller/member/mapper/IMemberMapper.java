package kr.or.ddit.controller.member.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.Member;
import kr.or.ddit.vo.MemberAuth;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IMemberMapper {

	public int insert(Member member);

	public void insertAuth(MemberAuth memberAuth);

	public List<Member> list();

	public Member read(int userNo);

	public int delete(int userNo);

	public int deleteAuth(int userNo);

	public int createAuth(MemberAuth memberAuth);

	public int modify(Member member);

	List<Member> searchList(String keyword);
}
