package com.ht.api.config;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.jetbrains.annotations.Contract;
import org.jetbrains.annotations.NotNull;
import java.util.regex.*;
import javax.crypto.spec.SecretKeySpec;
import javax.crypto.Cipher;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.SecretKeyFactory;
import javax.crypto.SecretKey;
import java.util.Base64;

public class HisCrypto {
    static final String DESIV = "GppBackE";
    static final String Key = "ndZCYAdd";
    public static String DESEncrypt(String originalValue) {
        String result;
        try {
            DESKeySpec keySpec = new DESKeySpec(Key.getBytes("UTF-8"));
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            SecretKey secretKey = keyFactory.generateSecret(keySpec);
            Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, new IvParameterSpec(DESIV.getBytes("UTF-8")));
            byte[] encryptedBytes = cipher.doFinal(originalValue.getBytes("UTF-8"));
            result = Base64.getEncoder().encodeToString(encryptedBytes);
        } catch (Exception ex) {
            result = originalValue;
        }
        return result;
    }

    @Contract("_ -> new")
    public static @NotNull String DESDecrypt(String encryptedValue) throws Exception {
        IvParameterSpec iv = new IvParameterSpec(DESIV.getBytes("UTF-8"));
        SecretKeySpec keySpec = new SecretKeySpec(Key.getBytes("UTF-8"), "DES");
        Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, keySpec, iv);
        byte[] original = cipher.doFinal(Base64.getDecoder().decode(encryptedValue));
        return new String(original, "UTF-8");
    }


    public static <T> T stringToClass(String classString, Class<T> clazz) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.readValue(classString, clazz);
    }

    public static<T> String objectToJson(T obj) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.writeValueAsString(obj);
    }



    public static Boolean hasSpecialChars(String  str) {
        // 检测是否包含特殊字符
        if(Pattern.matches(".*[&<>\"'/].*", str)) {
            return true;
        } else {
            return false;
        }
    }


    public static String deBase64(String encryptedStr) {
        byte[] decodedBytes = Base64.getDecoder().decode(encryptedStr);
        String decodedStr = new String(decodedBytes);
        return decodedStr;
    }

    public  static  <T> T Base64to(String x,String splitter) throws Exception {
        byte[] decodedBytes = Base64.getDecoder().decode(x);
        String decodedString = new String(decodedBytes);
        String sql2 = DESDecrypt(decodedString);
        if(splitter !=null){
            return (T)sql2.split(splitter);
        }
        return (T)sql2;
    }

    public static String toBase64(String x){
        String x1 = DESEncrypt(x);

        byte[] encodedBytes = Base64.getEncoder().encode(x1.getBytes());
        return new String(encodedBytes);
    }
}
