package com.mrshop.model.member.impl;

import java.util.List;

import org.bouncycastle.jcajce.provider.digest.SHA3;
import org.bouncycastle.util.encoders.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrshop.model.member.MemberService;
import com.mrshop.model.member.MemberVO;
import com.mrshop.model.payment.PaymentVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	// 패스워드 암호화
	public void securityPWD(MemberVO vo) {
		SHA3.DigestSHA3 digestSHA3 = new SHA3.DigestSHA3(512);
		byte[] digest = digestSHA3.digest(vo.getMember_pwd().getBytes());
		String securitypwd = Hex.toHexString(digest);
		vo.setMember_pwd(securitypwd);
	}
	
	public void imsiPW(MemberVO vo) {
		char[] charSet = new char[] { 
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
				'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
				'U', 'V', 'W', 'X', 'Y', 'Z' };
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 10; i++) {
			idx = (int) (charSet.length * Math.random());
			sb.append(charSet[idx]);
		}
		String imPW = sb.toString();
	}

	// ID 중복검사
	public int checkID(MemberVO vo) {
		return memberDAO.checkID(vo);
	}

	// 회원 유무 검사
	public int checkMember(MemberVO vo) {
		securityPWD(vo);
		return memberDAO.checkMember(vo);
	}

	// 회원가입
	public void insertMember(MemberVO vo) {
		securityPWD(vo);
		memberDAO.insertMember(vo);
	}

	// 로그인
	public MemberVO login(MemberVO vo) {
		securityPWD(vo);
		return memberDAO.login(vo);
	}

	// 회원정보 수정
	public void updateMember(MemberVO vo) {
		securityPWD(vo);
		memberDAO.updateMember(vo);
	}

	// 회원 주문내역
	public List<PaymentVO> getOrderList(MemberVO vo, int start, int end) {
		return memberDAO.getOrderList(vo, start, end);
	}

	// 회원 주문내역 갯수
	public int getCountOrder(MemberVO vo) {
		return memberDAO.getCountOrder(vo);
	}
	
	// 임시비밀번호
	public int forgotPWChkMember(MemberVO vo) {
		return memberDAO.forgotPWChkMember(vo);
	}
	
	public void forgotPWUpdate(MemberVO vo) {
		memberDAO.forgotPWUpdate(vo);
	}

	// 테스트
	public List<MemberVO> getMemberList(int start, int end, MemberVO vo) {
		return memberDAO.getMemberList(start, end, vo);
	}

	public int getCountMember(MemberVO vo) {
		return memberDAO.getCountMember(vo);
	}
}