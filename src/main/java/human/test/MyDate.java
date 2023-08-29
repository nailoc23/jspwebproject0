package human.test;

import java.util.Date;
import java.text.SimpleDateFormat;

// 코드추가나 변경시 서버 재기동이 필요함
public class MyDate {
	
	public String DateFormat(Date day) {
		
		//System.out.println(day);
		SimpleDateFormat sdf 
			= new SimpleDateFormat("yyyy-MM-dd");
		String formatted_day = sdf.format(day);
		
		return formatted_day;
	}

}
