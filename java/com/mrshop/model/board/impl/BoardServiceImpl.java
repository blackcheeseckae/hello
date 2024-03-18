package com.mrshop.model.board.impl;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrshop.model.board.BoardService;
import com.mrshop.model.board.BoardVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

	// 게시글 쓰기
	public void createBoard(BoardVO vo) throws Exception {
		boardDAO.createBoard(vo);
	}

	// 게시글 수정
	public void updateBoard(BoardVO vo) throws Exception {
		boardDAO.updateBoard(vo);
	}

	// 게시글 삭제
	public void deleteBoard(int bno) throws Exception {
		boardDAO.deleteBoard(bno);
	}
	
	// 게시글 삭제 체크
	public int checkBoard(int bno) throws Exception {
		return boardDAO.checkBoard(bno);
	}

	// 게시글 읽기
	public BoardVO readBoard(int bno) throws Exception {
		return boardDAO.readBoard(bno);
	}
	
	// 게시글 목록
	public List<BoardVO> listAllBoard(String searchOption, String keyword, int start, int end)
			throws Exception {
		return boardDAO.listAllBoard(searchOption, keyword, start, end);
	}
	
	// 이전글
	public BoardVO previousB(int bno) throws Exception {
		return boardDAO.previousB(bno);
	}
	
	// 다음글
	public BoardVO nextB(int bno) throws Exception {
		return boardDAO.nextB(bno);
	}
	
	// 조회수
	public void viewCnt(int bno, HttpSession session) throws Exception {
		// 타이머 설정
		long update_time = 0;

		if (session.getAttribute("update_time_" + bno) != null) {
			// 최근에 조회수를 올린 시간
			update_time = (Long) session.getAttribute("update_time_" + bno);
		}
		long current_time = System.currentTimeMillis();
		// 일정 시간이 경과한 후 조회수 증가 처리
		if (current_time - update_time > 5 * 10000) {
			// 조회수 증가 처리
			boardDAO.viewCnt(bno);
			// 조회수를 올린 시간 저장
			session.setAttribute("update_time_" + bno, current_time);
		}
	}

	// 게시글 갯수
	public int getCountBoard(String searchOption, String keyword) throws Exception {
		return boardDAO.getCountBoard(searchOption, keyword);
	}
	
	// 고객센터 게시글 쓰기
    @Override
    public void createBoard2(BoardVO vo) throws Exception {
        boardDAO.createBoard2(vo);
    }

    // 고객센터 게시글 수정
    @Override
    public void updateBoard2(BoardVO vo) throws Exception {
        boardDAO.updateBoard2(vo);
    }

    // 고객센터 게시글 삭제
    @Override
    public void deleteBoard2(int bno) throws Exception {
        boardDAO.deleteBoard2(bno);
    }

    // 고객센터 게시글 읽기
    @Override
    public BoardVO readBoard2(int bno) throws Exception {
        return boardDAO.readBoard2(bno);
    }

    // 고객센터 게시글 목록
    @Override
    public List<BoardVO> listAllBoard2(String searchOption, String keyword, int start, int end) throws Exception {
        return boardDAO.listAllBoard2(searchOption, keyword, start, end);
    }

    // 고객센터 게시글 갯수
    @Override
    public int getCountBoard2(String searchOption, String keyword) throws Exception {
        return boardDAO.getCountBoard2(searchOption, keyword);
    }
    
 // 고객센터용 게시글 삭제 체크
    @Override
    public int checkBoard2(int bno) throws Exception {
        return boardDAO.checkBoard2(bno);
    }

    // 고객센터용 조회수 증가
    @Override
    public void viewCnt2(int bno, HttpSession session) throws Exception {
        // 타이머 설정 (비슷한 로직을 사용할 수 있습니다)
        long update_time = 0;

        // 고객센터용 게시글의 경우, 세션 키 이름을 구분하기 위해 다른 이름 사용
        if (session.getAttribute("update_time_2_" + bno) != null) {
            update_time = (Long) session.getAttribute("update_time_2_" + bno);
        }
        long current_time = System.currentTimeMillis();
        // 일정 시간이 경과한 후 조회수 증가 처리
        if (current_time - update_time > 5 * 10000) {
            boardDAO.viewCnt2(bno);
            session.setAttribute("update_time_2_" + bno, current_time);
        }
    }

    // 고객센터용 이전글 정보 조회
    @Override
    public BoardVO previousB2(int bno) throws Exception {
        return boardDAO.previousB2(bno);
    }

    // 고객센터용 다음글 정보 조회
    @Override
    public BoardVO nextB2(int bno) throws Exception {
        return boardDAO.nextB2(bno);
    }

}
