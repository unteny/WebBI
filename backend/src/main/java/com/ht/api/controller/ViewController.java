package com.ht.api.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
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
        for (View v:Vs) {
            JsonObject jsonObject = new JsonObject();
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

            jsonObject.addProperty("id", v.getId());
            jsonObject.addProperty("viewname", v.getViewname().replaceAll("\"", "'"));
            jsonObject.addProperty("frefid", v.getFrefid().replaceAll("\"", "'"));
            jsonObject.addProperty("refid", v.getRefid().replaceAll("\"", "'"));
            jsonObject.addProperty("settings",v.getSettings().replaceAll("\"", "'") );
            jsonObject.addProperty("type", v.getType().replaceAll("\"", "'"));
            jsonObject.addProperty("data", v.getData().replaceAll("\"", "'"));
            jsonObject.addProperty("style", v.getStyle().replaceAll("\"", "'"));
            jsonObject.addProperty("datatype", v.getDatatype().replaceAll("\"", "'"));
            jsonObject.addProperty("db",v.getDb().replaceAll("\"", "'"));
            jsonObject.addProperty("fulldata", v.getFulldata().replaceAll("\"", "'"));
            jsonArray.add(jsonObject);
        }
        Gson gson = new Gson();
        String json = gson.toJson(jsonArray);

        String decodedStr = StringEscapeUtils.unescapeJava(json).replaceAll("\r?\n", " ");
        return decodedStr;
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
            if(vm.delByVname(views.get(0).getViewname())>-1){
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
