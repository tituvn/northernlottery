package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAOResult;
import model.Result;

/**
 * Servlet implementation class GeneralQuery
 */
@WebServlet("/GeneralQuery")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
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
		
		if (action == null) {
		
			List<Result> resultList = new DAOResult().getTop7Result();
			
			request.setAttribute("resultList", resultList);
			request.getRequestDispatcher("/WEB-INF/homepage.jsp").forward(request, response);
			
		} 
		else if (action.equals("getProvinceResult")) {
			String company_id = request.getParameter("company_id");
			List<Result> resultList = new DAOResult().getTop7ResultById(company_id);
			
			request.setAttribute("resultList", resultList);
			request.getRequestDispatcher("/WEB-INF/homepage.jsp").forward(request, response);
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
