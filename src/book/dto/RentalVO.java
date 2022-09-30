package book.dto;

import java.sql.Date;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
//@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RentalVO {
	private long bkISBN;
	private String usId;
	private Date rtDateTime;
	private Date rtReDate;
	private Date rtReCompDate;
	private int rtStatus;
	private String usGrade;
	private String bkTitle;
	
	public RentalVO(long bkISBN, String usId, Date rtDateTime, Date rtReDate, Date rtReCompDate, int rtStatus,
			String usGrade, String bkTitle) {
		super();
		this.bkISBN = bkISBN;
		this.usId = usId;
		this.rtDateTime = rtDateTime;
		this.rtReDate = rtReDate;
		this.rtReCompDate = rtReCompDate;
		this.rtStatus = rtStatus;
		this.usGrade = usGrade;
		this.bkTitle = bkTitle;
	}


	
	
}
