package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Account;

public class DAOAccount {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	//Lay du lieu tu database
	public List<Account> getAccountList() {
		String query = "Select Top(10) * from Accounts order by account_id";
		List<Account> accountList = new ArrayList<>(); 
		
		try {
			conn = new DBContext().getConnection();
			
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Account account = new Account(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),
												rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				
				accountList.add(account);
			}
			
			return accountList;
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//Lay du lieu 1 account
	public Account getAccount(String id) {
		String query = "Select * from Accounts where account_id = ?";
		int account_id = Integer.parseInt(id);
		Account account = new Account();
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, account_id);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				account = new Account(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
			}
			
			return account;
	
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	//Cap nhat thong tin vai tro cua account
	public String updateRole(Account acc) {
		String query = "Update Accounts\n"
						+ "set role=?\n"
						+ "where account_id = ?";
		String queryResult = null;
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, acc.getRole());
			ps.setInt(2, acc.getAccount_id());
			ps.executeUpdate();
			
			queryResult = "Cập nhật dữ liệu thành công";
			
		} catch (ClassNotFoundException | SQLException e) {
			queryResult = "Cập nhật dữ liệu không thành công";
			e.printStackTrace();
		} 
		return queryResult;
	}
	
	//Xoa 1 account
	public String deleteAccount(String account_id) {
		String query = "Delete from Accounts Where account_id=?";
		int id = Integer.parseInt(account_id);
		String queryResult = null;
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();
			
			queryResult = "Xóa dữ liệu thành công!";
			
		} catch (ClassNotFoundException | SQLException e) {
			queryResult = "Xóa dữ liệu thất bại!";
			e.printStackTrace();
		} 
		return queryResult;
	}
	
	
	//Lay account theo username hoac so dien thoai
	public List<Account> searchAccount(String username, String phone){
		List<Account> accountList = new ArrayList<>();
		
		String query = "Select * from Accounts where ";
		
		if (username != "" && phone == "") {
			query = query + "username like ?";
		}
		else if (username == "" && phone != "") {
			query = query + "phone like ?";
		}
		else if (username != "" && phone != "" ) {
			query = query + "username like ? and phone like ?";
		}
		
		query = query + " order by account_id;";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			
			if (username != "" && phone == "") {
				ps.setString(1, "%"+username+"%");
			}
			else if (username == "" && phone != "") {
				ps.setString(1, "%"+phone+"%");
			}
			else if (username != "" && phone != "" ) {
				ps.setString(1, "%"+username+"%");
				ps.setString(2, "%"+phone+"%");
			}
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Account account = new Account(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));

				accountList.add(account);
			}
			return accountList;
			
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Loi");
			e.printStackTrace();
		}
		return null;
	}
	
	//Them account vao database
	public String addAccount(Account account) {
		String query = "SET IDENTITY_INSERT [dbo].[Accounts] OFF\n"  
				+ "Insert into Accounts (fullName, email, phone, username, password)\n"
				+ "Values (?, ?, ?, ?, ?) \n"
				+ "SET IDENTITY_INSERT [dbo].[Accounts] ON";
		
		String queryResult = null;
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, account.getFullName());
			ps.setString(2, account.getEmail());
			ps.setString(3, account.getPhone());
			ps.setString(4, account.getUsername());
			ps.setString(5, account.getPassword());
			
			ps.executeUpdate();
			
			queryResult = "Cập nhật dữ liệu thành công";
		} catch (ClassNotFoundException | SQLException e) {
			queryResult = "Cập nhật dữ liệu thất bại !";
			e.printStackTrace();
		}
		return queryResult;
	} 
	
	//Update mat khau nguoi dung sau khi reset
	public String updatePass(Account account) {
		String query = "Update Accounts \n"
					+"Set password = ? \n"
					+"Where account_id = ?";
		
		String queryResult = null;
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, account.getPassword());
			ps.setInt(2, account.getAccount_id());
			ps.executeUpdate();
			
			queryResult = "Reset mật khẩu thành công!";
			
		} catch (ClassNotFoundException | SQLException e) {
			queryResult = "Reset mật khẩu không thành công!";
			e.printStackTrace();
		}
		return queryResult;
	}
	
	//Tim kiem xem email co trong du lieu hay khong
	public int searchEmail(String email) {
		int emailRegistered = 0;
		String query = "Select count(*) from Accounts where email like ?";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				emailRegistered = rs.getInt(1);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return emailRegistered;
	}
	
	//Tim kiem co so du lieu theo username
	public int searchUsername(String username) {
		int usernameRegistered = 0;
		String query = "Select count(*) from Accounts where username like ?";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				usernameRegistered = rs.getInt(1);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return usernameRegistered;
	}
	
	//Tim kiem account theo username
	public Account searchAccountByUsername(String username) {
		String query = "Select * from Accounts where username = ?";
		Account account = new Account();
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				account.setAccount_id(rs.getInt(1));
				account.setFullName(rs.getString(2));
				account.setUsername(rs.getString(5));
				account.setPassword(rs.getString(6));
				account.setRole(rs.getString(7));
				account.setVerified(rs.getString(8));
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return account;
	}
	
	//Tim kiem account theo email
	public Account searchAccountByEmail(String email) {
		String query = "Select * from Accounts where email like ?";
		Account account = new Account();
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				account.setAccount_id(rs.getInt(1));
				account.setFullName(rs.getString(2));
				account.setEmail(rs.getString(3));
				account.setPassword(rs.getString(6));
				account.setVerified(rs.getString(8));
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return account;
	}
	
	//update trang thai online cua user
	public void userOnline(int account_id) {
		String query = "Update Accounts\n"
					+ "set online = 1 where account_id = ?";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, account_id);
			ps.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//update trang thai offline cua user
	public void userOffline(String account_id) {
		String query = "Update Accounts\n"
				+ "set online = 0 where account_id = ?";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, account_id);
			ps.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//Update thong tin user
	public String updateUserInfo(Account account) {
		String query = "Update Accounts \n"
					+"set fullName = ?, phone = ?, role = ? \n"
					+"where account_id=?";
		
		String queryResult = null;
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, account.getFullName());
			ps.setString(2, account.getPhone());
			ps.setString(3, account.getRole());
			ps.setInt(4, account.getAccount_id());
			ps.executeUpdate();
			
			queryResult = "Cập nhật dữ liệu thành công.";
			
		} catch (ClassNotFoundException | SQLException e) {
			queryResult = "Cập nhật dữ liệu không thành công.";
			e.printStackTrace();
		}
		return queryResult;
	}
	//Update pass theo request tu user
	public String changePass(Account account) {
		String query = "Update Accounts \n"
					+"set password = ?, verified = ? where account_id = ?";
		String queryResult = null;
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, account.getPassword());
			ps.setString(2, account.getVerified());
			ps.setInt(3, account.getAccount_id());
			ps.executeUpdate();
			
			queryResult = "Đổi mật khẩu thành công";
			
		} catch (ClassNotFoundException | SQLException e) {
			queryResult = "Đổi mật khẩu không thành công";
			e.printStackTrace();
		}
		return queryResult;
	}
	
	//Nhan cac gia tri ve vai tro
	public List<String> getRoleList() {
		String query = "Select distinct role from Accounts";
		List<String> roleList = new ArrayList<>();
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				String role = rs.getString(1);
				roleList.add(role);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Không tìm được danh sach vai tro.");
			e.printStackTrace();
		}
		return roleList;
	}
	
	//Thong ke Tong so luong thanh vien
	public int getTotalAccount() {
	String query = "select count(*) from Accounts";
	int totalAccount = 0;
	
	try {
		conn = new DBContext().getConnection();
		ps = conn.prepareStatement(query);
		rs = ps.executeQuery();
		
		while (rs.next()) {
			totalAccount = rs.getInt(1);
		}
		
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return totalAccount;
	}
	
	//Thong ke tong so luong thanh vien dang online
	public int getTotalOnlineAccount() {
		String query = "Select count(*) from Accounts where online like '1'";
		int totalAccount = 0;
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				totalAccount = rs.getInt(1);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalAccount;	
	}
	
	//Thong ke tong so luong thanh vien dang offline
	public int getTotalOfflineAccount() {
		String query = "select count(*) from Accounts where online like '0'";
		int totalAccount = 0;
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				totalAccount = rs.getInt(1);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalAccount;
	}
	
	//Thong ke so luong thanh vien dang ko xac dinh
	public int getTotalOtherAccount() {
	String query = "select count(*) from Accounts where online is null";
	int totalAccount = 0;
	
	try {
		conn = new DBContext().getConnection();
		ps = conn.prepareStatement(query);
		rs = ps.executeQuery();
		
		while (rs.next()) {
			totalAccount = rs.getInt(1);
		}
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return totalAccount;
	}
	
	//Lay du lieu cho phan trang
	public List<Account> pagination(int index) {
		String query = "WITH Top10Accounts AS (\n"
						+ "SELECT *, ROW_NUMBER() OVER (ORDER BY Account_id) AS 'RowNumber'\n"
						+ "FROM Accounts) \n"
						+ "SELECT * \n"
						+ "FROM Top10Accounts \n"
						+ "WHERE RowNumber BETWEEN ? AND ?;";
		List<Account> accountList = new ArrayList<>(); 
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, index*10+1);
			ps.setInt(2, (index+1)*10);
			rs = ps.executeQuery();
				
			while (rs.next()) {
				Account account = new Account(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),
													rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
					
				accountList.add(account);
			}
			return accountList;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//Lay du lieu ve user co lien ket voi bang khac khong
	public int linkedAccount(String account_id) {
		int count = 0;
		String query = "select count(*) from Transactions where account_id = ?";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, account_id);
			rs = ps.executeQuery();
			
			while (rs.next()) {count = rs.getInt(1);}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
}
