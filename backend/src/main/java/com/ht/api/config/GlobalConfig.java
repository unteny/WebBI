package com.ht.api.config;

import com.ht.api.entity.Dictionary;
import com.ht.api.mapper.DictionaryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class GlobalConfig {
    public final DictionaryMapper dictionaryMapper;
    public static HashMap<String, Dictionary> corePara;

    @Autowired
    public GlobalConfig(DictionaryMapper dictionaryMapper) {
        this.dictionaryMapper = dictionaryMapper;
        corePara = addListToMap(dictionaryMapper.getCore());
    }
    public static HashMap<String, Dictionary> addListToMap(List<Dictionary> tList) {
        HashMap<String, Dictionary> newhash = new HashMap<>();
        for (Dictionary t : tList) {
            addToMap(t.getName(), t, newhash);
        }
        return newhash;
    }

    public static <T, T2> void addToMap(T2 instance2, T instance, HashMap<T2, T> map) {
        if (!map.containsValue(instance)) {
            map.put(instance2, instance);
        }
    }
}
