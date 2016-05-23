package nl.waisda.utils;

public enum MonthEnum {

	JANUARY(1), FEBRUARY(2), MARCH(3), APRIL(4), MAY(5), JUNE(6), JULY(7), AUGUST(
			8), SEPTEMBER(9), OCTOBER(10), NOVEMBER(11), DECEMBER(12);

	private MonthEnum(int month) {
		this.month = month;
	}

	private int month;

	public int getMonth() {
		return month;
	}

}
