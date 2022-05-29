package model;

public class Company {
	private int company_id;
	private String company_name;
	private String company_province;
	private String company_address;
	

	public Company() {
		super();
	}
	
	public Company(int company_id, String company_name, String company_province, String company_address) {
		super();
		this.company_id = company_id;
		this.company_name = company_name;
		this.company_province = company_province;
		this.company_address = company_address;
	}

	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCompany_province() {
		return company_province;
	}

	public void setCompany_province(String company_province) {
		this.company_province = company_province;
	}

	public String getCompany_address() {
		return company_address;
	}

	public void setCompany_address(String company_address) {
		this.company_address = company_address;
	}
	
	
}
