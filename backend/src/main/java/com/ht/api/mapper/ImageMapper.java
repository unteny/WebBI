package com.ht.api.mapper;

import com.ht.api.entity.DataPool;
import com.ht.api.entity.Image;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface ImageMapper {
    int add(Image image);
    Image getByName(String name);
    int uppdate(Image image);
    int remove(String conname) ;
    List<Image> getByCart(String cart);
    List<Image> getAll();
    List<String> getAllCarts();
}
