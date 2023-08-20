package com.ht.api.mapper;

import com.ht.api.entity.Permission;
import com.ht.api.entity.UserRole;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserRoleMapper {
    List<UserRole> getByUserID(Integer id);
    Integer add(UserRole userRole);
    Integer update(UserRole userRole);
    Integer remove(UserRole userRole);
}
