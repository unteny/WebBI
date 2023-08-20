package com.ht.api.mapper;

import com.ht.api.entity.DataPool;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;


@Mapper
public interface DataPoolMapper {
    int add(DataPool dp);
    int uppdate(DataPool dp);
    int remove(String conname) ;
    DataPool getPoolByName(String conname);
    List<DataPool> getAll();
}
