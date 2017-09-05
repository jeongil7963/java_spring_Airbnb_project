package airdnd.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateMaker {
	public static List<String> getDateList(String inputStartDate, String inputEndDate)
	{
		try {
			final String DATE_PATTERN = "yyyy-MM-dd";
	        SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
	        Date startDate;
			startDate = sdf.parse(inputStartDate);
			Date endDate = sdf.parse(inputEndDate);
	        ArrayList<String> dates = new ArrayList<String>();
	        Date currentDate = startDate;
	        while (currentDate.compareTo(endDate) <= 0) {
	            dates.add(sdf.format(currentDate));
	            Calendar c = Calendar.getInstance();
	            c.setTime(currentDate);
	            c.add(Calendar.DAY_OF_MONTH, 1);
	            currentDate = c.getTime();
	        }
	        return dates;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;       
	}
}
