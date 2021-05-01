package com.gl.market;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.market.model.ProdetailVo;
import com.gl.market.model.UserBasketVo;
import com.gl.market.model.UserJoinDao;
import com.gl.market.model.UserWishVo;
import com.gl.market.model.VocVo;
import com.gl.market.product.ProductDao;
import com.gl.market.product.ProductVo;
import com.gl.market.product.ReviewVo;

@Controller
public class HomeController {
	// ����ȭ��, ��ǰ ������

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Autowired
	private SqlSession sqlSession;

	HttpSession session;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {
		// home ����
		logger.info("market-index");
		session = request.getSession();
		String customid = (String) session.getAttribute("id");
		logger.info(customid);
		ProductDao mapper = sqlSession.getMapper(ProductDao.class);
		model.addAttribute("list", mapper.index());
		if (!(customid == null || customid.equals(""))) {
			model.addAttribute("wishlist", mapper.selectAllWish(customid));
		}
		HashMap cnt = mapper.cnt();
		int cntInt = Integer.parseInt(cnt.get("CNT").toString());
		model.addAttribute("cnt",cntInt);
		List<HashMap> mainImg = mapper.mainimg();
		logger.info(mainImg.toString());
		model.addAttribute("mainImg", mainImg);
		
		return "home";
	}

