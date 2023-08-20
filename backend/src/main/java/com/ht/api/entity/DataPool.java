package com.ht.api.entity;

import lombok.Data;

@Data
public class DataPool {
    private Integer id;
    private String conname;
    private String constr;
    private String user;
    private String pwd;
    private String type;
    private Integer inisize;
    private Integer maxactive;
    private Integer minidle;
    private Integer maxwait;
    private String istest;
    private String testsql;
}
