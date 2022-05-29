package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Transaction;

public class DAOTransaction {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	//Luu du lieu vao database
	public String saveTransaction(Transaction trans) {
		String query = "Insert into Transactions (account_id, company_id, ticket_number, result, draw_date, prize, ticket_char)\n"
						+ "values (?, ?, ?, ?, ?, ?, ?)";
		
		String finalPrize = null;
		if (trans.getFinalPrize() == "") {finalPrize = "Không trúng thưởng";}
		
		else {finalPrize = trans.getFinalPrize();}
		
		String queryResult = null;
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, trans.getAccount_id());
			ps.setString(2, trans.getCompany_id());
			ps.setString(3, trans.getTicket_number());
			ps.setString(4, finalPrize);
			ps.setString(5, trans.getDraw_date());
			ps.setInt(6, trans.getTotalPrize());
			ps.setString(7, trans.getTicket_char());

			ps.executeUpdate();
			
			queryResult = "Thanh cong";
			
		} catch (ClassNotFoundException | SQLException e) {
			queryResult = "Loi ko nhap duoc du lieu transaction";
			e.printStackTrace();
		}
		return queryResult;
	}
	
	public List<Transaction> getTransaction(String account_id) throws ParseException {
		String query;
		
		if (account_id == "0") {
			query = "select * from Transactions order by transaction_date desc";
		} else {
			query = "select * from Transactions where account_id = ? \n"
					+ "order by transaction_date desc";
		}
		
		List<Transaction> listTrans = new ArrayList<>();
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			
			if (account_id != "0") {
			ps.setString(1, account_id); } 
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Transaction tran = new Transaction();
				tran.setTransaction_id(rs.getString(1));
				tran.setAccount_id(rs.getString(2));
				tran.setCompany_id(rs.getString(3));
				tran.setCompany_province(new DAOCompany().getProvince(rs.getString(3)));
				tran.setTicket_number(rs.getString(4));
				tran.setFinalPrize(rs.getString(5));
				tran.setDraw_date(rs.getString(6));
				tran.setTotalPrize(rs.getInt(7));
				tran.setTicket_char(rs.getString(8));
				
				if (rs.getString(9) != null) {
					String date = rs.getString(9).substring(0, 10);
					tran.setTransaction_date(date);
				}
				listTrans.add(tran);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Loi tu DAOTicket/getTransaction");
			e.printStackTrace();
		}
		return listTrans;
	}
	
	//Xoa du lieu
	public String deleteTrans(String[] transId) {
		String queryResult = null;
		String query = "Delete from Transactions where transaction_id in (?";
		
		for (int i = 1; i < transId.length; i++) {
			query += " ,?"; 
		}
		query += ");";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			for (int i = 0; i < transId.length; i++) {
				ps.setString(i+1, transId[i]);
			}
			ps.executeUpdate();
			
			queryResult = "Xóa dữ liệu thành công";
			
		} catch (ClassNotFoundException | SQLException e) {
			queryResult = "Xóa dữ liệu thất bại. Vui lòng liên hệ Quản trị viên";
			e.printStackTrace();
		}
		return queryResult;
	}
	
	//lay thong tin ve tinh co truy cuu nhieu nhat
	public String getMostCompany() {
		String query = "select top(1) company_id from Transactions\n"
						+ "group by company_id\n"
						+ "order by count(*) desc";
		String company_province = null;
		String company_id = null;
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				company_id = rs.getString(1);
			}
			
			company_province = new DAOCompany().getProvince(company_id);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return company_province;
	}
	
	//lay thong tin ve tinh co truy cuu it nhat
	public String getLastCompany() {
		String query = "select top(1) company_id from Transactions\n"
						+ "group by company_id\n"
						+ "order by count(*)";
		String company_province = null;
		String company_id = null;
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				company_id = rs.getString(1);
			}
			
			company_province = new DAOCompany().getProvince(company_id);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return company_province;
	}
}
