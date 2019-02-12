package site.model;

import java.io.Serializable;

public class ManageEntity implements Serializable {
		private String manageId;
		private String managePwd;
		private int manageLevel;
		public String getManageId() {
			return manageId;
		}
		public void setManageId(String manageId) {
			this.manageId = manageId;
		}
		public String getManagePwd() {
			return managePwd;
		}
		public void setManagePwd(String managePwd) {
			this.managePwd = managePwd;
		}
		public int getManageLevel() {
			return manageLevel;
		}
		public void setManageLevel(int manageLevel) {
			this.manageLevel = manageLevel;
		}
		
}
