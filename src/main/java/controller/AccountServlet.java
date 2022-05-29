package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class AccountServlet
 */
@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		
		//Lay danh sach cac account
		if (action.equals("showaccount")) {
			List<Account> accountList = new DAOAccount().getAccountList();
			
			//HttpSession session = request.getSession(false);
			//session.setAttribute("accountList", accountList);
			
			int totalAccounts = new DAOAccount().getTotalAccount();
			int index = 0;
			int accountPerPage = 10;
			int totalPages = 0;
			if (totalAccounts % accountPerPage == 0) {
				totalPages = totalAccounts % accountPerPage;
			} else {totalPages = totalAccounts / accountPerPage + 1;}
			
			request.setAttribute("index", index);
			request.setAttribute("totalAccounts", totalAccounts);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("accountList", accountList);
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/accountlist.jsp");
			rd.forward(request, response);
		}
		
		//Sua thong tin 1 nguoi dung
		else if (action.equals("edit")) {
			String account_id = request.getParameter("account_id"); 
			Account account = new DAOAccount().getAccount(account_id); 
			
			if (account.getFullName() != null ) {
				request.setAttribute("message", "OK");
				request.setAttribute("account_id", account.getAccount_id());
			} else {
				request.setAttribute("account_id", "");
				request.setAttribute("error", "Không tồn tại id người dùng");
			}
			
			request.setAttribute("acc", account);
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/editaccount.jsp");
			rd.forward(request, response);
		}
		
		//Sua thong tin ve vai tro cua 1 nguoi dung
		else if (action.equals("updateRole")) {
			String account_id_S = request.getParameter("account_id");
			String role = request.getParameter("role");
			int account_id = Integer.parseInt(account_id_S);
			String queryResult = null;
			
			Account account = new DAOAccount().getAccount(account_id_S);
			if ((account.getRole()).equalsIgnoreCase("admin")) {
				queryResult = "Không cho phép chuyển từ Admin sang User";
				request.setAttribute("queryResult", queryResult);
				request.setAttribute("acc", account);
				request.getRequestDispatcher("accounts?action=edit&account_id="+account_id).forward(request, response);
			} 
			else {
				Account acc = new Account();
				acc.setAccount_id(account_id);
				acc.setRole(role);
				queryResult = new DAOAccount().updateRole(acc);
			
			//Account newAcc = new DAOAccount().getAccount(account_id_S);
			//request.setAttribute("acc", newAcc);
			//request.setAttribute("message", "OK");
			//request.setAttribute("account_id", newAcc.getAccount_id());
				
				request.setAttribute("queryResult", queryResult);
				request.getRequestDispatcher("accounts?action=showaccount").forward(request, response);
			}
		}
		
		//Xoa 1 nguoi dung
		else if (action.equals("delete")) {
			String account_id = request.getParameter("account_id");
			
			int linkedAccount = new DAOAccount().linkedAccount(account_id);
			
			if (linkedAccount > 0) {
				request.setAttribute("queryResult", "Không thể xóa người dùng có id "+account_id+" do đang tồn tại liên kết tới kết quả khác trong CSDL.");
				RequestDispatcher rd = request.getRequestDispatcher("accounts?action=showaccount");
				rd.forward(request, response);
				
			} else {
				Account account = new DAOAccount().getAccount(account_id);
				String queryResult = null;
				
				if (account.getRole().equalsIgnoreCase("admin")) {
					queryResult = "Không xóa được thành viên Admin";
				} 
				else {
					queryResult = new DAOAccount().deleteAccount(account_id);
				}
				
				request.setAttribute("queryResult", queryResult);
				RequestDispatcher rd = request.getRequestDispatcher("accounts?action=showaccount");
				rd.forward(request, response);
			}
		}
		
		//Tim kiem account
		else if (action.equals("search")) {
			
			String username = request.getParameter("username");
			String phone = request.getParameter("phone");
			
			List<Account> accounts = new DAOAccount().searchAccount(username, phone);
			
			//Xu li phan trang
			int index;
			if (request.getParameter("index") != null) {
				index =  Integer.parseInt(request.getParameter("index"));
			} else index = 0;
			
			int totalAccounts = accounts.size();
			int pageSize = 10;
			int totalPages = 0;
			if (totalAccounts % pageSize == 0) {
				totalPages = totalAccounts / pageSize;
			} else {totalPages = (totalAccounts / pageSize)+1;}
			
			int start = index*10 + 1;
			int end; 
			
			if (index == totalAccounts / pageSize) {
				end = index*10 + totalAccounts % pageSize;
				
			} else end = (index + 1) * 10;
			
			List<Account> accountList = new ArrayList<Account>();
			
			for (int i = start; i <= end; i++) {
				accountList.add(accounts.get(i-1));
				if (i > end) {return;}
			}
			
			request.setAttribute("accountList", accountList);
			request.setAttribute("index", index);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("totalAccounts", totalAccounts);
			request.setAttribute("username", username);
			request.setAttribute("phone", phone);
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/searchaccount.jsp");
			rd.forward(request, response);
		}
		
		//Dang ky nguoi dung
		else if (action.equals("addAccount")) {
			String fullName = request.getParameter("fullName");
			String email = request.getParameter("email");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			
			String hashedpass = new Password().createPass(password);
			
			Account account = new Account();
			account.setFullName(fullName);
			account.setEmail(email);
			account.setUsername(username);
			account.setPassword(hashedpass);
			account.setPhone(phone);
			
			String queryResult = new DAOAccount().addAccount(account);
			
			request.setAttribute("queryResult", queryResult);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		//Reset password nguoi dung
		else if (action.equals("resetPass")) {
			String account_id = request.getParameter("account_id");
			String password = new Password().resetPass();
			String hashedPass = new Password().createPass(password);
			
			Account currentAccount = new DAOAccount().getAccount(account_id);
			
			Account newAccount = new Account();
			newAccount.setAccount_id(currentAccount.getAccount_id());
			newAccount.setPassword(hashedPass);
			
			String queryResult = new DAOAccount().updatePass(newAccount);
			if (queryResult.equals("Reset mật khẩu thành công!")) {
				String email = currentAccount.getEmail();
				String fullName = currentAccount.getFullName();
				
				try {
					new Email().sendResetPass(email, password, fullName);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			request.setAttribute("queryResult", queryResult);
			request.getRequestDispatcher("accounts?action=showaccount").forward(request, response);;
		}
		
		//reset mật khẩu theo email
		else if (action.equals("resetByEmail")) {
			String queryResult = null;
			String email = request.getParameter("email");
			
			Account account = new DAOAccount().searchAccountByEmail(email);
			
			if (account.getAccount_id() == 0) {
				queryResult = "Không tồn tại " + email +" trong hệ thống";
				
			} else {
				
				String password = new Password().resetPass();
				String hashedPass = new Password().createPass(password);
				account.setPassword(hashedPass);
				
				String resetPass = new DAOAccount().updatePass(account);
				
				if (resetPass.equals("Reset mật khẩu thành công!")) {
					String fullName = account.getFullName();
					
					try {
						new Email().sendResetPass(email, password, fullName);
						queryResult = "Mật khẩu mới đã được gửi tới email "+email+".";
						
					} catch (Exception e) {
						e.printStackTrace();
					}
			} else {
				queryResult = "Không cấp lại được mật khẩu";
				System.out.println(queryResult);
			}
		}
			request.setAttribute("queryResult", queryResult);
			request.getRequestDispatcher("/views/forgotpass.jsp").forward(request, response);
		}
		else if (action.equals("editAccount")) {
			request.getRequestDispatcher("/admin/editaccount.jsp").forward(request, response);
		}
		
		else if (action.equals("pagination")) {
			String index_S = request.getParameter("index");
			int index = Integer.parseInt(index_S);
			
			int totalAccounts = new DAOAccount().getTotalAccount();
			int accountPerPage = 10;
			int totalPages = 0;
			if (totalAccounts % accountPerPage == 0) {
				totalPages = totalAccounts % accountPerPage;
			} else {totalPages = totalAccounts / accountPerPage + 1;}
			
			List<Account> accountList = new DAOAccount().pagination(index);
			request.setAttribute("totalAccounts", totalAccounts);
			request.setAttribute("index", index);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("accountList", accountList);
			request.getRequestDispatcher("/WEB-INF/admin/accountlist.jsp").forward(request, response);
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
