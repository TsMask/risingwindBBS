package com.baidu.ueditor.um;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.FileUploadBase.InvalidContentTypeException;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.util.Streams;

import sun.misc.BASE64Decoder;
/**
 * UEditor鏂囦欢涓婁紶杈呭姪绫�
 *
 */
public class Uploader {
	// 杈撳嚭鏂囦欢鍦板潃
	private String url = "";
	// 涓婁紶鏂囦欢鍚�
	private String fileName = "";
	// 鐘舵��
	private String state = "";
	// 鏂囦欢绫诲瀷
	private String type = "";
	// 鍘熷鏂囦欢鍚�
	private String originalName = "";
	// 鏂囦欢澶у皬
	private long size = 0;

	private HttpServletRequest request = null;
	private String title = "";

	// 淇濆瓨璺緞
	private String savePath = "upload";
	// 鏂囦欢鍏佽鏍煎紡
	private String[] allowFiles = { ".rar", ".doc", ".docx", ".zip", ".pdf",".txt", ".swf", ".wmv", ".gif", ".png", ".jpg", ".jpeg", ".bmp" };
	// 鏂囦欢澶у皬闄愬埗锛屽崟浣岾B
	private int maxSize = 10000;
	
	private HashMap<String, String> errorInfo = new HashMap<String, String>();

	public Uploader(HttpServletRequest request) {
		this.request = request;
		HashMap<String, String> tmp = this.errorInfo;
		tmp.put("SUCCESS", "SUCCESS"); //榛樿鎴愬姛
		tmp.put("NOFILE", "鏈寘鍚枃浠朵笂浼犲煙");
		tmp.put("TYPE", "涓嶅厑璁哥殑鏂囦欢鏍煎紡");
		tmp.put("SIZE", "鏂囦欢澶у皬瓒呭嚭闄愬埗");
		tmp.put("ENTYPE", "璇锋眰绫诲瀷ENTYPE閿欒");
		tmp.put("REQUEST", "涓婁紶璇锋眰寮傚父");
		tmp.put("IO", "IO寮傚父");
		tmp.put("DIR", "鐩綍鍒涘缓澶辫触");
		tmp.put("UNKNOWN", "鏈煡閿欒");
		
	}

	public void upload() throws Exception {
		boolean isMultipart = ServletFileUpload.isMultipartContent(this.request);
		if (!isMultipart) {
			this.state = this.errorInfo.get("NOFILE");
			return;
		}
		DiskFileItemFactory dff = new DiskFileItemFactory();
		String savePath = this.getFolder(this.savePath);
		dff.setRepository(new File(savePath));
		try {
			ServletFileUpload sfu = new ServletFileUpload(dff);
			sfu.setSizeMax(this.maxSize * 1024);
			sfu.setHeaderEncoding("utf-8");
			FileItemIterator fii = sfu.getItemIterator(this.request);
			while (fii.hasNext()) {
				FileItemStream fis = fii.next();
				if (!fis.isFormField()) {
					this.originalName = fis.getName().substring(fis.getName().lastIndexOf(System.getProperty("file.separator")) + 1);
					if (!this.checkFileType(this.originalName)) {
						this.state = this.errorInfo.get("TYPE");
						continue;
					}
					this.fileName = this.getName(this.originalName);
					this.type = this.getFileExt(this.fileName);
					this.url = savePath + "/" + this.fileName;
					BufferedInputStream in = new BufferedInputStream(fis.openStream());
					File file = new File(this.getPhysicalPath(this.url));
					FileOutputStream out = new FileOutputStream( file );
					BufferedOutputStream output = new BufferedOutputStream(out);
					Streams.copy(in, output, true);
					this.state=this.errorInfo.get("SUCCESS");
					this.size = file.length();
					//UE涓彧浼氬鐞嗗崟寮犱笂浼狅紝瀹屾垚鍚庡嵆閫�鍑�
					break;
				} else {
					String fname = fis.getFieldName();
					//鍙鐞唗itle锛屽叾浣欒〃鍗曡鑷澶勭悊
					if(!fname.equals("pictitle")){
						continue;
					}
                    BufferedInputStream in = new BufferedInputStream(fis.openStream());
                    BufferedReader reader = new BufferedReader(new InputStreamReader(in));
                    StringBuffer result = new StringBuffer();  
                    while (reader.ready()) {  
                        result.append((char)reader.read());  
                    }
                    this.title = new String(result.toString().getBytes(),"utf-8");
                    reader.close();  
                    
				}
			}
		} catch (InvalidContentTypeException e) {
			this.state = this.errorInfo.get("ENTYPE");
		} catch (FileUploadException e) {
			this.state = this.errorInfo.get("REQUEST");
		} catch (Exception e) {
			this.state = this.errorInfo.get("UNKNOWN");
		}
	}
	
