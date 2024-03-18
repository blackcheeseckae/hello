package com.mrshop.view.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mrshop.home.Pager;
import com.mrshop.model.board.BoardService;
import com.mrshop.model.board.BoardVO;

@Controller
@SessionAttributes("board2")
public class BoardController2 {

	@Autowired
	private BoardService boardService;
	
	// 게시글 등록 뷰
	@RequestMapping("/write2")
	public String write2(BoardVO vo) throws Exception {
		return "board/write2";
	}
	
	// 게시글 등록
		@RequestMapping(value = "/createBoard2", method = RequestMethod.POST)
		public String createBoard2(BoardVO vo) throws Exception {
			boardService.createBoard2(vo);
			return "board/list2";
		}

	// 게시글 수정 뷰
	@RequestMapping("/updateWrite2")
	public String updateWrite2(BoardVO vo) throws Exception {
		return "board/updateWrite2";
	}

	
	@RequestMapping(value = "/updateBoard2", method = RequestMethod.POST)
	public String updateBoard2(BoardVO vo) throws Exception {
		if (vo.getTitle() != null) {
			boardService.updateBoard2(vo);
			return "board/view2";
		} else {
			return "board/write2";
		}
		// return "redirect:/board";
	}

	// 게시글 삭제
		@RequestMapping("/delete2")
		public String deleteBoard2(int bno) throws Exception {
			boardService.deleteBoard2(bno); // 삭제 처리
			return "redirect:/board2"; // 목록으로 이동
		}
		
	
	// 게시글 목록 + 검색 + 페이징
	@RequestMapping("/board2")
	public String listAllBoard2(Model model, HttpSession session,
			@RequestParam(defaultValue = "TITLE") String searchOption, 
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String search, 
			@RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		// 게시글 갯수 계산
		int count = boardService.getCountBoard2(searchOption, keyword);

		session.setAttribute("searchOption", searchOption);
		session.setAttribute("keyword", keyword);
		session.setAttribute("search", search);
		session.setAttribute("curPage", curPage);

		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<BoardVO> list = boardService.listAllBoard2(searchOption, keyword, start, end); // 게시글 목록

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("search", search);
		model.addAttribute("map", map);

		return "board/list2";
	}

	
	// 고객센터 게시글 상세보기
	@RequestMapping("/view2")
	public String readBoard2(@RequestParam("bno") int bno, Model model, HttpSession session,
	                          @RequestParam(defaultValue = "TITLE") String searchOption,
	                          @RequestParam(defaultValue = "") String keyword, 
	                          @RequestParam(defaultValue = "") String search,
	                          @RequestParam(defaultValue = "1") int curPage) throws Exception {

	    /* 게시글 예외처리 */
	    // 고객센터용 게시글 존재 여부 및 상태 체크
	    int checkBoard = boardService.checkBoard2(bno); // 고객센터용 메서드 사용

	    if (checkBoard == 0) {
	        // 존재하지 않거나 삭제/숨김 처리된 게시글에 대한 처리
	        return "board/checkNone2"; // 고객센터용 적절한 오류 페이지로 리다이렉트
	    }

	    // 고객센터용 조회수 증가 처리
	    boardService.viewCnt2(bno, session); // 고객센터용 메서드 사용

	    // 고객센터용 게시글 정보 조회
	    BoardVO board = boardService.readBoard2(bno); // 고객센터용 메서드 호출
	    model.addAttribute("board2", board); // 모델에 게시글 정보 추가

	    // 세션 정보 업데이트 (필요한 경우)
	    session.setAttribute("searchOption", searchOption);
	    session.setAttribute("keyword", keyword);
	    session.setAttribute("search", search);
	    session.setAttribute("curPage", curPage);

	    // 고객센터용 이전글, 다음글 정보 조회
	    BoardVO plist = boardService.previousB2(bno); // 고객센터용 메서드 사용
	    BoardVO nlist = boardService.nextB2(bno); // 고객센터용 메서드 사용

	    HashMap<String, Object> map = new HashMap<>();
	    map.put("previousB", plist);
	    map.put("nextB", nlist);
	    model.addAttribute("map", map); // 모델에 이전글, 다음글 정보 추가

	    return "board/view2"; // 고객센터용 상세보기 뷰 페이지로 리다이렉트
	}
	
}



