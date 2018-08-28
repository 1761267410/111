package net.dfrz.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.dfrz.bean.po.UserPO;
import net.dfrz.service.UserServiceI;

@Controller
@RequestMapping(value = "/loginController/")
public class LoginController {
	@Resource(name = "userService")
	private UserServiceI userServiceI;

	public void setUserServiceI(UserServiceI userServiceI) {
		this.userServiceI = userServiceI;
	}

	// 判断用户名是否存在
	@RequestMapping(value = "checkNameExist")
	@ResponseBody
	public String checkNameExist(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String result = "";
		UserPO exisUser = userServiceI.checkNameExist(name);
		if (exisUser == null) {
			// 用户不存在
			result = "error";
		}
		// 获得response
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
		return null;

	}
	// 登录的方法

	@RequestMapping("login")
	public ModelAndView login(HttpServletRequest request, HttpSession session) {
		// 封装实体类对象
		ModelAndView mv = new ModelAndView();

		UserPO user = new UserPO();

		String name = request.getParameter("name");
		String password = request.getParameter("password");
		user.setName(name);
		user.setPassword(password);
		// 调用service的方法实现
		UserPO userExist = userServiceI.login(user);
		// 判断
		if (userExist != null) {
			// 成功
			// 使用session保持登录状态
			session.setAttribute("user", userExist);
			session.setAttribute("username", userExist.getName());
			if (userExist.getRid().equals("0")) {
				mv.setViewName("main");
				
			} else{
				mv.setViewName("welcome");
				
			}
			
			
		} else {// 失败
			mv.setViewName("login");
		}
		return mv;
	}
}
