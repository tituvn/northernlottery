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
import javax.servlet.http.HttpSession;

import dao.DAOResult;
import model.Result;

/**
 * Servlet implementation class ResultInput
 */
@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		
		//Them ket qua xo so moi
		if (action.equals("addResult")) {
			String result_id = request.getParameter("result_id");
			String company_id= request.getParameter("company_id");
			String draw_date= request.getParameter("draw_date");
			String number_1 = request.getParameter("Number_1");
			String number_2 = request.getParameter("Number_2");
			String number_3 = request.getParameter("Number_3");
			String number_4 = request.getParameter("Number_4");
			String number_5 = request.getParameter("Number_5");
			String number_6 = request.getParameter("Number_6");
			String number_7 = request.getParameter("Number_7");
			String number_8 = request.getParameter("Number_8");
			String number_9 = request.getParameter("Number_9");
			String number_10 = request.getParameter("Number_10");
			String number_11 = request.getParameter("Number_11");
			String number_12 = request.getParameter("Number_12");
			String number_13 = request.getParameter("Number_13");
			String number_14 = request.getParameter("Number_14");
			String number_15 = request.getParameter("Number_15");
			String number_16 = request.getParameter("Number_16");
			String number_17 = request.getParameter("Number_17");
			String number_18 = request.getParameter("Number_18");
			String number_19 = request.getParameter("Number_19");
			String number_20 = request.getParameter("Number_20");
			String number_21 = request.getParameter("Number_21");
			String number_22 = request.getParameter("Number_22");
			String number_23 = request.getParameter("Number_23");
			String number_24 = request.getParameter("Number_24");
			String number_25 = request.getParameter("Number_25");
			String number_26 = request.getParameter("Number_26");
			String number_27 = request.getParameter("Number_27");
			String char_1 = request.getParameter("char_1");
			String char_2 = request.getParameter("char_2");
			String char_3 = request.getParameter("char_3");
			String char_4 = request.getParameter("char_4");
			String char_5 = request.getParameter("char_5");
			String char_6 = request.getParameter("char_6");
			
			
			Result result = new Result(result_id, company_id, draw_date, number_1,  number_2,  number_3,  number_4,
				 number_5,  number_6,  number_7,  number_8,  number_9,  number_10,
				 number_11,  number_12,  number_13,  number_14,  number_15,  number_16,
				 number_17,  number_18,  number_19,  number_20,  number_21,  number_22,
				 number_23,  number_24,  number_25,  number_26,  number_27, char_1, char_2, char_3, char_4, char_5, char_6);
			
			String queryResult = new DAOResult().inputResult(result);
			
			request.setAttribute("queryResult", queryResult);
			RequestDispatcher rd = request.getRequestDispatcher("results?action=viewResult");
			rd.forward(request, response);
		}
		//Xem chi tiet 1 ket qua quay thuong
		else if (action.equals("viewResult")) {
			
			Result result = new DAOResult().getResult();
			
			String province = new DAOResult().getProvince(result.getCompany_id());
			result.setCompany_province(province);
			
			request.setAttribute("result", result);
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/viewresult.jsp");
			rd.forward(request, response);
		}
		
		//Lay danh sach cac ket qua da nhap
		else if (action.equals("getList")) {
			
			List<Result> inputs = new DAOResult().getInputtedData();
			
			
			//Xu li phan trang
			int index;
			if (request.getParameter("index") != null) {
				index =  Integer.parseInt(request.getParameter("index"));
			} else index = 0;
			
			int totalResults = inputs.size();
			int pageSize = 10;
			int totalPages = 0;
			if (totalResults % pageSize == 0) {
				totalPages = totalResults / pageSize;
			} else {totalPages = (totalResults / pageSize)+1;}
			
			int start = index*10 + 1;
			int end; 
			
			if (index == totalResults / pageSize) {
				end = index*10 + totalResults % pageSize;
				
			} else end = (index + 1) * 10;
			
			List<Result> inputtedList = new ArrayList<Result>();
			
			for (int i = start; i <= end; i++) {
				inputtedList.add(inputs.get(i-1));
			}
			
			request.setAttribute("inputtedList", inputtedList);
			request.setAttribute("index", index);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("totalResults", totalResults);
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/inputlist.jsp");
			rd.forward(request, response);
			
		}
		
		//Xoa 1 ket qua da nhap
		else if (action.equals("delete")) {
			String result_id = request.getParameter("result_id");
			
			String queryResult = new DAOResult().deleteResult(result_id);
			
			request.setAttribute("queryResult", queryResult);
			
			RequestDispatcher rd = request.getRequestDispatcher("results?action=getList");
			rd.forward(request, response);
		}
		
		//Xem ket qua theo result_id
		else if (action.equals("view")) {
			String result_id = request.getParameter("result_id");
			
			Result viewResult = new DAOResult().getResultView(result_id);
			
			String company_province = new DAOResult().getProvince(viewResult.getCompany_id());
			viewResult.setCompany_province(company_province);
			
			request.setAttribute("result", viewResult);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/viewresult.jsp");
			rd.forward(request, response);
		}
		
		//Sua ket qua quay thuong
		else if (action.equals("edit")) {
			String result_id = request.getParameter("result_id");
			
			Result viewResult = new DAOResult().getResultView(result_id);
			String province = new DAOResult().getProvince(viewResult.getCompany_id());
			viewResult.setCompany_province(province);
			
			request.setAttribute("result", viewResult);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/editresult.jsp");
			rd.forward(request, response);
		}
		
		//Tim kiem ket qua quay thuong
		else if (action.equals("search")) {
			String company_id = request.getParameter("company_id");
			String draw_date = request.getParameter("draw_date");
			
			List<Result> inputs = new DAOResult().searchResult(company_id, draw_date);
			
			
			//Xu li phan trang
			int index;
			if (request.getParameter("index") != null) {
				index =  Integer.parseInt(request.getParameter("index"));
			} else index = 0;
			
			int totalResults = inputs.size();
			int pageSize = 10;
			int totalPages = 0;
			if (totalResults % pageSize == 0) {
				totalPages = totalResults / pageSize;
			} else {totalPages = (totalResults / pageSize)+1;}
			
			int start = index*10 + 1;
			int end; 
			
			if (index == totalResults / pageSize) {
				end = index*10 + totalResults % pageSize;
				
			} else end = (index + 1) * 10;
			
			List<Result> inputtedList = new ArrayList<Result>();
			
			for (int i = start; i <= end; i++) {
				inputtedList.add(inputs.get(i-1));
			}
			
			request.setAttribute("inputtedList", inputtedList);
			request.setAttribute("index", index);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("totalResults", totalResults);
			request.setAttribute("company_id", company_id);
			request.setAttribute("draw_date", draw_date);
			
			
			//request.setAttribute("inputtedList", inputtedList);
			HttpSession session = request.getSession(true);
			session.setAttribute("searchList", inputtedList);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/searchinput.jsp");
			rd.forward(request, response);
		}
		
		//Luu ket qua vua sua
		else if (action.equals("saveEdit")) {
			String result_id = request.getParameter("result_id");
			String company_id= request.getParameter("company_id");
			String draw_date= request.getParameter("draw_date");
			String number_1 = request.getParameter("Number_1");
			String number_2 = request.getParameter("Number_2");
			String number_3 = request.getParameter("Number_3");
			String number_4 = request.getParameter("Number_4");
			String number_5 = request.getParameter("Number_5");
			String number_6 = request.getParameter("Number_6");
			String number_7 = request.getParameter("Number_7");
			String number_8 = request.getParameter("Number_8");
			String number_9 = request.getParameter("Number_9");
			String number_10 = request.getParameter("Number_10");
			String number_11 = request.getParameter("Number_11");
			String number_12 = request.getParameter("Number_12");
			String number_13 = request.getParameter("Number_13");
			String number_14 = request.getParameter("Number_14");
			String number_15 = request.getParameter("Number_15");
			String number_16 = request.getParameter("Number_16");
			String number_17 = request.getParameter("Number_17");
			String number_18 = request.getParameter("Number_18");
			String number_19 = request.getParameter("Number_19");
			String number_20 = request.getParameter("Number_20");
			String number_21 = request.getParameter("Number_21");
			String number_22 = request.getParameter("Number_22");
			String number_23 = request.getParameter("Number_23");
			String number_24 = request.getParameter("Number_24");
			String number_25 = request.getParameter("Number_25");
			String number_26 = request.getParameter("Number_26");
			String number_27 = request.getParameter("Number_27");
			String char_1 = request.getParameter("char_1");
			String char_2 = request.getParameter("char_2");
			String char_3 = request.getParameter("char_3");
			String char_4 = request.getParameter("char_4");
			String char_5 = request.getParameter("char_5");
			String char_6 = request.getParameter("char_6");
			
			Result result = new Result(result_id, company_id, draw_date, number_1,  number_2,  number_3,  number_4,
				 number_5,  number_6,  number_7,  number_8,  number_9,  number_10,
				 number_11,  number_12,  number_13,  number_14,  number_15,  number_16,
				 number_17,  number_18,  number_19,  number_20,  number_21,  number_22,
				 number_23,  number_24,  number_25,  number_26,  number_27, char_1, char_2, char_3, char_4, char_5, char_6);
			
			new DAOResult().saveEdittedResult(result);
			
			RequestDispatcher rd = request.getRequestDispatcher("results?action=getList");
			rd.forward(request, response);
			
		}
		
		//Xoa nhieu ket qua mot lan
		else if (action.equals("deleteMulti")) {
			//String[] idList = request.getParameterValues("result_id");
			
			String[] idList = request.getParameter("result_id").split(",");
			
			String queryResult = new DAOResult().deleteMulti(idList);
			
			request.setAttribute("queryResult", queryResult);
			RequestDispatcher rd = request.getRequestDispatcher("results?action=getList");
			rd.forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
