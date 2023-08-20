package com.ht.api.framework;
import java.lang.reflect.InvocationTargetException;
import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.ht.api.entity.DataPool;
import com.ht.api.mapper.DataPoolMapper;

public class DbManager {
    //jdbc:oracle:thin:@172.17.9.253/hisdb", "htut", "wweyy6868302
    //jdbc:mysql://127.0.0.1/", "root", "zcy2013.
    private static final HashMap<DataPool,ConnectionPool> PoolMap= new HashMap<>();
    private final DataPoolMapper dataPoolMapper;
    public DbManager(DataPoolMapper dm){
        dataPoolMapper = dm;
        List<DataPool> dataPools = dataPoolMapper.getAll();
        for (DataPool dp:dataPools) {
            addPoolMap(dp);
        }
    }
    public void addPoolMap(DataPool dataPool){
        if(PoolMap.get(dataPool) ==null){
            PoolMap.put(dataPool,new ConnectionPool(dataPool));
        }
    }

    public String savePool(DataPool dataPool) throws SQLException {
        String info;
        if(PoolMap.get(dataPool) != null){
            return "已存在";
        }
        else if(!Objects.equals(dataPool.getId(), null)){
            removePoolandMap(dataPool.getConname());
            try{
                PoolMap.put(dataPool,new ConnectionPool(dataPool));
                info  = query(dataPool.getTestsql(),dataPool.getConname());
                dataPoolMapper.add(dataPool);
            }
            catch (Exception e){
                info ="无法连接";
                PoolMap.remove(dataPool);
            }
            return info;
        }
        else {
            try{
                PoolMap.put(dataPool,new ConnectionPool(dataPool));
                info  = query(dataPool.getTestsql(),dataPool.getConname());
                dataPoolMapper.add(dataPool);
            }
            catch (Exception e){
                info ="无法连接";
                PoolMap.remove(dataPool);
            }
            return info;
        }
    }


    public int removePoolandMap(String conname){
        String x =dataPoolMapper.getPoolByName(conname).getConstr();
        PoolMap.remove(x);
        dataPoolMapper.remove(conname);
        return 1;
    }
    public String query(String sql,String poolname) throws SQLException {
        ResultSet resultSet = null;
        DataPool dp = dataPoolMapper.getPoolByName(poolname);
        ConnectionPool cp = PoolMap.get(dp);
        Connection connection = cp.getConnection();
        if(connection==null)
            return "-404";
        resultSet = connection.createStatement().executeQuery(sql);
        // Step 5: Convert result set to JSON format
        JsonArray jsonArray = new JsonArray();
        ResultSetMetaData metaData = resultSet.getMetaData();
        int columnCount = metaData.getColumnCount();
        while (resultSet.next()) {
            JsonObject jsonObject = new JsonObject();
            for (int i = 1; i <= columnCount; i++) {
                String columnName = metaData.getColumnLabel(i);
                String columnValue = resultSet.getString(columnName);
                jsonObject.addProperty(columnName, columnValue);
            }
            jsonArray.add(jsonObject);
        }
        Gson gson = new Gson();
        String json = gson.toJson(jsonArray);
        connection.close();
        return json;
    }

    public int nonquery(String sql,String poolname) throws SQLException {
        int result;
        DataPool dp = dataPoolMapper.getPoolByName(poolname);
        ConnectionPool cp = PoolMap.get(dp);
        Connection connection = cp.getConnection();
        if(connection==null)
            return -2;
        result = connection.createStatement().executeUpdate(sql);
        connection.close();
        return result;
    }
}
