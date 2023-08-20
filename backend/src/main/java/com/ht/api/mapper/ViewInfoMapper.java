package com.ht.api.mapper;

import com.ht.api.entity.ViewInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface ViewInfoMapper {
    Integer add(ViewInfo role);
    Integer update(ViewInfo newViewInfo);
    Integer remove(ViewInfo role);

    ViewInfo getByNameOrID(String name);
    List<ViewInfo> getByCart(String cart);
    List<ViewInfo> getAll();
}
