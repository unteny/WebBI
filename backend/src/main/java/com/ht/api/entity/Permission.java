package com.ht.api.entity;

import lombok.Data;

@Data
public class Permission {
    private Integer id;
    private String permission;
    private String memo;
    private Integer status;
}
