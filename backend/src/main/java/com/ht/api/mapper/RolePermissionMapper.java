package com.ht.api.mapper;

import com.ht.api.entity.RolePermission;
import com.ht.api.entity.UserRole;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RolePermissionMapper {
    List<RolePermission> getByRoleID(Integer id);
    Integer add(RolePermission rolePermission);
    Integer update(RolePermission rolePermission);
    Integer remove(RolePermission rolePermission);
}
