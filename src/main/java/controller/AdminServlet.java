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

import dao.DAOTransaction;
import model.Transaction;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		
		if (action.equals("inputResult")) {
			request.getRequestDispatcher("/WEB-INF/admin/inputresult.jsp").forward(request, response);
		}
		else if (action.equals("adminHome")) {
			request.getRequestDispatcher("/WEB-INF/admin/home_admin.jsp").forward(request, response);
		}
		else if (action.equals("history")) {
			
			String account_id = "0";
			
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
				
				request.getRequestDispatcher("WEB-INF/admin/transaction.jsp").forward(request, response);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//Xoa transaction do so
		else if (action.equals("deleteTrans")) {
				String[] listTransId = request.getParameter("transaction_id").split(",");
					
				String queryResult = new DAOTransaction().deleteTrans(listTransId);
				request.setAttribute("queryResult", queryResult);
				request.getRequestDispatcher("admin?action=history").forward(request, response);
				
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
