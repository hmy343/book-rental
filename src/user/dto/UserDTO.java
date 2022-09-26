package user.dto;

import java.sql.Date;

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
	private String usGrade;
	private int usOverdue;
	private Date usJoinDate;
	private int usEmailAgree;
	private Date usBirtyDay;
	private int usStatus;
	private Date usLastAccess;
	
	
	public UserDTO(String usId, String usGrade) {
		super();
		this.usId = usId;
		this.usGrade = usGrade;
	}
	
	
}