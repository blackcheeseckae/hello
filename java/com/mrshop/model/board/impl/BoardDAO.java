package com.mrshop.model.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mrshop.model.board.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 게시글 쓰기
	public void createBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.createBoard", vo);
	}

	// 게시글 수정
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}

	// 게시글 삭제
	public void deleteBoard(int bno) {
		mybatis.update("BoardDAO.deleteBoard", bno);
	}
	
	// 게시글 삭제 체크
	public int checkBoard(int bno) throws Exception {
		return mybatis.selectOne("BoardDAO.checkBoard", bno);
	}

	// 게시글 읽기
	public BoardVO readBoard(int bno) {
		return (BoardVO) mybatis.selectOne("BoardDAO.readBoard", bno);
	}
	
	// 이전글
	public BoardVO previousB(int bno) {
		return (BoardVO) mybatis.selectOne("BoardDAO.previousB", bno);
	}

	// 다음글
	public BoardVO nextB(int bno) {
		return (BoardVO) mybatis.selectOne("BoardDAO.nextB", bno);
	}
	
	// 게시물 목록
	public List<BoardVO> listAllBoard(String searchOption, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("BoardDAO.listAllBoard", map);
	}

	// 조회수
	public void viewCnt(int bno) {
		mybatis.update("BoardDAO.viewCnt", bno);
	}

	// 게시글 갯수
	public int getCountBoard(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return mybatis.selectOne("BoardDAO.getCountBoard", map);
	}
	

	    // 고객센터 게시글 쓰기
	    public void createBoard2(BoardVO vo) {
	        mybatis.insert("BoardDAO.createBoard2", vo);
	    }

	    // 고객센터 게시글 수정
	    public void updateBoard2(BoardVO vo) {
	        mybatis.update("BoardDAO.updateBoard2", vo);
	    }

	    // 고객센터 게시글 삭제
	    public void deleteBoard2(int bno) {
	        mybatis.delete("BoardDAO.deleteBoard2", bno);
	    }

	    // 고객센터 게시글 읽기
	    public BoardVO readBoard2(int bno) {
	        return mybatis.selectOne("BoardDAO.readBoard2", bno);
	    }

	    // 고객센터 게시물 목록
	    public List<BoardVO> listAllBoard2(String searchOption, String keyword, int start, int end) {
	        Map<String, Object> map = new HashMap<>();
	        map.put("searchOption", searchOption);
	        map.put("keyword", keyword);
	        map.put("start", start);
	        map.put("end", end);
	        return mybatis.selectList("BoardDAO.listAllBoard2", map);
	    }

	    // 고객센터 게시글 갯수
	    public int getCountBoard2(String searchOption, String keyword) {
	        Map<String, String> map = new HashMap<>();
	        map.put("searchOption", searchOption);
	        map.put("keyword", keyword);
	        return mybatis.selectOne("BoardDAO.getCountBoard2", map);
	    }
	    
	    // 고객센터용 게시글 존재 여부 및 상태 체크
	    public int checkBoard2(int bno) {
	        return mybatis.selectOne("BoardDAO.checkBoard2", bno);
	    }

	    // 고객센터용 조회수 증가 처리
	    public void viewCnt2(int bno) {
	        mybatis.update("BoardDAO.viewCnt2", bno);
	    }

	    // 고객센터용 이전글 정보 조회
	    public BoardVO previousB2(int bno) {
	        return (BoardVO) mybatis.selectOne("BoardDAO.previousB2", bno);
	    }

	    // 고객센터용 다음글 정보 조회
	    public BoardVO nextB2(int bno) {
	        return (BoardVO) mybatis.selectOne("BoardDAO.nextB2", bno);
	    }
	    
	}


