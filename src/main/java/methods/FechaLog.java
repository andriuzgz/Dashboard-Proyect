package methods;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class FechaLog {

	public String fechaLog() {
	    LocalDateTime now = LocalDateTime.now();
	    DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
	    
	    String dataLog = now.format(fmt);
	    
		return dataLog;
	}
}
