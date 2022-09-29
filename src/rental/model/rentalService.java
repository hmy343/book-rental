package rental.model;

import java.sql.SQLException;


public class rentalService {
	public static boolean addData(RentalDTO rentalDTOArr) throws SQLException {
		boolean result = RentalDAO.insertRental(rentalDTOArr);
		return result;
	}
}
