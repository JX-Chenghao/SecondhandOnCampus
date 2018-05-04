package com.ncu.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.ncu.pojo.Admin;
import com.ncu.pojo.User;

public interface AdminService {

    Admin loginValidate(String account, String pwd );

}
