package com.ht.api.entity;

import lombok.Data;

@Data
public class Role {
    private Integer id;
    private String rolename ;
    private String memo;
    private Integer status;
}
