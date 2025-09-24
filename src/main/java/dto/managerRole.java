package dto;

public class managerRole {
	
	Integer roleId;	// 역할번호
	String roleName; // 역할
	
	public managerRole() {
		
	}
	public managerRole(Integer roleId, String roleName) {
		super();
		this.roleId = roleId;
		this.roleName = roleName;
	}
	
	@Override
	public String toString() {
		return "managerRole [roleId=" + roleId + ", roleName=" + roleName + "]";
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	

}
