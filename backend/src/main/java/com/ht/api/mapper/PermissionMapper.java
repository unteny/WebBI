package com.ht.api.mapper;

import com.ht.api.entity.Permission;
import com.ht.api.entity.Role;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PermissionMapper {
    Integer add(Permission permission);
    Integer update(Permission permission);
    Integer remove(Permission permission);

    Permission getByName(String name);
    List<Permission> getByCart(String cart);
    List<Permission> getAll();
}
