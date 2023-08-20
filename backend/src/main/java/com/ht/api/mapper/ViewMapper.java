package com.ht.api.mapper;

import com.ht.api.entity.View;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ViewMapper {
    List<View> getViewByVname(String viewname);
    View getViewByFrefid(String viewname,String frefid);
    int delByVname(String viewname);
    int addViews(List<View> Vs);

    int addView(View view);
    int delByFrefid(String viewname,String frefid);

    List<String> getalldatatype();

    List<String> getalltype();
}
