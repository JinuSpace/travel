package com.project.travel.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.project.travel.member.MemberVO;
import com.project.travel.tQna.TQnaMapper;
import com.project.travel.tQna.TQnaVO;

@Component
public class QNAInterceptor implements HandlerInterceptor {

	@Autowired
	private TQnaMapper tQnaMapper;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean check = false;
		String method = request.getMethod();
		System.out.println(method);

		// TODO Auto-generated method stub
		String num = request.getParameter("num");
		TQnaVO tQnaVO = new TQnaVO();
		tQnaVO.setNum(Long.parseLong(num));
		tQnaVO = tQnaMapper.getDetail(tQnaVO);

		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
		if (memberVO != null) {

			int type = memberVO.getTType();

			if (type == 0 || type == 2) {
				check = true;
			}
		}
		// boolean check=false;
		// 작성자와 로그인 한 사용자의 id가 일치하면 통과
		if (tQnaVO.getId().equals(memberVO.getId())) {
			check = true;

		} /*
			 * else { //일치하지 않으면 list 로 redirect
			 * request.setAttribute("msg","관리자와 작성자만 가능합니다.");
			 * response.sendRedirect("./list");
			 * 
			 * }
			 */
		if (!check) {
			request.setAttribute("msg", "관리자와 작성자만 가능합니다.");
			request.setAttribute("path", "../");

			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/getResult.jsp");
			view.forward(request, response);
		}
		return check;

	}
}
