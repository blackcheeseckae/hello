package com.mrshop.model.board;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface BoardService {
    
    // 기존 공지사항용 메소드들
    void createBoard(BoardVO vo) throws Exception;
    void updateBoard(BoardVO vo) throws Exception;
    void deleteBoard(int bno) throws Exception;
    int checkBoard(int bno) throws Exception;
    BoardVO readBoard(int bno) throws Exception;
    void viewCnt(int bno, HttpSession session) throws Exception;
    BoardVO previousB(int bno) throws Exception;
    BoardVO nextB(int bno) throws Exception;
    List<BoardVO> listAllBoard(String searchOption, String keyword, int start, int end) throws Exception;
    int getCountBoard(String searchOption, String keyword) throws Exception;

    // 고객센터용 메소드 추가
    void createBoard2(BoardVO vo) throws Exception;                    // 고객센터 게시글 쓰기
    void updateBoard2(BoardVO vo) throws Exception;                    // 고객센터 게시글 수정
    void deleteBoard2(int bno) throws Exception;                       // 고객센터 게시글 삭제
    int checkBoard2(int bno) throws Exception; // 고객센터용 게시글 존재 여부 및 상태 체크
    BoardVO readBoard2(int bno) throws Exception;                      // 고객센터 게시글 읽기
    void viewCnt2(int bno, HttpSession session) throws Exception; // 고객센터용 조회수 증가 처리
    BoardVO previousB2(int bno) throws Exception; // 고객센터용 이전글 정보 조회
    BoardVO nextB2(int bno) throws Exception; // 고객센터용 다음글 정보 조회
    List<BoardVO> listAllBoard2(String searchOption, String keyword, int start, int end) throws Exception; // 고객센터 게시글 목록
    int getCountBoard2(String searchOption, String keyword) throws Exception; // 고객센터 게시글 갯수

}
