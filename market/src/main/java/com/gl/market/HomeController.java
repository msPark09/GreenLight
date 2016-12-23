package com.gl.market;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.market.model.UserJoinDao;
import com.gl.market.model.UserWishVo;
import com.gl.market.product.ProductDao;
import com.gl.market.product.ProductVo;

@Controller
public class HomeController {
	// 메인화면, 상품 페이지

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Autowired
	private SqlSession sqlSession;

	HttpSession session;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {
		// home 시작
		logger.info("market-index");
		session = request.getSession();
		String customid = (String) session.getAttribute("id");
		logger.info(customid);
		ProductDao mapper = sqlSession.getMapper(ProductDao.class);
		model.addAttribute("list", mapper.index());
		if (!(customid == null || customid.equals(""))) {
			model.addAttribute("wishlist", mapper.selectAllWish(customid));
		}
		return "home";
	}

	@RequestMapping(value = "/{code}", method = RequestMethod.GET)
	public void proListShow(@PathVariable String code, Model model,
			HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		// home 시작
		logger.info("code : " + code);
		ProductDao mapper = sqlSession.getMapper(ProductDao.class);
		session = request.getSession();
		String customid = (String) session.getAttribute("id");

		List<UserWishVo> wishlist = new ArrayList<UserWishVo>();
		if (!(customid == null || customid.equals(""))) {
			wishlist = mapper.selectAllWish(customid);
		}
		List<ProductVo> list = null;
		if (code.equals("total")) {
			list = mapper.index();
		} else {
			list = mapper.selectList(code);
		}

		String data = "";
		if (list.size() > 0) {
			for (ProductVo bean : list) {

				data += "<div class=\"col-xs-12 col-md-4\">"
						+ "<div class=\"thumbnail\">" + "<a href=\"detail?id="
						+ bean.getProid() + "\">" + "<img src=\"/market/img/"
						+ bean.getThumb() + "\" alt=\"" + bean.getThumb()
						+ "\"></a>" + "<div class=\"caption\">" + "<h3>"
						+ bean.getProname() + "</h3>";
				if (wishlist.size() > 0) {
					boolean okwish = false;
					data += "<p>";
					for (UserWishVo wishbean : wishlist) {
						if (wishbean.getProid().equals(bean.getProid())) {
							okwish = true;
						}
					}
					if (okwish) {

						data += "<a href=\""
								+ bean.getProid()
								+ "\" class=\"wish btn btn-danger\" role=\"button\"> <span class=\"glyphicon glyphicon-heart heart\" aria-hidden=\"true\"></span></a>";
					} else {
						data += "<a href=\""
								+ bean.getProid()
								+ "\" class=\"wish btn btn-danger\" role=\"button\"> <span class=\"glyphicon glyphicon-heart-empty heartE \" aria-hidden=\"true\"></span></a>";
					}
				} else {
					data += "<a href=\""
							+ bean.getProid()
							+ "\" class=\"wish btn btn-danger\" role=\"button\">"
							+ " <span class=\"glyphicon glyphicon-heart-empty heartE \" aria-hidden=\"true\"></span></a>";
				}
				data += "<a href=\"detail?id="
						+ bean.getProid()
						+ "\" class=\"btn btn-default\" role=\"button\">자세히 보기</a></p></div></div></div>";
			}
		} else {
			data = "<p><h1>해당 여행이 없습니다.</h1><h1>더 좋은 상품을 준비해 돌아오겠습니다.</h1>"
					+ "<h1>감사합니다. :)</h1></p>";
		}

		PrintWriter print = null;
		String dataEnco = "";
		try {
			print = response.getWriter();
			dataEnco = URLEncoder.encode(data, "UTF-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataEnco = URLEncoder.encode("데이터가 없습니다.", "UTF-8");
		}
		logger.info(data);
		print.print(dataEnco);
	}

	@RequestMapping(value = "/wishIn")
	public void wishListIn(@RequestParam("proid") String proid,
			@RequestParam("customid") String customid,
			HttpServletResponse response) {
		logger.info("wishIn-insert");
		ProductDao mapper = sqlSession.getMapper(ProductDao.class);
		UserWishVo bean = new UserWishVo("", proid, customid);
		mapper.insertWish(bean);
	}

	@RequestMapping(value = "/wishOut")
	public void wishListOut(@RequestParam("proid") String proid,
			@RequestParam("customid") String customid,HttpServletResponse response) {
		logger.info("wishOut-delete");
		ProductDao mapper = sqlSession.getMapper(ProductDao.class);
		UserWishVo bean = new UserWishVo("", proid, customid);
		logger.info(bean.toString());
		mapper.deleteWish(bean);
		System.out.println("mapper end");
//		return "temp";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detailView(@RequestParam("id") String id) {
		// 제품 상세페이지
		return "stock/detail";
	}

}