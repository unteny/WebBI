package com.ht.api.mapper;


import com.ht.api.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    Integer add(User user);
    Integer update(User user);
    Integer remove(User user);

    User getByName(String name);
    List<User> getAll();
}
