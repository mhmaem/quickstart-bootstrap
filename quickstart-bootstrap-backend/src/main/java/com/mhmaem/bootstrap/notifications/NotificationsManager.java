package com.mhmaem.bootstrap.notifications;

import java.util.HashMap;
import java.util.Map;

import com.mhmaem.bootstrap.models.NotificationRequest;

public class NotificationsManager {

	public static void sendGeneralNotification(String deviceToken, String notificationTitle, String notificationBody) {

		if ((deviceToken == "") || (deviceToken == null)) {
			return;
		}

		Map<String, String> info = new HashMap<>();
		Map<String, String> data = new HashMap<>();

		info.put("title", notificationTitle);
		info.put("body", notificationBody);

		// data.put("messageType", "1");
		try {
			NotificationsSender.pushFCMNotification(deviceToken, info, data);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void sendGeneralNotification(NotificationRequest notificationRequest) {

		if ((notificationRequest.deviceID == "") || (notificationRequest.deviceID == null)) {
			return;
		}

		Map<String, String> info = new HashMap<>();
		Map<String, String> data = new HashMap<>();

		info.put("title", "Bootstrap");
		info.put("body", notificationRequest.notificationText);

		// data.put("messageType", "1");
		try {
			NotificationsSender.pushFCMNotification(notificationRequest.deviceID, info, data);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
