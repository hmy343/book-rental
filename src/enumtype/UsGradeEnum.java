package enumtype;

public enum UsGradeEnum {
	AD("Admin"),
	B("Bronze"),
	S("Silver"),
	G("Gold"),
	P("Platinum");

	private String grade;
	
	UsGradeEnum(String grade) {
		this.grade = grade;
	}
	
	public String getGrade() {
		return grade;
	}
	
}
