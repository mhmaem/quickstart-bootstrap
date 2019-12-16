package com.mhmaem.bootstrap.notifications;

import java.io.BufferedInputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.json.simple.JSONObject;

public class NotificationsSender {
	public final static String AUTH_KEY_FCM = "Put Your FCM Server key";
	public final static String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";

	public static void pushFCMNotification(String deviceToken, Map<String, String> info, Map<String, String> data)
			throws Exception {

		String authKey = AUTH_KEY_FCM;
		String FMCurl = API_URL_FCM;

		URL url = new URL(FMCurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setUseCaches(false);
		conn.setDoInput(true);
		conn.setDoOutput(true);

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "key=" + authKey);
		conn.setRequestProperty("Content-Type", "application/json");

		JSONObject json = new JSONObject();
		json.put("to", deviceToken.trim());
		json.put("notification", new JSONObject(info));
		json.put("data", new JSONObject(data));
		OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
		wr.write(json.toString());
		wr.flush();
		conn.getInputStream();

		BufferedInputStream in = new BufferedInputStream(conn.getInputStream());
		byte[] contents = new byte[1024];

		int bytesRead = 0;
		String strFileContents = "";
		while ((bytesRead = in.read(contents)) != -1) {
			strFileContents += new String(contents, 0, bytesRead);
		}
	}
}
