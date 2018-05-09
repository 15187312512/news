package com.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;




public class Util {

	//获得时间
	public static String getTime(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		return sdf.format(date.getTime());
	}
	
	//获得日期
	public static String getday(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return sdf.format(date.getTime());
	}
	
	//获得月份
	public static String getmonth(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Date date = new Date();
		return sdf.format(date.getTime());
	}

	// 上传文件/复制文件。
	public static void copyFile(File src, File dst) {
		try {
			int BUFFER_SIZE = 16 * 1024;
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src),
						BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE]; 
				for (int byteRead = 0; (byteRead = in.read(buffer)) > 0; ) 
				{ 
					out.write(buffer, 0, byteRead); 
				} 

			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static String tiaozhuan(String msg, String url, String id) {
		String tiaozhuan = "{\"statusCode\":\"200\", \"message\":\"" + msg
				+ "\"," + "\"navTabId\":\"" + id + "\", \"rel\":\"" + id
				+ "\", \"callbackType\":\"closeCurrent\",\"forwardUrl\":\""
				+ url + "\"}";
		return tiaozhuan;
	}

	public static String tiaozhuan2(String msg, String url, String id) {
		String tiaozhuan = "{\"statusCode\":\"200\", \"message\":\"" + msg
				+ "\"," + "\"navTabId\":\"" + id + "\", \"rel\":\"" + id
				+ "\", \"callbackType\":\"\",\"forwardUrl\":\"" + url + "\"}";
		return tiaozhuan;
	}
	

}
