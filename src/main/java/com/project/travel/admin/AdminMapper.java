package com.project.travel.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.travel.member.MemberVO;
import com.project.travel.product.ProductVO;
import com.project.travel.util.Pager;

@Mapper
public interface AdminMapper {
	
	public MemberVO getMemberDetail(MemberVO memberVO)throws Exception;
	
	public List<ProductVO> getProductList(Pager pager) throws Exception;
	
	public List<MemberVO> getMemberList() throws Exception;

}