package kr.or.ddit.controller.member.service;

import kr.or.ddit.vo.Member;
import kr.or.ddit.vo.MemberAuth;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IMemberService {

	public int insert(Member member);

	public List<Member> list();

	public Member read(int userNo);

	public int delete(int userNo);

	public int deleteAuth(int userNo);

	public int createAuth(MemberAuth memberAuth);

	public int modify(Member member);

	List<Member> searchList(@Param("keyword") String keyword);
}
