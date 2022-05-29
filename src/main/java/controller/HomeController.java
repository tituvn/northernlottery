package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAOAccount;
import dao.DAOResult;
import model.Account;
import model.Result;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/HomeController")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("txt/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String action = request.getParameter("action");
		
		if (action == null) {
			response.sendRedirect("index");
		} 
		else if (action.equals("login")) {
			Cookie[] cookies = request.getCookies();
			String account_id = null;
			
			boolean foundCookie = false;
			for (int i = 0; i < cookies.length; i++) {
				Cookie c = cookies[i];
				
				if (c.getName().equals("account_id")) {
					account_id = c.getValue();
					foundCookie = true;
				}
			}
			
			if (foundCookie) {
				Account account = new DAOAccount().getAccount(account_id);
				HttpSession session = request.getSession(true);
				session.setAttribute("fullName", account.getFullName());
				session.setAttribute("id", account.getAccount_id());
				session.setAttribute("role", account.getRole());
				
				if (account.getRole().equals("admin")) {
					
					request.getRequestDispatcher("/WEB-INF/admin/home_admin.jsp").forward(request, response);
				} else if (account.getRole().equals("user")) {
					
					request.getRequestDispatcher("index").forward(request, response);
				}
				
			} 
			else {
				request.getRequestDispatcher("views/login.jsp").forward(request, response);
			}
		} 
		else if (action.equals("register")) {
			request.getRequestDispatcher("views/register.jsp").forward(request, response);
		
		}
		else if (action.equals("homepage")) {
			response.sendRedirect("index");
			
		}
		else if (action.equals("forgotpass")) {
				request.getRequestDispatcher("views/forgotpass.jsp").forward(request, response);
		}
		else if (action.equals("instruction")) {
			request.getRequestDispatcher("views/instruction.jsp").forward(request, response);
		}
		
		else if (action.equals("checkticket")) {
			request.getRequestDispatcher("views/checkticket.jsp").forward(request, response);
		}
		else if (action.equals("aboutus")) {
			request.getRequestDispatcher("views/aboutus.jsp").forward(request, response);
		}
		else if (action.equals("drawschedule")) {
			request.getRequestDispatcher("views/drawschedule.jsp").forward(request, response);
		}
		else if (action.equals("award")) {
			request.getRequestDispatcher("views/award.jsp").forward(request, response);
		}
		else if (action.equals("procedure")) {
			request.getRequestDispatcher("views/procedure.jsp").forward(request, response);
		}
		
		else if (action.equals("ticketing")) {
			request.getRequestDispatcher("views/ticketing.jsp").forward(request, response);
		}
		//Lay ket qua theo ngay quay thuong
		else if (action.equals("resultByDate")) {
			String date = request.getParameter("draw_date");

			List<Result> resultList = new DAOResult().getResultByDate(date);

			if (resultList.isEmpty()) {
				request.setAttribute("queryResult", "Không tìm được kết quả cho ngày " + date);
				request.getRequestDispatcher("/WEB-INF/homepage.jsp").forward(request, response);
			} else {

				request.setAttribute("resultList", resultList);
				request.getRequestDispatcher("/WEB-INF/homepage.jsp").forward(request, response);
			}
		}
		
		else {response.sendRedirect("index");
		
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
