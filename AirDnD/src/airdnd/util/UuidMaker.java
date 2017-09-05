package airdnd.util;

import java.util.UUID;

public class UuidMaker {
	//uuid생성 
	public static String getUuid() { return UUID.randomUUID().toString().replaceAll("-", ""); }
}
