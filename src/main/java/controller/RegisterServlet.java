package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Email;
import common.Password;
import dao.DAOAccount;
import model.Account;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		
		String queryResult = null;
		
		if (action.equals("doRegister")) {
			
			String fullName = request.getParameter("fullName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String username = request.getParameter("username");
			
			Account account = new Account();
			account.setFullName(fullName);
			account.setEmail(email);
			account.setPhone(phone);
			account.setUsername(username);
			
			int emailExisted = new DAOAccount().searchEmail(account.getEmail());
			int usernameExisted = new DAOAccount().searchUsername(account.getUsername());

			// Kiem tra ton tai email trong he thong
			if (emailExisted > 0) {
				queryResult = "Email đã tồn tại trong hệ thống";
				request.setAttribute("queryResult", queryResult);
				request.setAttribute("account", account);
				request.getRequestDispatcher("/views/register.jsp").forward(request, response);
			}
			// Kiem tra ton tai username trong he thong
			else if (usernameExisted > 0) {
				queryResult = "Tên đăng nhập đã tồn tại trong hệ thống";
				request.setAttribute("queryResult", queryResult);
				request.setAttribute("account", account);
				request.getRequestDispatcher("/views/register.jsp").forward(request, response);
			}
			// Thuc hien cho phep dang ki
			else {
				String passToEmail = new Password().resetPass();
				String passToDatabase = new Password().createPass(passToEmail);

				account.setPassword(passToDatabase);

				// Cap nhat du lieu vao database
				String query = new DAOAccount().addAccount(account);

				// Gui email thong bao password toi email nguoi dung
				new Email().sendFirstPass(account.getEmail(), passToEmail, account.getFullName());
				
				if (query.equals("Cập nhật dữ liệu thành công")) {
					queryResult = "Đăng kí thành công. Vui lòng kiểm tra email để đăng nhập.";
					request.setAttribute("queryResult", queryResult);
					
					request.getRequestDispatcher("/views/register.jsp").forward(request, response);
					//request.getRequestDispatcher("index").forward(request, response);
					
				} else {
					queryResult = "Đăng kí không thành công.";
					request.setAttribute("queryResult", queryResult);
					request.getRequestDispatcher("/views/register.jsp").forward(request, response);
				}
			}
		}
		else if (action.equals("activate")) {
			String emailToVerify = request.getParameter("email"); 
			String password = request.getParameter("code");
			
			Account accountToVerify = new DAOAccount().searchAccountByEmail(emailToVerify);
			String passFromDB = accountToVerify.getPassword();
			
			boolean passVerify = new Password().checkPass(password, passFromDB);
			System.out.println(passVerify);
			
			boolean checkActivate = new Password().checkPass(password, passFromDB);
			System.out.println(checkActivate +" "+passVerify);
			
			if (checkActivate) {
				String firstMessage = "Vui lòng thay đôi mật khẩu ở lần đăng nhập đầu tiên.";
				request.setAttribute("firstMessage", firstMessage);
				request.getRequestDispatcher("/views/changepass.jsp").forward(request, response);
			} else {
				String firstMessage = "Thông tin sai, vui lòng kiểm tra lại.";
				request.setAttribute("error", firstMessage);
				request.getRequestDispatcher("/views/error.jsp").forward(request, response);
			}
			
		}
	}

}
