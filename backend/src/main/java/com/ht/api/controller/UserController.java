package com.ht.api.controller;

import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.util.SaResult;
import com.ht.api.entity.User;
import com.ht.api.mapper.UserMapper;
import org.springframework.web.bind.annotation.*;

import static com.ht.api.config.HisCrypto.*;
import static com.ht.api.config.HisCrypto.DESEncrypt;


@RestController
@RequestMapping("/")
public class UserController {
    private final UserMapper userMapper;

    public UserController(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @PostMapping("doLogin/")
    public String doLogin(@RequestParam("p1") String p1) throws Exception{
        String dep1  = Base64to(p1,null);
        User user = stringToClass(dep1,User.class);
        User db = userMapper.getByName(user.getUsername());
        try {
            // 第一步：比对前端提交的账号名称、密码
            if(user.getPassword().equals(db.getPassword())) {
                // 第二步：根据账号id，进行登录
                StpUtil.login(db.getId());
                String token = StpUtil.getTokenValue();
                System.out.println(token);
                return DESEncrypt(token);
            }
        } catch (Exception e) {
            return  DESEncrypt("登录失败");
        }
        return DESEncrypt("登录失败");
    }
    @GetMapping("isLogin")
    public SaResult isLogin() {
        return SaResult.ok("是否登录：" + StpUtil.isLogin());
    }
}