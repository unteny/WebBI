package com.ht.api.mapper;

import com.ht.api.entity.Dictionary;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DictionaryMapper {
    int add(Dictionary dictionary);
    int uppdate(Dictionary dictionary);
    int remove(String name) ;
    Dictionary getPoolByName(String name);
    Dictionary getPoolByID(String name);
    List<Dictionary> getAll();

    List<Dictionary> getCore();
}