	@RequestMapping(value = "/cat/{code}", method = RequestMethod.GET)
	public void proListShow(@PathVariable String code, Model model,
			HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		// home ����
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
						+ "<div class=\"thumbnail\">" + "<a href=\"/market/detail?id="
						+ bean.getProid() + "\">" + "<img src=\"/market/file/"
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
				data += " <a href=\"/market/detail?id="
						+ bean.getProid()
						+ "\" class=\"btn btn-default\" role=\"button\">�ڼ��� ����</a></p></div></div></div>";
			}
		} else {
			data = "<p><h1>�ش� ������ �����ϴ�.</h1><h1>�� ���� ��ǰ�� �غ��� ���ƿ��ڽ��ϴ�.</h1>"
					+ "<h1>�����մϴ�. :)</h1></p>";
		}

		PrintWriter print = null;
		String dataEnco = "";
		try {
			print = response.getWriter();
			dataEnco = URLEncoder.encode(data, "UTF-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataEnco = URLEncoder.encode("�����Ͱ� �����ϴ�.", "UTF-8");
		}
		logger.info(data);
		print.print(dataEnco);
	}
	
	@RequestMapping(value = "/go/{code}")
	public String catList(@PathVariable String code, Model model, HttpServletRequest request) {
		// ī�װ�����Ʈ
		logger.info("catlist");
		session = request.getSession();
		String customid ="";
		customid = (String) session.getAttribute("id");
		logger.info(customid);
		ProductDao mapper = sqlSession.getMapper(ProductDao.class);
		if (!(customid == null || customid.equals(""))) {
			model.addAttribute("wishlist", mapper.selectAllWish(customid));
		}//���ø���Ʈ ���� ����
		
		if(code.equals("total")){		
			//��ü����
			model.addAttribute("list", mapper.selectAll());
		}else{
			//ī�װ���
			model.addAttribute("list", mapper.selectList(code));
			if(code.equals("HD"))
				code = "�ֵ�";
			else if(code.equals("GL"))
				code="����";
			else if(code.equals("KR"))
				code="����";
			else if(code.equals("HU"))
				code="�޾���";
			else if(code.equals("FM"))
				code="��������";
			else if(code.equals("FO"))
				code="����Ž��";
			else if(code.equals("OD"))
				code="����ġ��";
			model.addAttribute("cat",code);//ī�װ�
		}
		//logger.info(mapper.selectAll().toString());
		return "stock/list";
	}
	


	@RequestMapping(value = "/wishIn")
	public void wishListIn(@RequestParam("proid") String proid,
			@RequestParam("customid") String customid,
			HttpServletResponse response) {
		logger.info("wishIn-insert");
		ProductDao mapper = sqlSession.getMapper(ProductDao.class);
		UserWishVo bean = new UserWishVo(proid, customid);
		mapper.insertWish(bean);
	}

	@RequestMapping(value = "/wishOut")
	public void wishListOut(@RequestParam("proid") String proid,
			@RequestParam("customid") String customid,HttpServletResponse response) {
		logger.info("wishOut-delete");
		ProductDao mapper = sqlSession.getMapper(ProductDao.class);
		UserWishVo bean = new UserWishVo(proid, customid);
		logger.info(bean.toString());
		mapper.deleteWish(bean);
		System.out.println("mapper end");
//		return "temp";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detailView(@RequestParam("id") String proid, Model model, HttpServletRequest request) {
		// ��ǰ ��������
		logger.info("detail-"+proid);
		ProductDao mapper = sqlSession.getMapper(ProductDao.class);
		ProductVo bean = mapper.selectOne(proid);//��ǰ����
		model.addAttribute("bean", bean);
		String cat = bean.getCat();
		if(cat.equals("HD"))
			cat = "�ֵ�";
		else if(cat.equals("GL"))
			cat="����";
		else if(cat.equals("KR"))
			cat="����";
		else if(cat.equals("HU"))
			cat="�޾���";
		else if(cat.equals("FM"))
			cat="��������";
		else if(cat.equals("FO"))
			cat="����Ž��";
		else if(cat.equals("OD"))
			cat="����ġ��";
		model.addAttribute("cat",cat);//ī�װ�
		List<ProdetailVo> detail = mapper.selectDetail(proid);	//��ǰ ������, �����
		model.addAttribute("detail", detail);
		List<VocVo> vocPro = mapper.vocList(proid);	//��ǰ ����
		model.addAttribute("vocPro", vocPro);
		List<ReviewVo> relist = mapper.reviewList(proid); //��ǰ ����
		model.addAttribute("relist", relist);
		//wishlist
		session = request.getSession();
		String customid = (String) session.getAttribute("id");
		if(customid != null){			
			HashMap<String, String> info = new HashMap<String, String>();
			info.put("proid", proid);
			info.put("customid", customid);
			HashMap wish = mapper.selectWish(info);
			int ok = Integer.parseInt(wish.get("OK").toString());
			model.addAttribute("wishOk", ok);
		}else{
			model.addAttribute("wishOk", 0);			
		}
		return "stock/detail";
	}
	@RequestMapping(value = "/remainTicket", method = RequestMethod.GET)
	public void remainTicket(ProdetailVo bean, Model model, HttpServletResponse response) throws IOException {
		// ���� Ƽ�ϼ� Ȯ���ϱ�
		logger.info("remainTicket-"+bean.toString());
		ProductDao mapper = sqlSession.getMapper(ProductDao.class);
		HashMap remain = mapper.orderTic(bean);
		PrintWriter out = response.getWriter();
		if(remain!=null){
			logger.info(remain.toString());	
			out.print(remain.get("SUM").toString());
		}else{
			out.print("0");			
		}		
	}
	@RequestMapping(value = "/insertVoC")
	public void insertProVoC(VocVo bean, Model model, HttpServletResponse response) throws IOException {
		// ��ǰ����
		logger.info("insertProVoc-"+bean.toString());
		String vocid=bean.getProid().substring(0,1)+"_"+bean.getCustomid().substring(0,1)+"_"+(char)(Math.random()*25+65);
		bean.setVocid(vocid);
		ProductDao mapper = sqlSession.getMapper(ProductDao.class);
		mapper.insertProVoc(bean);
	}
	//��ٱ���insertBasket
	@RequestMapping(value = "/insertBasket")
	public void insertProVoC(UserBasketVo bean, Model model, HttpServletResponse response) throws IOException {
		// ��ǰ����
		logger.info("insertProVoc-"+bean.toString());
		ProductDao mapper = sqlSession.getMapper(ProductDao.class);
		HashMap basket = mapper.selectBasket(bean);
		int baskOk = Integer.parseInt(basket.get("BASKET").toString());
		PrintWriter out = response.getWriter();
		String data="";
		if(baskOk==0){
			mapper.insertBasket(bean);
			data="��ٱ��Ͽ� �����ϴ�.";
		}else{			
			mapper.updateBasket(bean);
			data="�̹� ��ٱ��Ͽ� ��� �ֽ��ϴ�.";
		}
		String dataEncoding = URLEncoder.encode(data,"UTF-8");
		out.print(dataEncoding);
	}
	
	//��ٱ���
	
	
	


}