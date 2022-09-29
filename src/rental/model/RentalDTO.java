package rental.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RentalDTO {
	long bkIsbn;
	String usId;
	Date rtDatetime;
	Date rtRedate;
	Date rtRecompdate;
	long rtStatus;
	
	
	public RentalDTO(long bkIsbn, String usId) {
		super();
		this.bkIsbn = bkIsbn;
		this.usId = usId;
	}
	
	
}