	/**
	 * 鎺ュ彈骞朵繚瀛樹互base64鏍煎紡涓婁紶鐨勬枃浠�
	 * @param fieldName
	 */
	public void uploadBase64(String fieldName){
		String savePath = this.getFolder(this.savePath);
		String base64Data = this.request.getParameter(fieldName);
		this.fileName = this.getName("test.png");
		this.url = savePath + "/" + this.fileName;
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			File outFile = new File(this.getPhysicalPath(this.url));
			OutputStream ro = new FileOutputStream(outFile);
			byte[] b = decoder.decodeBuffer(base64Data);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {
					b[i] += 256;
				}
			}
			ro.write(b);
			ro.flush();
			ro.close();
			this.state=this.errorInfo.get("SUCCESS");
		} catch (Exception e) {
			this.state = this.errorInfo.get("IO");
		}
	}

	/**
	 * 鏂囦欢绫诲瀷鍒ゆ柇
	 * 
	 * @param fileName
	 * @return
	 */
	private boolean checkFileType(String fileName) {
		Iterator<String> type = Arrays.asList(this.allowFiles).iterator();
		while (type.hasNext()) {
			String ext = type.next();
			if (fileName.toLowerCase().endsWith(ext)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 鑾峰彇鏂囦欢鎵╁睍鍚�
	 * 
	 * @return string
	 */
	private String getFileExt(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."));
	}

	/**
	 * 渚濇嵁鍘熷鏂囦欢鍚嶇敓鎴愭柊鏂囦欢鍚�
	 * @return
	 */
	private String getName(String fileName) {
		Random random = new Random();
		return this.fileName = "" + random.nextInt(10000)
				+ System.currentTimeMillis() + this.getFileExt(fileName);
	}

	/**
	 * 鏍规嵁瀛楃涓插垱寤烘湰鍦扮洰褰� 骞舵寜鐓ф棩鏈熷缓绔嬪瓙鐩綍杩斿洖
	 * @param path 
	 * @return 
	 */
	private String getFolder(String path) {
		SimpleDateFormat formater = new SimpleDateFormat("yyyyMMdd");
		path += "/" + formater.format(new Date());
		File dir = new File(this.getPhysicalPath(path));
		if (!dir.exists()) {
			try {
				dir.mkdirs();
			} catch (Exception e) {
				this.state = this.errorInfo.get("DIR");
				return "";
			}
		}
		return path;
	}

	/**
	 * 鏍规嵁浼犲叆鐨勮櫄鎷熻矾寰勮幏鍙栫墿鐞嗚矾寰�
	 * 
	 * @param path
	 * @return
	 */
	private String getPhysicalPath(String path) {
		String servletPath = this.request.getServletPath();
		String realPath = this.request.getSession().getServletContext()
				.getRealPath(servletPath);
		return new File(realPath).getParent() +"/" +path;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public void setAllowFiles(String[] allowFiles) {
		this.allowFiles = allowFiles;
	}

	public void setMaxSize(int size) {
		this.maxSize = size;
	}

	public long getSize() {
		return this.size;
	}

	public String getUrl() {
		return this.url;
	}

	public String getFileName() {
		return this.fileName;
	}

	public String getState() {
		return this.state;
	}
	
	public String getTitle() {
		return this.title;
	}

	public String getType() {
		return this.type;
	}

	public String getOriginalName() {
		return this.originalName;
	}
}
