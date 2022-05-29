package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import command.InputDate;
import context.DBContext;
import model.Company;
import model.Result;


public class DAOResult {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public Result getResult() {
		String query = "Select * from Results\n"
						+ "Where result_id = (select max(result_id) from Results)";
		Result result = new Result();
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				result = new Result(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
						rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17),
						rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23),
						rs.getString(24), rs.getString(25), rs.getString(26), rs.getString(27), rs.getString(28), rs.getString(29), rs.getString(30),
						rs.getString(31), rs.getString(32), rs.getString(33), rs.getString(34), rs.getString(35), rs.getString(36),
						rs.getString(37));
			}
			return result;
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//Hien thi ten cong ty
	public String getProvince(String company_id) {
		String query = "Select company_province from Companies where company_id=?";
		//int id = Integer.parseInt(company_id);

		String province = null;
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, company_id);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				province = rs.getString(1);
			}
			
			return province;
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	//Nhap du lieu ket qua quay thuong
	public String inputResult(Result result) {
		String query = "SET IDENTITY_INSERT [dbo].[Results] OFF\n"  
				+ "Insert into Results (company_id, draw_date, Number_1, Number_2, Number_3,\n"
				+ "    Number_4, Number_5, Number_6, Number_7, Number_8, Number_9, Number_10,\n"
				+ "    Number_11, Number_12, Number_13, Number_14, Number_15, Number_16, Number_17,\n"
				+ "    Number_18, Number_19, Number_20, Number_21, Number_22, Number_23, Number_24,\n"
				+ "    Number_25, Number_26, Number_27, char_1, char_2, char_3, char_4, char_5, char_6)\n"
				+ "Values (\n"
				+ "    ?, ?, ?, ?, ?, \n"
				+ "    ?, ?, ?, ?, ?, ?, ?,\n"
				+ "    ?, ?, ?, ?, ?, ?, ?,\n"
				+ "    ?, ?, ?, ?, ?, ?, ?,\n"
				+ "    ?, ?, ?, ?, ?, ?, ?, ?, ?)\n"
				+ "SET IDENTITY_INSERT [dbo].[Results] ON";
		
		String queryResult = null;
		
		try {
			conn = new DBContext().getConnection();
			
			ps = conn.prepareStatement(query);
			
			ps.setInt(1, (int) Integer.valueOf(result.getCompany_id()));
			ps.setDate(2, java.sql.Date.valueOf(result.getDraw_date()));
			ps.setString(3, result.getNumber_1());
			ps.setString(4, result.getNumber_2());
			ps.setString(5, result.getNumber_3());
			ps.setString(6, result.getNumber_4());
			ps.setString(7, result.getNumber_5());
			ps.setString(8, result.getNumber_6());
			ps.setString(9, result.getNumber_7());
			ps.setString(10, result.getNumber_8());
			ps.setString(11, result.getNumber_9());
			ps.setString(12, result.getNumber_10());
			ps.setString(13, result.getNumber_11());
			ps.setString(14, result.getNumber_12());
			ps.setString(15, result.getNumber_13());
			ps.setString(16, result.getNumber_14());
			ps.setString(17, result.getNumber_15());
			ps.setString(18, result.getNumber_16());
			ps.setString(19, result.getNumber_17());
			ps.setString(20, result.getNumber_18());
			ps.setString(21, result.getNumber_19());
			ps.setString(22, result.getNumber_20());
			ps.setString(23, result.getNumber_21());
			ps.setString(24, result.getNumber_22());
			ps.setString(25, result.getNumber_23());
			ps.setString(26, result.getNumber_24());
			ps.setString(27, result.getNumber_25());
			ps.setString(28, result.getNumber_26());
			ps.setString(29, result.getNumber_27());
			ps.setString(30, result.getChar_1());
			ps.setString(31, result.getChar_2());
			ps.setString(32, result.getChar_3());
			ps.setString(33, result.getChar_4());
			ps.setString(34, result.getChar_5());
			ps.setString(35, result.getChar_6());
			
			ps.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			queryResult = "Nhập dữ liệu không thành công!";
			e.printStackTrace();
		} 
		return queryResult;
	}
	
	
	//Lay danh sach cac ket qua quay thuong
	public List<Result> getInputtedData() {
		String query = "Select Results.company_id, company_province, result_id, draw_date, published_date\n"
						+ "From Results\n"
						+ "Join Companies\n"
						+ "On Results.company_id = Companies.company_id\n"
						+ "Order by published_date DESC";	
		
		List<Result> inputtedList = new ArrayList<>();
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Result inputtedResult = new Result();
				inputtedResult.setCompany_id(rs.getString(1));
				inputtedResult.setCompany_province(rs.getString(2));
				inputtedResult.setResult_id(rs.getString(3));
				inputtedResult.setDraw_date(rs.getString(4));
				inputtedResult.setPublished_date(rs.getString(5));
				
				inputtedList.add(inputtedResult);
			}
			
			return inputtedList;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	//Xoa du lieu quay thuong da nhap
	public String deleteResult(String result_id) {
		String query = "Delete from Results\n"
						+ "where result_id = ?";
		
		String queryResult = null;
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, result_id);
			ps.executeUpdate();
			
			queryResult = "Xóa dữ liệu thành công";
			
		} catch (ClassNotFoundException | SQLException e) {
			queryResult = "Xóa dữ liệu không thành công";
			e.printStackTrace();
		}
		return queryResult;
	}
	
	//Xem ket qua theo result_id
	public Result getResultView(String result_id) {
		String query = "Select * from results\n"
						+ "where result_id = ?";
		Result result = new Result();
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, result_id);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				result = new Result(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
						rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17),
						rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23),
						rs.getString(24), rs.getString(25), rs.getString(26), rs.getString(27), rs.getString(28), rs.getString(29), rs.getString(30),
						rs.getString(31), rs.getString(32), rs.getString(33), rs.getString(34), rs.getString(35), rs.getString(36),
						rs.getString(37));
		
			}
			return result;
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//Tra ve ket qua theo company_id va ngay quay thuong
	public List<Result> searchResult(String company_id, String draw_date) {
		String query = null;
		
		if (draw_date != "") {
			query = "Select results.company_id, company_province, result_id, draw_date, published_date from results\n"
						+ "Join Companies\n"
						+ "on results.company_id = companies.company_id \n"
						+ "where results.company_id=? and draw_date=? \n"
						+ "order by results.draw_date desc";
		} else if (draw_date == "") {
			query = "Select results.company_id, company_province, result_id, draw_date, published_date from results\n"
					+ "Join Companies\n"
					+ "on results.company_id = companies.company_id\n"
					+ "where results.company_id=? \n"
					+ "order by results.draw_date desc";
		}
		
		List<Result> resultList = new ArrayList<>();
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, company_id);
			if (draw_date != "") {
			ps.setString(2, draw_date);}
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Result result = new Result();
				result.setCompany_id(rs.getString(1));
				result.setCompany_province(rs.getString(2));
				result.setResult_id(rs.getString(3));
				result.setDraw_date(rs.getString(4));
				result.setPublished_date(rs.getString(5));
				resultList.add(result);
			}
			
			return resultList;
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//Sua ket qua
	public void saveEdittedResult(Result result) {
		String query = "Update Results\n"
						+ "Set Number_1=?,Number_2=?,Number_3=?,Number_4=?,Number_5=?,Number_6=?,Number_7=?,Number_8=?,Number_9=?,\n"
						+ "Number_10=?,Number_11=?,Number_12=?,Number_13=?,Number_14=?,Number_15=?,Number_16=?,Number_17=?,Number_18=?,\n"
						+ "Number_19=?,Number_20=?,Number_21=?,Number_22=?,Number_23=?,Number_24=?,Number_25=?,Number_26=?,Number_27=?,\n"
						+ "char_1=?, char_2=?, char_3=?, char_4=?, char_5=?, char_6=?\n"
						+ "where result_id = ?";	
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, result.getNumber_1());
			ps.setString(2, result.getNumber_2());
			ps.setString(3, result.getNumber_3());
			ps.setString(4, result.getNumber_4());
			ps.setString(5, result.getNumber_5());
			ps.setString(6, result.getNumber_6());
			ps.setString(7, result.getNumber_7());
			ps.setString(8, result.getNumber_8());
			ps.setString(9, result.getNumber_9());
			ps.setString(10, result.getNumber_10());
			ps.setString(11, result.getNumber_11());
			ps.setString(12, result.getNumber_12());
			ps.setString(13, result.getNumber_13());
			ps.setString(14, result.getNumber_14());
			ps.setString(15, result.getNumber_15());
			ps.setString(16, result.getNumber_16());
			ps.setString(17, result.getNumber_17());
			ps.setString(18, result.getNumber_18());
			ps.setString(19, result.getNumber_19());
			ps.setString(20, result.getNumber_20());
			ps.setString(21, result.getNumber_21());
			ps.setString(22, result.getNumber_22());
			ps.setString(23, result.getNumber_23());
			ps.setString(24, result.getNumber_24());
			ps.setString(25, result.getNumber_25());
			ps.setString(26, result.getNumber_26());
			ps.setString(27, result.getNumber_27());
			ps.setString(28, result.getChar_1());
			ps.setString(29, result.getChar_2());
			ps.setString(30, result.getChar_3());
			ps.setString(31, result.getChar_4());
			ps.setString(32, result.getChar_5());
			ps.setString(33, result.getChar_6());
			ps.setString(34, result.getResult_id());
			
			new InputDate().update(result.getResult_id());
	        
			ps.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} 

	//Xoa nhieu phan tu cung luc
	public String deleteMulti(String[] idList) {
		String query = "Begin Transaction \n"
						+"Delete from Results \n"
						+ "where result_id in (?";
		int deleteQtt = idList.length;
		
		String queryResult = null;
		
		//Xac dinh so luong phan tu
		for (int i = 1; i < deleteQtt; i++) {
			query = query + ", ?";
		}
		
		query = query + ") \n"
				+"Commit";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);				
			ps.setString(1, idList[0]);
			for (int i = 1; i < deleteQtt; i++) {
				ps.setString(i+1, idList[i]);
			}
				ps.executeUpdate();
				
				queryResult = "Xóa dữ liệu thành công";
				
				
			} catch (ClassNotFoundException | SQLException e) {
				queryResult = "Xóa dữ liệu không thành công";
				e.printStackTrace();
			}
		return queryResult;
	}
	
	//Nhan ket qua de hien thi len trang chu
	public List<Result> getTop7Result() {
		List<Result> resultList = new ArrayList<>();
		
		String query = "Select Top(7) * from Results order by draw_date desc";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Result result = new Result(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
						rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17),
						rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23),
						rs.getString(24), rs.getString(25), rs.getString(26), rs.getString(27), rs.getString(28), rs.getString(29), rs.getString(30),
						rs.getString(31), rs.getString(32), rs.getString(33), rs.getString(34), rs.getString(35), rs.getString(36),
						rs.getString(37));
				
				Company company = new DAOCompany().getCompany(result.getCompany_id().toString());
				result.setCompany_province(company.getCompany_province());
				resultList.add(result);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return resultList;
	}
	
	//Lay du lieu ket qua theo tinh
	public List<Result> getTop7ResultById(String company_id) {
		List<Result> resultList = new ArrayList<>();
		
		String query = "Select Top(7) * from Results where company_id = ? order by draw_date desc";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, company_id);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Result result = new Result(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
						rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17),
						rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23),
						rs.getString(24), rs.getString(25), rs.getString(26), rs.getString(27), rs.getString(28), rs.getString(29), rs.getString(30),
						rs.getString(31), rs.getString(32), rs.getString(33), rs.getString(34), rs.getString(35), rs.getString(36),
						rs.getString(37));
				
				Company company = new DAOCompany().getCompany(result.getCompany_id().toString());
				result.setCompany_province(company.getCompany_province());
				resultList.add(result);
			}
 			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return resultList;
	}
	
	//Thong ke so luong ket qua da dang
	public int getTotalResult() {
		String query = "select count(*) from Results";
		int totalResult = 0;
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				totalResult = rs.getInt(1);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalResult;
	}
	
	//Lay ngay ket qua cuoi cung
	public String getLatestDate() {
		String query = "Select top(1) draw_date from Results \n"
						+ "order by draw_date desc";
		String latestDate = null;
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				latestDate = rs.getString(1);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return latestDate;
	}
	
	//Tra ve ket qua khi do so
	public Result getResultForChecking(String draw_date, String company_id) {
		Result result = new Result();
		String query = "Select * from Results where draw_date = ? and company_id = ?";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, draw_date);
			ps.setString(2, company_id);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				result.setResult_id(rs.getString(1));
				result.setCompany_id(rs.getString(2));
				result.setDraw_date(rs.getString(3));
				result.setNumber_1(rs.getString(5));
				result.setNumber_2(rs.getString(6));
				result.setNumber_3(rs.getString(7));
				result.setNumber_4(rs.getString(8));
				result.setNumber_5(rs.getString(9));
				result.setNumber_6(rs.getString(10));
				result.setNumber_7(rs.getString(11));
				result.setNumber_8(rs.getString(12));
				result.setNumber_9(rs.getString(13));
				result.setNumber_10(rs.getString(14));
				result.setNumber_11(rs.getString(15));
				result.setNumber_12(rs.getString(16));
				result.setNumber_13(rs.getString(17));
				result.setNumber_14(rs.getString(18));
				result.setNumber_15(rs.getString(19));
				result.setNumber_16(rs.getString(20));
				result.setNumber_17(rs.getString(21));
				result.setNumber_18(rs.getString(22));
				result.setNumber_19(rs.getString(23));
				result.setNumber_20(rs.getString(24));
				result.setNumber_21(rs.getString(25));
				result.setNumber_22(rs.getString(26));
				result.setNumber_23(rs.getString(27));
				result.setNumber_24(rs.getString(28));
				result.setNumber_25(rs.getString(29));
				result.setNumber_26(rs.getString(30));
				result.setNumber_27(rs.getString(31));
				result.setChar_1(rs.getString(32));
				result.setChar_2(rs.getString(33));
				result.setChar_3(rs.getString(34));
				result.setChar_4(rs.getString(35));
				result.setChar_5(rs.getString(36));
				result.setChar_6(rs.getString(37));
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//Lay ket qua quay thuong theo ngay thang
	public List<Result> getResultByDate(String date) {
		List<Result> resultList = new ArrayList<>();
		
		String query = "Select * from Results where draw_date = ?";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, date);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Result result = new Result();
				result.setResult_id(rs.getString(1));
				result.setCompany_id(rs.getString(2));
				result.setDraw_date(rs.getString(3));
				result.setNumber_1(rs.getString(5));
				result.setNumber_2(rs.getString(6));
				result.setNumber_3(rs.getString(7));
				result.setNumber_4(rs.getString(8));
				result.setNumber_5(rs.getString(9));
				result.setNumber_6(rs.getString(10));
				result.setNumber_7(rs.getString(11));
				result.setNumber_8(rs.getString(12));
				result.setNumber_9(rs.getString(13));
				result.setNumber_10(rs.getString(14));
				result.setNumber_11(rs.getString(15));
				result.setNumber_12(rs.getString(16));
				result.setNumber_13(rs.getString(17));
				result.setNumber_14(rs.getString(18));
				result.setNumber_15(rs.getString(19));
				result.setNumber_16(rs.getString(20));
				result.setNumber_17(rs.getString(21));
				result.setNumber_18(rs.getString(22));
				result.setNumber_19(rs.getString(23));
				result.setNumber_20(rs.getString(24));
				result.setNumber_21(rs.getString(25));
				result.setNumber_22(rs.getString(26));
				result.setNumber_23(rs.getString(27));
				result.setNumber_24(rs.getString(28));
				result.setNumber_25(rs.getString(29));
				result.setNumber_26(rs.getString(30));
				result.setNumber_27(rs.getString(31));
				result.setChar_1(rs.getString(32));
				result.setChar_2(rs.getString(33));
				result.setChar_3(rs.getString(34));
				result.setChar_4(rs.getString(35));
				result.setChar_5(rs.getString(36));
				result.setChar_6(rs.getString(37));
				result.setCompany_province(new DAOCompany().getProvince(rs.getString(2)));
				
				resultList.add(result);
			}
				
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		return resultList; 
	}
	
}
