package com.ht.api.controller;
import com.ht.api.entity.Image;
import com.ht.api.config.GlobalConfig;
import com.ht.api.mapper.ImageMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Base64;
import java.util.List;
import java.util.Objects;
import java.util.UUID;


import static com.ht.api.config.HisCrypto.DESDecrypt;


@RestController
@RequestMapping("/")
public class ImageController {
    private final ImageMapper imageMapper;
    private final String imgPath;
    private final String imgURL;
    public ImageController(ImageMapper im) {
        imgPath = GlobalConfig.corePara.get("imgpath").getValue()==null ? "/www/image" : GlobalConfig.corePara.get("imgpath").getValue();
        imgURL = GlobalConfig.corePara.get("imgurl").getValue()==null ? "/www/image" : GlobalConfig.corePara.get("imgurl").getValue();
        System.out.println(imgPath);
        System.out.println(imgURL);
        this.imageMapper = im;
    }

    @PostMapping("/uploadOne")
    public ResponseEntity<String> uploadOneFile(@RequestParam("file") MultipartFile file) {
        if (file == null || file.isEmpty()) {
            return ResponseEntity.status(500).body("No file name provided");
        }
        String fileName = StringUtils.cleanPath(Objects.requireNonNull(file.getOriginalFilename()));
        try {
            // Get the original file extension
            String[] fruits = fileName.split("\\.");
            String fileExtension = fruits[fruits.length-1]; // Default extension if not provided
            // Generate a unique filename with the original file extension
            String uniqueFileName = UUID.randomUUID().toString() +"." + fileExtension;

            // Copy the file to the upload directory
            Path uploadPath = Paths.get(imgPath);
            Files.createDirectories(uploadPath);
            Path filePath = uploadPath.resolve(uniqueFileName);
            // Check if the file already exists
            if (Files.exists(filePath)) {
                return ResponseEntity.status(500).body("重复文件");
            }
            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

            // Example: Saving the file information to the database
            Image image = new Image();
            image.setCart("未分类");
            image.setName(fileName);
            image.setFilename(uniqueFileName);
            this.imageMapper.add(image);

            // Create the URL to access the uploaded file
            String fileURL = imgURL + "images/" + uniqueFileName;
            return ResponseEntity.ok(fileURL);
        } catch (IOException e) {
            return ResponseEntity.status(500).body("Failed to upload file");
        }
    }

    //获取图片

    @GetMapping("/images/{filename:.+}")
    public ResponseEntity<Resource> getImage(@PathVariable String filename) {
        try {
            Path filePath = Paths.get(imgPath).resolve(filename);
            Resource resource = new UrlResource(filePath.toUri());

            if (resource.exists()) {
                return ResponseEntity.ok()
                        .contentType(MediaType.IMAGE_JPEG) // Adjust the media type according to your image format
                        .body(resource);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().build();
        }
    }


    @PostMapping("/allimages")
    public List<Image> getallImage() {
        return imageMapper.getAll();
    }


    @PostMapping("/allimagecarts")
    public List<String> getAllCarts() {
        return imageMapper.getAllCarts();
    }


    @PostMapping("/getImgByCart")
    public List<Image> getImgByCart(@RequestParam("p1") String cart) throws Exception {
        byte[] decodedBytes = Base64.getDecoder().decode(cart);
        String decodedString = new String(decodedBytes);
        String sql2 = DESDecrypt(decodedString);
        return imageMapper.getByCart(sql2);
    }


    @PostMapping("/editImgByName")
    public int editImgByName(@RequestParam("p1") String cart) throws Exception {
        byte[] decodedBytes = Base64.getDecoder().decode(cart);
        String decodedString = new String(decodedBytes);
        String sql2 = DESDecrypt(decodedString);
        String[] para = sql2.split("-");
        Image img = new Image();
        img.setName(para[0]);
        img.setCart(para[1]);
        img.setFilename(para[2]);
        return imageMapper.uppdate(img);
    }
}