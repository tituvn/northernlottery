package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Company;

public class DAOCompany {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	//Lay danh sach cac cong ty xo so tu database
	public List<Company> getCompanyList() {
		
		String query = "Select * from Companies";
		List<Company> companies = new ArrayList<Company>();

		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				companies.add(new Company(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getString(4)));
			}
			return companies;
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//Lay thong tin ve Cong ty theo company_id
	public Company getCompany(String id) {
		String query = "Select * from Companies where company_id=?";
		int company_id = Integer.parseInt(id); 
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, company_id);
			rs = ps.executeQuery();
			
			Company company = null;
			while (rs.next()) {
				company = new Company(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}
			return company;

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//Sua thong tin Cong ty xo so theo company_id
	public void editCompany(Company com) {
		String query = "UPDATE Companies\n"
						+"SET company_name=?, company_province=?, company_address=?\n"
						+"WHERE company_id=?;\n";
						
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, com.getCompany_name());
			ps.setString(2, com.getCompany_province());
			ps.setString(3, com.getCompany_address());
			ps.setInt(4, com.getCompany_id());
			ps.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//Xoa cong ty xo so tu database
	public String deleteCompany(String id) {
		String query = "Delete from Companies\n"
						+ "where company_id=?;";
		int company_id = Integer.parseInt(id);
		String queryResult = null;
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, company_id);
			ps.executeUpdate();
			
			queryResult = "Xóa dữ liệu thành công !";
			
		} catch (ClassNotFoundException | SQLException e) {
			queryResult = "Xóa dữ liệu không thành công !";
			e.printStackTrace();
		}
		return queryResult;
	}
	
	//Them moi cong ty xo so
	public void addCompany(Company com) {
		String query = "SET IDENTITY_INSERT [dbo].[Companies] OFF\n"
						+ "Insert into Companies (company_name, company_province, company_address)\n"
						+ "Values (?,?,?)\n"
						+ "SET IDENTITY_INSERT [dbo].[Companies] ON";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, com.getCompany_name());
			ps.setString(2, com.getCompany_province());
			ps.setString(3, com.getCompany_address());
			ps.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//Lay thong tin tinh cua company theo id
	public String getProvince(String company_id) {
		String query = "select company_province from Companies where company_id = ?";
		String company_province = null;
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, company_id);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				company_province = rs.getString(1);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return company_province;
	}
	
	
	//Kiem tra xem lieu 1 cong ty da duoc nhap du lieu hay khong
	public int linkedCompany(String company_id) {
		int count = 0;
		String query = "select count(*) from Results where company_id = ?";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, company_id);
			rs = ps.executeQuery();
			
			while (rs.next()) {count = rs.getInt(1);}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
}
