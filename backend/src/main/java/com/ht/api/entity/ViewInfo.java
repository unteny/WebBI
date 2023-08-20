package com.ht.api.entity;

import lombok.Data;

@Data
public class ViewInfo {

    private Long id;
    private String viewName;
    private String info;
    private String cart;
    private String auth;
    private String createTime;
    private String code;

    // getter and setter methods
}