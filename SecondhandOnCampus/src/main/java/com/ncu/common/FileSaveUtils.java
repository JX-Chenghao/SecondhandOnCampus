package com.ncu.common;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FileSaveUtils {
	//图片文件的保存
	public static String saveFile(MultipartFile pic_file, String store_path, String name) {
		String suffix = pic_file.getOriginalFilename().substring(pic_file.getOriginalFilename().lastIndexOf('.'));
		String newFileName=name+suffix;
		File f=new File(store_path+newFileName);
        if (!f.exists()) { // 判断文件夹是否存在
            f.mkdirs(); // 不存在则创建
        }
		try {
			pic_file.transferTo(f);
			return newFileName;
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
