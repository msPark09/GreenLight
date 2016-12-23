package com.gl.market.product;

import java.util.List;

import com.gl.market.model.UserWishVo;

public interface ProductDao {
	public List<ProductVo> index();
	public List<ProductVo> selectList(String cat);
	//public ProductVo selectOne(String id);
	public void insertWish(UserWishVo bean);
	public void deleteWish(UserWishVo bean);
	public List<UserWishVo> selectAllWish(String customid);
}
