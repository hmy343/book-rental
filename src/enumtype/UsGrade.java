package enumtype;

public enum UsGrade {
	AD("AD", "Admin"),
	B("B", "Bronze"),
	S("S", "Silver"),
	G("G", "Gold"),
	P("P", "Platinum")	;

	private String gradeCode;
	private String grade;
	
	UsGrade(String gradeCode, String grade) {
		this.gradeCode = gradeCode;
		this.grade = grade;
	}
	
}
