package site.util;

import java.util.Calendar;

public class DateUtil {
	public static int getDay(String start,String end){
		Calendar before = DateUtil.changeStringToDate(start);	
		Calendar after = DateUtil.changeStringToDate(end); 		
		long first = before.getTimeInMillis();					
		long second = after.getTimeInMillis();					
		int day = (int)((second-first)/(1000*60*60*24));			
		return day;
	}
	public static Calendar changeStringToDate(String date){
		String regex = "-";							
		String d[] = date.split(regex);				
		int year = Integer.parseInt(d[0]);			
		int month = Integer.parseInt(d[1])-1;		
		int day = Integer.parseInt(d[2]);			
		Calendar calendar = Calendar.getInstance();	
		calendar.set(year,month,day);				
		return calendar;							
	}
	public static String getDateString(Calendar cal){
		int year =  cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONDAY)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		return year+"-"+month+"-"+day;
	}
	public static String addSomeDay(String date, int day) {
		Calendar cal = DateUtil.changeStringToDate(date);
		cal.add(Calendar.DAY_OF_MONTH,day);
		String newString = DateUtil.getDateString(cal);
		return newString;
	}
}
