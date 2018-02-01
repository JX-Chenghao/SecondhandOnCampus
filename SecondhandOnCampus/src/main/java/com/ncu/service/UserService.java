package com.ncu.service;

import com.ncu.pojo.User;

public interface UserService {
    User loginValidate(String user_account, String pwd );
}
