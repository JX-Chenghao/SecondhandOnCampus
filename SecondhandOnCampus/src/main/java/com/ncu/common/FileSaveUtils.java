package com.ncu.common;

import java.io.File;
import java.io.IOException;

import net.coobird.thumbnailator.Thumbnails;

import org.springframework.web.multipart.MultipartFile;

public class FileSaveUtils {
	//图片文件的保存
	public static File saveFile(MultipartFile pic_file, String store_path, String name) {
		String suffix = pic_file.getOriginalFilename().substring(pic_file.getOriginalFilename().lastIndexOf('.'));
		String newFileName=name+suffix;
		File f=new File(store_path+newFileName);
        if (!f.exists()) { // 判断文件夹是否存在
            f.mkdirs(); // 不存在则创建
        }
		try {
			pic_file.transferTo(f);
			return f;
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String getSavePath(){
		return "D:\\upfilesForBS\\goods\\";
	}
	
	public static String saveThumbnailFile(File file, String store_path,
			String newFileName) {
		newFileName="thumb_"+newFileName;
		try {
			File f=new File(store_path);
			if (!f.exists()) { // 判断文件夹是否存在
		          f.mkdirs(); // 不存在则创建
		    }
			Thumbnails.of(file).size(190, 190).keepAspectRatio(false).toFile(store_path+newFileName);
			return newFileName;
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String getSuffixName(MultipartFile pic) {
		return pic.getOriginalFilename().substring(pic.getOriginalFilename().lastIndexOf('.'));
	}
}
