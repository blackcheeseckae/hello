package com.mrshop.view.product;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mrshop.home.Pager;
import com.mrshop.model.payment.PaymentService;
import com.mrshop.model.product.ProductInfoVO;
import com.mrshop.model.product.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;

	// 카테고리 품목 출력
	@RequestMapping("/category")
	public String getfbMirrorList(@RequestParam(defaultValue = "1") int curPage, ProductInfoVO vo, Model model) {
		int count = productService.getCountProduct(vo);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<ProductInfoVO> list = productService.getProductList(start, end, vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cate_id", vo.getCate_id());
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		model.addAttribute("map", map);
		return "product/category";
	}

	// 제품 상세페이지
	@RequestMapping("/productpage")
	public String productPage(ProductInfoVO vo, Model model) {
		model.addAttribute("product", productService.productDetail(vo));
		return "product/productpage";
	}

	// 품목 리스트 + 페이징 + 검색
	@RequestMapping(value = "/searchPrd", method = RequestMethod.GET)
	public String listPage(Model model, HttpSession session, ProductInfoVO vo,
			@RequestParam(defaultValue = "") String sPrd, @RequestParam(defaultValue = "1") int curPage) {
		// 게시글 갯수 계산
		int count = productService.countSearchPrd(sPrd);

		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		session.setAttribute("sPrd", sPrd); // 상품 이름 검색
		session.setAttribute("curPage", curPage);

		List<ProductInfoVO> list = productService.listSearchPrd(sPrd, start, end); // 게시글 목록
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		map.put("sPrd", sPrd);
		model.addAttribute("map", map);

		return "product/search";
	}

	// 관리자
	// 상품코드 중복검사
	@ResponseBody
	@RequestMapping(value = "/prdCheckID")
	public int prdCheckID(ProductInfoVO vo) {
		int prdCheckID = productService.prdCheckID(vo);
		return prdCheckID;
	}

	// 상품등록 페이지
	@RequestMapping("/prdinsert")
	public String insertProductView(ProductInfoVO vo) {
		return "admin/insertProduct";
	}

	// (진) 상품등록
	@RequestMapping("/insertProduct")
	public String insertProduct(MultipartHttpServletRequest multi, ProductInfoVO vo) {
System.out.println(vo.toString());
		String root = "../wks/Baseball/src/main/webapp/";
		String path = "resources/img/product/" + vo.getCate_id() + "/";
		String realpath = root + "resources/img/product/" + vo.getCate_id() + "/";

		File dir = new File(realpath);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		Iterator<String> files = multi.getFileNames();
		while (files.hasNext()) {
			String uploadFile = files.next();

			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
			vo.setPrd_img(path + fileName);
			
			try {
				mFile.transferTo(new File(realpath + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		productService.insertProduct(vo);
		return "main";
	}

	// 관리자 용 상품 목록
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productListView(@RequestParam(defaultValue = "1") int curPage, ProductInfoVO vo, Model model) {
		int count = productService.getAdminCountProduct(vo);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<ProductInfoVO> list = productService.getAdminProductList(start, end, vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		model.addAttribute("map", map);
		return "admin/productList";
	}
}