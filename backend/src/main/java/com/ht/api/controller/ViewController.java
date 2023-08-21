package com.ht.api.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.ht.api.config.HisCrypto;
import com.ht.api.entity.User;
import com.ht.api.entity.View;
import com.ht.api.entity.ViewInfo;
import com.ht.api.framework.DbManager;
import com.ht.api.mapper.DataPoolMapper;
import com.ht.api.mapper.ViewInfoMapper;
import com.ht.api.mapper.ViewMapper;
import org.apache.commons.text.StringEscapeUtils;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

import static com.ht.api.config.HisCrypto.*;

@RestController
@RequestMapping("/")
public class ViewController {
    private final DbManager dbManager ;
    private final ViewMapper vm;
    private final ViewInfoMapper viewInfoMapper;
    private final DataPoolMapper dm;
    public ViewController(DataPoolMapper dm, ViewMapper VM, ViewInfoMapper viewInfoMapper) {
        this.dbManager= new DbManager(dm);
        this.dm = dm;
        this.vm = VM;
        this.viewInfoMapper = viewInfoMapper;
    }


    @PostMapping("view/")
    public String view(@RequestParam("p1") String sql) throws Exception {
        String sql2  = Base64to(sql,null);
        List<View> Vs = vm.getViewByVname(sql2);
        JsonArray jsonArray = new JsonArray();
        Gson gson = new Gson();
        for (View v:Vs) {
            String datatype = v.getDatatype();
            v.setSettings(DESDecrypt(v.getSettings()));
            v.setData(DESDecrypt(v.getData()));
            if( datatype.equals("sql")){
                try {
                    v.setFulldata(dbManager.query( v.getData(),v.getDb()));
                }
                catch (Exception e){
                    v.setFulldata(v.getData());
                }
            }else {
                v.setFulldata(v.getData());
            }
            jsonArray.add(gson.toJsonTree(v));
        }
        return gson.toJson(jsonArray);
    }

    @PostMapping("updateviews/")
    @Transactional
    public int updateviews(@RequestParam("p1") String sql) throws Exception {
        String sql2 = Base64to(sql,null);
        List<View> views;
        Gson gson = new Gson();
        try {
            views = gson.fromJson(sql2, new TypeToken<List<View>>() {}.getType());
        }catch(Exception e) {
            return -2;
        }

        try {
            int xx =vm.delByVname(views.get(0).getViewname());
            if(xx>-1){
                for (View view : views) {
                    view.setId(null);
                    view.setFulldata("");
                    view.setSettings(DESEncrypt(view.getSettings()));
                    view.setData(DESEncrypt(view.getData()));
                    vm.addView(view);
                }
                return 1;
            }
        }
        catch (Exception e){
            return -3;
        }

        return 0;
    }

    @PostMapping("delByFrefid/")
    public int delByFrefid(@RequestParam("p1") String sql) throws Exception {
        String sql2 = Base64to(sql,null);
        View re = stringToClass(sql2,View.class);
        return vm.delByFrefid(re.getViewname(), re.getFrefid());
    }


    @PostMapping("getalldatatype/")
    public List<String> getalldatatype() {
        return vm.getalldatatype();
    }


    @PostMapping("getalltype/")
    public List<String> getalltype() {
        return vm.getalltype();
    }

    @PostMapping("getAll/")
    public List<ViewInfo> getAll(){ return viewInfoMapper.getAll();}

    @PostMapping("addViewInfo/")
    public Integer addViewInfo(@RequestParam("p1") String p1) throws Exception {
        String dep1  = Base64to(p1,null);
        ViewInfo viewInfo = stringToClass(dep1,ViewInfo.class);
        return viewInfoMapper.add(viewInfo);
    }

    @PostMapping("updateViewInfo/")
    public Integer updateViewInfo(@RequestParam("p1") String p1) throws Exception {
        String dep1  = Base64to(p1,null);
        ViewInfo viewInfo = stringToClass(dep1,ViewInfo.class);
        ViewInfo db =viewInfoMapper.getByNameOrID(viewInfo.getId().toString());
        if(Objects.equals(db.getViewName(), viewInfo.getViewName())){
            return viewInfoMapper.update(viewInfo);
        }
        return -2;
    }
    @PostMapping("removeViewInfo/")
    public Integer removeViewInfo(@RequestParam("p1") String p1) throws Exception {
        String dep1  = Base64to(p1,null);
        ViewInfo viewInfo = stringToClass(dep1,ViewInfo.class);
        return viewInfoMapper.remove(viewInfo);
    }
}
