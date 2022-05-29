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

import dao.DAOCompany;
import dao.DAOResult;
import dao.DAOTransaction;
import model.Result;
import model.Transaction;

/**
 * Servlet implementation class TicketServlet
 */
@WebServlet("/TicketServlet")
public class TransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransactionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		String action = request.getParameter("action");

		if (action.equals("checkTicket")) {
			String query1 = "";
			String query2 = "";
			String query3 = "";
			String query4 = "";
			String query5 = "";
			String query6 = "";
			String query7 = "";
			String queryDB = "";
			String queryKK1 = "";
			String queryKK2 = "";
			String queryChar = "";
			int totalPrize = 0;
			String finalPrize = "";
			
			//Kiem tra tai khoan
			String account_id = null;
			HttpSession session = request.getSession(false);
			if (session.getAttribute("id") != null) {
				account_id = session.getAttribute("id").toString();
			} else {
				account_id = session.getId();
			}
			
			String draw_date = request.getParameter("draw_date");
			String company_id = request.getParameter("company_id");
			String ticket_number = request.getParameter("ticket_number");
			
			String ticket_char = request.getParameter("ticket_char");
			String last2 = ticket_number.substring(ticket_number.length() - 2);
			String last3 = ticket_number.substring(ticket_number.length() - 3);
			String last4 = ticket_number.substring(ticket_number.length() - 4);

			// Lay ket qua tu database
			Result result = new DAOResult().getResultForChecking(draw_date, company_id);
			String company_province = new DAOResult().getProvince(company_id);
			
			if (result.getResult_id() == null) {
				String error = "Xổ số " + company_province + " không phát hành vé ngày " + draw_date;
				request.setAttribute("error", error);
				request.getRequestDispatcher("/views/checkticket.jsp").forward(request, response);
			} else {
				
				// Kiem tra giai 7
				String[] seventhprize = { result.getNumber_24(), result.getNumber_25(), result.getNumber_26(),
						result.getNumber_27() };
				boolean is7prize = false;
				int count7 = 0;
				int prize7 = 40000;
				for (int i = 0; i < seventhprize.length; i++) {
					if (last2.equals(seventhprize[i])) {
						is7prize = true;
						count7 += 1;
					}
				}

				// Kiem tra giai 6
				String[] sixthprize = { result.getNumber_21(), result.getNumber_22(), result.getNumber_23() };
				boolean is6prize = false;
				int count6 = 0;
				int prize6 = 100000;
				for (int i = 0; i < sixthprize.length; i++) {
					if (last3.equals(sixthprize[i])) {
						is6prize = true;
						count6 += 1;
					}
				}

				// Kiem tra giai 5
				String[] fifthprize = { result.getNumber_15(), result.getNumber_16(), result.getNumber_17(),
						result.getNumber_18(), result.getNumber_19(), result.getNumber_20() };
				boolean is5prize = false;
				int count5 = 0;
				int prize5 = 200000;
				for (int i = 0; i < fifthprize.length; i++) {
					if (last4.equals(fifthprize[i])) {
						is5prize = true;
						count5 += 1;
					}
				}

				// Kiem tra giai 4
				String[] fourthprize = { result.getNumber_11(), result.getNumber_12(), result.getNumber_13(),
						result.getNumber_14() };
				boolean is4prize = false;
				int count4 = 0;
				int prize4 = 400000;
				for (int i = 0; i < fourthprize.length; i++) {
					if (last4.equals(fourthprize[i])) {
						is4prize = true;
						count4 += 1;
					}
				}

				// Kiem tra giai 3
				String[] thirdprize = { result.getNumber_5(), result.getNumber_6(), result.getNumber_7(),
						result.getNumber_8(), result.getNumber_9(), result.getNumber_9(), result.getNumber_10() };
				boolean is3prize = false;
				int count3 = 0;
				int prize3 = 1000000;
				for (int i = 0; i < thirdprize.length; i++) {
					if (ticket_number.equals(thirdprize[i])) {
						is3prize = true;
						count3 += 1;
					}
				}

				// Kiem tra giai 2
				String[] secondprize = { result.getNumber_3(), result.getNumber_4() };
				boolean is2prize = false;
				int count2 = 0;
				int prize2 = 5000000;
				for (int i = 0; i < secondprize.length; i++) {
					if (ticket_number.equals(secondprize[i])) {
						is2prize = true;
						count2 += 1;
					}
				}

				// Kiem tra giai 1
				boolean is1prize = false;
				int count1 = 0;
				int prize1 = 10000000;
				if (ticket_number.equals(result.getNumber_2())) {
					is1prize = true;
					count1 = 1;
				}

				// Kiem tra giai dac biet
				boolean isSpecialPrize = false;
				int countSpecial = 0;
				int prizeSpecial = 1000000000;
				if (ticket_number.equals(result.getNumber_1())) {
					isSpecialPrize = true;
					countSpecial = 1;
				}

				//Kiem tra giai Bonus tu ky tu
				String[] characters = {result.getChar_1(), result.getChar_2(), result.getChar_3(), result.getChar_4(), result.getChar_5(), result.getChar_6()};
				boolean isCharPrize = false;
				int countCharPrize = 0;
				int charPrize = 50000000;
				if (isSpecialPrize && ticket_char != "") {
					for (int i = 0; i < characters.length; i++) {
						if (ticket_char.equalsIgnoreCase(characters[i])) {
							isCharPrize = true;
							countCharPrize = 1;
						}
					}
				}
				
				// Kiem tra giai phu dac biet
				String last4Special = result.getNumber_1().substring(result.getNumber_1().length() - 4);
				boolean firstEncourage = false;
				int countFirstEncourage = 0;
				int firstEncouragePrize = 20000000;
				if (last4.equals(last4Special)) {
					firstEncourage = true;
					countFirstEncourage = 1;
				}

				// Kiem tra giai khuyen khich   ==> chua hoan thanh noi dung nay
				boolean secondEncourage = false;
				int countSecondEncourage = 0;
				int secondEncouragePrize = 40000;
				int countMatch = 0;
				if (!firstEncourage) {
					String[] charSpecialPrize = result.getNumber_1().split("");
					String[] charTicketNumber = ticket_number.split("");
					
					
					for (int i = 0; i < charTicketNumber.length; i++) {
						for (int j = 0; j <charSpecialPrize.length; j++) {
							if (charTicketNumber[i].equals(charSpecialPrize[j])) {
								countMatch += 1; 
								j = charSpecialPrize.length;
							}
						}
					}
					if (countMatch == 4) {
						secondEncourage = true;
						countSecondEncourage = 1;	
					}
				}

				// Kiem tra xem da trung nhung giai loai nao
				if (is7prize) {
					query7 = " Giải Bảy";
				}
				if (is6prize) {
					query6 = " Giải Sáu";
				}
				if (is5prize) {
					query5 = " Giải Năm";
				}
				if (is4prize) {
					query4 = " Giải Tư";
				}
				if (is3prize) {
					query3 = " Giải Ba";
				}
				if (is2prize) {
					query2 = " Giải Nhì";
				}
				if (is1prize) {
					query1 = " Giải Nhất";
				}
				if (isSpecialPrize) {
					queryDB = " Giải Đặc biệt";
				}
				
				if (isCharPrize) {
					queryChar = " Giải Ký tự may mắn";
				}
				if (firstEncourage) {
					queryKK1 = " Giải phụ Đặc biệt";
				}
				if (secondEncourage) {
					queryKK2 = "Giải Khuyến khích";
				}

				finalPrize = queryDB + query1 + query2 + query3 + query4 + query5 + query6 + query7 + queryChar;
				totalPrize = prize7 * count7 + prize6 * count6 + prize5 * count5 + prize4 * count4 + prize3 * count3
						+ prize2 * count2 + prize1 * count1 + prizeSpecial * countSpecial + countCharPrize * charPrize;
				
				if (!isSpecialPrize) {
					finalPrize += queryKK1 + queryKK2;
					totalPrize += countFirstEncourage * firstEncouragePrize
							+ countSecondEncourage * secondEncouragePrize;
				}
				
				Transaction transaction = new model.Transaction();
				transaction.setAccount_id(account_id);
				transaction.setCompany_id(company_id);
				transaction.setCompany_province(new DAOCompany().getProvince(company_id));
				transaction.setDraw_date(draw_date);
				transaction.setTicket_number(ticket_number);
				transaction.setTicket_char(ticket_char);
				transaction.setFinalPrize(finalPrize);
				transaction.setTotalPrize(totalPrize);
				
				String queryResult = new DAOTransaction().saveTransaction(transaction);
				
				request.setAttribute("transaction", transaction);
				// Xu li gui tra ket qua
				if (finalPrize != "") {
					request.setAttribute("win", finalPrize);
					request.getRequestDispatcher("/views/checkticket.jsp").forward(request, response);
				} else {
					request.setAttribute("nowin",
							"Rất tiếc vé số của bạn không trúng giải ! Chúc bạn may mắn lần sau!...");
					request.getRequestDispatcher("/views/checkticket.jsp").forward(request, response);
				}
			}
		} 
		//Hien lich su do so gan day khi click vao phan Do so
		else if (action.equals("view")) {
			String account_id = "0";
			
			List<Transaction> trans;
			try {
				trans = new DAOTransaction().getTransaction(account_id);
				
				int start = 1;
				int end = 15; 
				
				List<Transaction> tranList = new ArrayList<Transaction>();
				
				for (int i = start; i <= end; i++) {
					tranList.add(trans.get(i-1));
					if (i > end) {return;}
				}
				
				request.setAttribute("transactions", tranList);
				request.getRequestDispatcher("/views/checkticket.jsp").forward(request, response);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
