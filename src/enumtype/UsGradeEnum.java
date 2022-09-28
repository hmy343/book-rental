package enumtype;

public enum UsGradeEnum {
	AD("AD", "Admin"),
	B("B", "Bronze"),
	S("S", "Silver"),
	G("G", "Gold"),
	P("P", "Platinum");

	private String gradeCode;
	private String grade;
	
	UsGradeEnum(String gradeCode, String grade) {
		this.gradeCode = gradeCode;
		this.grade = grade;
	}
	
	public String getGrade() {
		return grade;
	}
}
