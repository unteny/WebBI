package com.ht.api.mapper;

import com.ht.api.entity.Role;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RoleMapper {
    Integer add(Role role);
    Integer update(Role role);
    Integer remove(Role role);

    Role getByName(String name);
    List<Role> getByCart(String cart);
    List<Role> getAll();
}
