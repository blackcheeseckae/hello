package com.mrshop.model.member.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mrshop.model.member.MemberVO;
import com.mrshop.model.payment.PaymentVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 아이디 중복검사
	public int checkID(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.checkID", vo);
	}

	// 회원 존재 유무 검사
	public int checkMember(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.checkMember", vo);
	}

	// 회원가입
	public void insertMember(MemberVO vo) {
		mybatis.insert("MemberDAO.insertMember", vo);
	}

	// 로그인
	public MemberVO login(MemberVO vo) {
		return (MemberVO) mybatis.selectOne("MemberDAO.login", vo);
	}

	// 회원정보 수정
	public void updateMember(MemberVO vo) {
		mybatis.update("MemberDAO.updateMember", vo);
	}

	// 회원 주문내역
	public List<PaymentVO> getOrderList(MemberVO vo, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", vo.getMember_id());
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("MemberDAO.orderMember", map);
	}

	// 회원 주문내역 갯수
	public int getCountOrder(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.orderCount", vo);
	}
	
	public int forgotPWChkMember(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.forgotPWChkMember", vo);
	}
	
	public void forgotPWUpdate(MemberVO vo) {
		mybatis.update("MemberDAO.forgotPWUpdate", vo);
	}

	// 테스트용
	public List<MemberVO> getMemberList(int start, int end, MemberVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("member", vo);
		return mybatis.selectList("MemberDAO.getMemberList", map);
	}

	public int getCountMember(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.getCountMember", vo);
	}
}
