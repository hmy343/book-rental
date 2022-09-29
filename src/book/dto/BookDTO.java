package book.dto;


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
public class BookDTO {
	long bkIsbn;
	String bkTitle;
	String bkContents;
	String bkUrl;
	Date bkDateTime;
	String bkAuthors;
	String bkThumbnail;
	String bkPublisher;
	int bkRtnum;
	
	public BookDTO(Object addData) {
	}
	
	public BookDTO(String bkTitle) {
		this.bkTitle = bkTitle;
	}

	public BookDTO(long bkIsbn, String bkTitle, String bkContents, String bkUrl, Date bkDateTime, String bkAuthors,
			String bkThumbnail, String bkPublisher) {
		super();
		this.bkIsbn = bkIsbn;
		this.bkTitle = bkTitle;
		this.bkContents = bkContents;
		this.bkUrl = bkUrl;
		this.bkDateTime = bkDateTime;
		this.bkAuthors = bkAuthors;
		this.bkThumbnail = bkThumbnail;
		this.bkPublisher = bkPublisher;
	}

	


}
