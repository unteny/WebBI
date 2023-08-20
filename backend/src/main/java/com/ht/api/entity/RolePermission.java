package com.ht.api.entity;

import lombok.Data;

@Data
public class RolePermission {
    private Integer id;
    private Integer roleid;
    private Integer permissionid;
    private Integer status;
}
