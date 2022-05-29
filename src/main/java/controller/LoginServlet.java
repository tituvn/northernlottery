package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Password;
import dao.DAOAccount;
import model.Account;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("txt/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		if (remember == null) {remember = "no";}
		
		String queryResult = null;
		
		//int emailExisted = new DAOAccount().searchEmail(username);
		Account account = new DAOAccount().searchAccountByUsername(username);
		
		if (account.getAccount_id() == 0) {
			queryResult = "Sai tên đăng nhập";
			request.setAttribute("queryResult", queryResult);
			request.getRequestDispatcher("/views/login.jsp").forward(request, response);
		} else {
			String passFromDatabase = account.getPassword();
			boolean passVerify = new Password().checkPass(password, passFromDatabase);
			
			if (!passVerify) {
				queryResult = "Sai mật khẩu";
				request.setAttribute("queryResult", queryResult);
				request.getRequestDispatcher("/views/login.jsp").forward(request, response);
			} else {
				HttpSession session = request.getSession(true);
				session.setAttribute("fullName", account.getFullName());
				session.setAttribute("id", account.getAccount_id());
				session.setAttribute("role", account.getRole());
				
				
				//Kiem tra xem co phai la lan dang nhap dau tien
				String isVerified;
				if (account.getVerified() == null) {
					isVerified = "0";
				} else {isVerified = account.getVerified();}
				
				if (!isVerified.equals("1")) {
					queryResult = "Vui lòng thay đổi mật khẩu ở lần đăng nhập đầu tiên";
					request.setAttribute("firstMessage", queryResult);
					request.setAttribute("account_id", account.getAccount_id());
					request.getRequestDispatcher("/views/changepass.jsp").forward(request, response);
				} else {
					if (remember.equals("yes")) {
						Cookie id = new Cookie("account_id", String.valueOf(account.getAccount_id()));
						Cookie user = new Cookie("username", account.getUsername());

						id.setMaxAge(60 * 60 * 24 * 15);
						user.setMaxAge(60 * 60 * 24 * 15);

						response.addCookie(id);
						response.addCookie(user);
					}
					new DAOAccount().userOnline(account.getAccount_id());

					queryResult = "Đăng nhập thành công";
					if (account.getRole().equals("admin")) {
						request.setAttribute("queryResult", queryResult);
						request.getRequestDispatcher("/WEB-INF/admin/home_admin.jsp").forward(request, response);
					} else if (account.getRole().equals("user")) {
						request.setAttribute("queryResult", queryResult);
						request.getRequestDispatcher("index").forward(request, response);
					}
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
