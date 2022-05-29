package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAOCompany;
import model.Company;

/**
 * Servlet implementation class CompaniesServlet
 */
@WebServlet("/CompanyServlet")
public class CompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("txt/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		String company_id_S = request.getParameter("company_id");
		
		HttpSession session = request.getSession(true);
		
		//Phân nhánh các dịch vụ
		if (action.equalsIgnoreCase("showlist")) {
			
			List<Company> companies = new DAOCompany().getCompanyList();
		
			//request.setAttribute("companies", companies);
			session.setAttribute("listCompanies", companies);
			
			
			//response.sendRedirect("test.jsp");
			//RequestDispatcher rd = request.getRequestDispatcher("test.jsp");
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/companylist.jsp");
			rd.forward(request, response);
		}
		
		//Lay thong tin 1 cong ty xo so
		else if (action.equals("getCompany")) {
			Company company = new DAOCompany().getCompany(company_id_S);
			
			request.setAttribute("company", company);
			request.setAttribute("command", "true");
	
			RequestDispatcher rd = request.getRequestDispatcher("companies?action=showlist");
			rd.forward(request, response);
		} 
		
		//Sua thong 1 cong ty xo so
		else if (action.equals("editCompany")) {
			String company_name = request.getParameter("company_name");
			String company_province = request.getParameter("company_province");
			String company_address = request.getParameter("company_address");
			int company_id = Integer.parseInt(company_id_S);
			
			Company com = new Company(company_id, company_name, company_province, company_address);
			
			new DAOCompany().editCompany(com);
			
			RequestDispatcher rd = request.getRequestDispatcher("companies?action=showlist");
			rd.forward(request, response);
		}
		
		//Xoa 1 cty khoi danh sach
		else if (action.equals("delete")) {
			
			int linkedCompany = new DAOCompany().linkedCompany(company_id_S);
			if (linkedCompany > 0) {
				request.setAttribute("queryResult", "Không thể xóa Công ty có id: "+company_id_S+" do đang có liên kết tới dữ liệu tới các bảng khác.");
				RequestDispatcher rd = request.getRequestDispatcher("companies?action=showlist");
				rd.forward(request, response);
			}
			else {
				String queryResult = new DAOCompany().deleteCompany(company_id_S);
				
				request.setAttribute("queryResult", queryResult);
				RequestDispatcher rd = request.getRequestDispatcher("companies?action=showlist");
				rd.forward(request, response);
			}
		}
		
		//Them moi cong ty xo so
		else if (action.equals("addCompany")) {
			String company_name = request.getParameter("company_name");
			String company_province = request.getParameter("company_province");
			String company_address = request.getParameter("company_address");
			
			Company com = new Company();
			com.setCompany_name(company_name);
			com.setCompany_province(company_province);
			com.setCompany_address(company_address);
			
			new DAOCompany().addCompany(com);
			
			RequestDispatcher rd = request.getRequestDispatcher("companies?action=showlist");
			rd.forward(request, response);
		}
	}

	/*
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
