package user.dto;

import java.sql.Date;

import enumtype.UsGradeEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserDTO {
	private String usId;
	private String usPw;
	private String usEmail;
	private String usPhnum;
	private UsGradeEnum usGrade;
	private int usOverdue;
	private Date usJoinDate;
	private int usEmailAgree;
	private Date usBirtyDay;
	private int usStatus;
	private Date usLastAccess;
	
	
	public UserDTO(String usId, UsGradeEnum usGrade) {
		super();
		this.usId = usId;
		this.usGrade = usGrade;
	}


	public UserDTO(String usId, String usPw, String usEmail, String usPhnum, Date usBirtyDay) {
		super();
		this.usId = usId;
		this.usPw = usPw;
		this.usEmail = usEmail;
		this.usPhnum = usPhnum;
		this.usBirtyDay = usBirtyDay;
	}


	public UserDTO(String usId, String usPw, String usEmail, String usPhnum, Date usBirtyDay, int usEmailAgree) {
		super();
		this.usId = usId;
		this.usPw = usPw;
		this.usEmail = usEmail;
		this.usPhnum = usPhnum;
		this.usEmailAgree = usEmailAgree;
		this.usBirtyDay = usBirtyDay;
	}


//	public UserDTO(String usId, String usPw, String usEmail, String usPhnum, String usGrade, int usOverdue,
//			Date usJoinDate, int usEmailAgree, Date usBirtyDay, int usStatus, Date usLastAccess) {
//		super();
//		this.usId = usId;
//		this.usPw = usPw;
//		this.usEmail = usEmail;
//		this.usPhnum = usPhnum;
//		this.usGrade = UsGradeEnum.valueOf(usGrade).getGrade();
//		this.usOverdue = usOverdue;
//		this.usJoinDate = usJoinDate;
//		this.usEmailAgree = usEmailAgree;
//		this.usBirtyDay = usBirtyDay;
//		this.usStatus = usStatus;
//		this.usLastAccess = usLastAccess;
//	}
	
	
	
	
	
}