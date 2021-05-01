package com.gl.market.product;

import java.util.HashMap;
import java.util.List;

import com.gl.market.model.ProdetailVo;
import com.gl.market.model.UserBasketVo;
import com.gl.market.model.UserWishVo;
import com.gl.market.model.VocVo;

public interface ProductDao {
	public List<HashMap> mainimg();
	public HashMap cnt();
	public List<ProductVo> index();
	public List<ProductVo> selectList(String cat);
	//public ProductVo selectOne(String id);
	public void insertWish(UserWishVo bean);
	public void deleteWish(UserWishVo bean);
	public List<UserWishVo> selectAllWish(String customid);
	public ProductVo selectOne(String id);
	public List<ProdetailVo> selectDetail(String id);
	public HashMap orderTic(ProdetailVo bean);
	public List<VocVo> vocList(String proid);
	public void insertProVoc(VocVo bean);
	public List<ReviewVo> reviewList(String proid);
	public HashMap selectWish(HashMap info);
	public List<ProductVo> selectAll();
	public void insertBasket(UserBasketVo bean);
	public HashMap selectBasket(UserBasketVo bean);
	public void updateBasket(UserBasketVo bean);
}
