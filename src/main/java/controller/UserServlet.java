package controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAOAccount;
import dao.DAOTransaction;
import model.Account;
import model.Transaction;
import common.Password;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		String action = request.getParameter("action");
		HttpSession session = request.getSession(false);
		String queryResult = null;

		if (action.equals("viewaccount")) {

			if (session.getAttribute("id") != null) {
				Account account = new DAOAccount().getAccount(session.getAttribute("id").toString());

				request.setAttribute("acc", account);
				request.getRequestDispatcher("/WEB-INF/user/viewaccount.jsp").forward(request, response);
			} else {
				queryResult = "Vui lòng đăng nhập";
				request.setAttribute("queryResult", queryResult);
				request.getRequestDispatcher("/views/login.jsp").forward(request, response);
			}

		} else if (action.equals("changepass")) {
			String account_id = request.getParameter("account_id");
			request.setAttribute("account_id", account_id);
			request.getRequestDispatcher("/views/changepass.jsp").forward(request, response);
		} else if (action.equals("changePassConfirm")) {
			String account_id = request.getParameter("account_id");
			String oldPass = request.getParameter("oldPass");
			String newPass = request.getParameter("newPassword");

			String databasePass = new DAOAccount().getAccount(account_id).getPassword();
			boolean checkOldPass = new Password().checkPass(oldPass, databasePass);

			if (checkOldPass) {
				String hashedPass = new Password().createPass(newPass);
				Account account = new Account();
				account.setAccount_id(Integer.parseInt(account_id));
				account.setPassword(hashedPass);
				account.setVerified("1");

				queryResult = new DAOAccount().changePass(account);

				request.setAttribute("acc", new DAOAccount().getAccount(account_id));
				request.setAttribute("queryResult", queryResult);
				request.getRequestDispatcher("/WEB-INF/user/viewaccount.jsp").forward(request, response);

			} else {
				request.setAttribute("error", "Sai mật khẩu");
				request.getRequestDispatcher("/views/changepass.jsp").forward(request, response);
			}

		} else if (action.equals("updateInfo")) {
			String fullName = request.getParameter("fullName");
			String phone = request.getParameter("phone");
			String role = request.getParameter("role");

			// Neu vai tro dang la admin thi khong duoc chuyen sang user
			if (session.getAttribute("role").equals("admin")) {
				queryResult = "Không được phép thay đổi chuyển từ Admin sang User";
				Account account = new DAOAccount().getAccount(session.getAttribute("id").toString());

				request.setAttribute("queryResult", queryResult);
				request.setAttribute("acc", account);
				request.getRequestDispatcher("/WEB-INF/user/viewaccount.jsp").forward(request, response);
			}
			// Cho phep thay doi thong tin
			else {
				Account account = new Account();
				account.setAccount_id(Integer.parseInt(session.getAttribute("id").toString()));
				account.setFullName(fullName);
				account.setPhone(phone);
				account.setRole(role);
				session.setAttribute("role", role);

				queryResult = new DAOAccount().updateUserInfo(account);
				request.setAttribute("queryResult", queryResult);
				request.getRequestDispatcher("user?action=viewaccount").forward(request, response);
			}
		}
		//User xem lich su do so
		else if (action.equals("history")) {
			String account_id = request.getParameter("account_id");
			
			List<Transaction> trans;
			try {
				trans = new DAOTransaction().getTransaction(account_id);

			//Xu li phan trang
			int index;
			if (request.getParameter("index") != null) {
				index =  Integer.parseInt(request.getParameter("index"));
			} else index = 0;
			
			int totalTransactions = trans.size();
			int pageSize = 10;
			int totalPages = 0;
			if (totalTransactions % pageSize == 0) {
				totalPages = totalTransactions / pageSize;
			} else {totalPages = (totalTransactions / pageSize)+1;}
			
			int start = index*10 + 1;
			int end; 
			
			if (index == totalTransactions / pageSize) {
				end = index*10 + totalTransactions % pageSize;
				System.out.println("Truong hop "+end);
			} else end = (index + 1) * 10;
			
			List<Transaction> tranList = new ArrayList<Transaction>();
			
			for (int i = start; i <= end; i++) {
				tranList.add(trans.get(i-1));
				if (i > end) {return;}
			}
			
			request.setAttribute("transactions", tranList);
			request.setAttribute("index", index);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("totalTransactions", totalTransactions);
			request.setAttribute("account_id", account_id);
			
			request.getRequestDispatcher("/WEB-INF/user/history.jsp").forward(request, response);
			
			
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//User xoa lich su do so
		else if (action.equals("deleteTrans")) {
			String[] listTransId = request.getParameter("transaction_id").split(",");
			
			queryResult = new DAOTransaction().deleteTrans(listTransId);
			request.setAttribute("queryResult", queryResult);
			request.getRequestDispatcher("/WEB-INF/user/history.jsp").forward(request, response);
			//request.getRequestDispatcher("user?action=history").forward(request,response);
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
