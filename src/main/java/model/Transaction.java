package model;

public class Transaction {
	private String transaction_id;
	private String account_id;
	private String company_id;
	private String company_province;
	private String ticket_number;
	private String ticket_char;
	private String transaction_date;
	private String finalPrize;
	private int totalPrize;
	private String draw_date;
	private String result_id;
	
	
	public Transaction() {
		
	}

	public String getTransaction_id() {
		return transaction_id;
	}

	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}

	public String getAccount_id() {
		return account_id;
	}

	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public String getTicket_number() {
		return ticket_number;
	}

	public void setTicket_number(String ticket_number) {
		this.ticket_number = ticket_number;
	}

	public String getTransaction_date() {
		return transaction_date;
	}

	public void setTransaction_date(String transaction_date) {
		this.transaction_date = transaction_date;
	}


	public String getDraw_date() {
		return draw_date;
	}

	public void setDraw_date(String draw_date) {
		this.draw_date = draw_date;
	}

	public String getResult_id() {
		return result_id;
	}

	public void setResult_id(String result_id) {
		this.result_id = result_id;
	}

	public String getCompany_province() {
		return company_province;
	}

	public void setCompany_province(String company_province) {
		this.company_province = company_province;
	}

	public String getTicket_char() {
		return ticket_char;
	}

	public void setTicket_char(String ticket_char) {
		this.ticket_char = ticket_char;
	}

	public String getFinalPrize() {
		return finalPrize;
	}

	public void setFinalPrize(String finalPrize) {
		this.finalPrize = finalPrize;
	}

	public int getTotalPrize() {
		return totalPrize;
	}

	public void setTotalPrize(int totalPrize) {
		this.totalPrize = totalPrize;
	}
	
	
}
