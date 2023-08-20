package com.ht.api.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.ht.api.entity.DataPool;
import com.ht.api.framework.DbManager;
import com.ht.api.mapper.DataPoolMapper;
import org.springframework.web.bind.annotation.*;
import java.util.Base64;
import java.util.List;

import static com.ht.api.config.HisCrypto.*;


@RestController
@RequestMapping("/")
public class DatabaseController {
    private final DataPoolMapper dm;
    private final DbManager dbManager ;

    public DatabaseController(DataPoolMapper dm) {
        this.dm = dm;
        this.dbManager= new DbManager(dm);
    }

    @GetMapping("query/")
    public String query(@RequestParam("p1") String sql) throws Exception {
        String[] para =Base64to(sql,"-");
        return dbManager.query( para[0],para[1]);
    }
    @PostMapping("nonquery/")
    public int nonquery(@RequestParam("p1") String sql) throws Exception {
        String[] para = Base64to(sql,"-");
        return dbManager.nonquery(para[0],para[1]);
    }

    @GetMapping ("alldata/")
    public List<DataPool> alldata() throws Exception {
        return dm.getAll();
    }

    @PostMapping ("removePool/")
    public int removePool(@RequestParam("p1") String sql) throws Exception {
        String sql2 = Base64to(sql,null);
        return dbManager.removePoolandMap(sql2);
    }


    @PostMapping ("savePool/")
    public String savePool(@RequestParam("p1") String sql) throws Exception {
        String para = Base64to(sql,null);
        DataPool newpool = stringToClass(para,DataPool.class);
        return dbManager.savePool(newpool);
    }

}