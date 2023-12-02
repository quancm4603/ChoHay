/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.services;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.util.concurrent.TimeUnit;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author caomi
 */
public class FirebaseService {

    public FirebaseService() {
    }
    
    private final String jsonContent = "{\n"
                    + "  \"type\": \"service_account\",\n"
                    + "  \"project_id\": \"chohay-76cc5\",\n"
                    + "  \"private_key_id\": \"20d3e275b7f753c0c0ffc5a443d327626566292e\",\n"
                    + "  \"private_key\": \"-----BEGIN PRIVATE KEY-----\\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDR49YCGvfZL3LK\\ndoKynhxNJhwksl+jFIuE3B84dVbQ65XQCHHNmqX7zaTxSTCEgjkPavbFiFhZQg+I\\nExZdCzsHt1F6J/5vGlh4/whOlLzsDT+B9OyPy5SucBXxEw3u/9zK+znT808iSx5V\\n9JC4s4Jv+ClpsYjMIXMG465jGDkeRos2np85TPNB2vHNE4JcZsWqNndRJAzq3eGx\\n6JOd2QmmRL6jk8K0NQnTyA+5NuHm/YsvFZP2HY1pKmfqJkNnRys6UkDLvUgigeEM\\n46h7RKYDd4CxZQIL/9RgIt1G+RLJz4sZnQwOLEx6c1VbyB6M3lh8+hoArkA7mBQe\\nsyICXyXhAgMBAAECggEAI2lOJQLJyCHCOzhtapdUbQu9+c8CZbBErcC5n7vkTtFA\\ncF3MXYT29hnG91KC1ghmehxwz/jl9wE3P50Ay+fmKLIcFAEFY1dNj/RvQVrE2QqP\\nKWzaMJSHXDra6NZvJmCSrsheBE1rj3ye/J+Lfy4CFsQGsKdcThxinMnzFRL0KBAu\\njaTnbSmAfbsUEWST9Ot8HWfOKUNKO0g2BUyKftH2YjMJxAgJY7XYvjFVupaInXxV\\notWSJT0LmzODw4FhlOTw/Q+JbRRfrA15G5RZ3m+/URXB9ydQl4rsOLpxty40zTUm\\nqSt5dkir9ufJwc41y+RnHTU1syozvKIerIcIKQGwVQKBgQDwa8P1NpTF+ZZ7RfB8\\nmK+e/gCmEgPgcM76F8QBML771os/j1eu+r0bRAFHvAp4el/jYOqq7dYprt5WALqH\\n7kSsKFEbr4bBxwr6R5W/P//4+0baHGi9SXI5qxMQoBbjVudS+cnAqpBLPzqEM8du\\nT7P6bdFhui/I4bYJHPfjpRCXwwKBgQDffZshncB/Kw8CCRQI2v8znhyu+psyLqmg\\npnhjw9gz6sfIT0FwUXX5/4h0r+gbQphCEXfHJCCQ5J4Z2kx5XX3+8WSq2XHwx9bR\\n0PZz5fWRk6Mpvo+wJU+VY+VZo0AX5JaV7o2c/CjoHtG5whuxmkITYKBIZICTTN/c\\nCbnWqZNViwKBgCm3yW0HZ5Fi2cXSQQSdyfugv6QRhDKx4HhtH0nFl55DgC4rRV/L\\ninzss/wqmPaG5ZSjAJVgZ8Ub3uC1h6iGo8vrwwc20f9V9oWvXkCtblFZ6NV4EISn\\n9fYjxU8hOFeCgOlZBrUz443rDtBZ28U8d1KBM8/tatVEtT2nlSwfPF3ZAoGAHQYT\\n4m65NAqkfVAugOPn5o0vDm5PP1od/1X/Jn2lk0B3R4U7a1m454mO8BB0JS4l1das\\n5njDne2CtrrJ2a0Rks1IlIN+r5VUSZVInE6N8KTquJ4dzPNbfXwmqdhwl2nBQKFl\\nVLDOoy51cBlMPWlaEWgoCJ68r+R44fuFXeJR1vcCgYAxH6tOWRrsGP9ZIA9IqRO/\\niKB3MFSeNldJ9rflDyv5qD+bMCOKbHT4P7aM33Kx9PYH7/8ac+c5814fZyXEADBE\\nY9hJCYAiuJgzPuHXX18JK9oIfsIwpADBDRPbPCl8NePoB03Jccqe9593rF1wxx5i\\nSyF0TUhkjQ73Htg3jGyCTA==\\n-----END PRIVATE KEY-----\\n\",\n"
                    + "  \"client_email\": \"firebase-adminsdk-ceegw@chohay-76cc5.iam.gserviceaccount.com\",\n"
                    + "  \"client_id\": \"101768039509653355979\",\n"
                    + "  \"auth_uri\": \"https://accounts.google.com/o/oauth2/auth\",\n"
                    + "  \"token_uri\": \"https://oauth2.googleapis.com/token\",\n"
                    + "  \"auth_provider_x509_cert_url\": \"https://www.googleapis.com/oauth2/v1/certs\",\n"
                    + "  \"client_x509_cert_url\": \"https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-ceegw%40chohay-76cc5.iam.gserviceaccount.com\",\n"
                    + "  \"universe_domain\": \"googleapis.com\"\n"
                    + "}\n";
    
    private final String bucketName = "chohay-76cc5.appspot.com";
    
    public String uploadImageFromPart(Part filePart, String folder) throws IOException{
        // xu ly image
            // xu ly image
//          FileInputStream serviceAccount = new FileInputStream("/chohay-76cc5.json");
            // Đọc tệp JSON từ cùng package với class chứa dòng code này
            // Chuỗi JSON chứa nội dung của tệp JSON
//            String jsonContent = "{\n"
//                    + "  \"type\": \"service_account\",\n"
//                    + "  \"project_id\": \"chohay-76cc5\",\n"
//                    + "  \"private_key_id\": \"20d3e275b7f753c0c0ffc5a443d327626566292e\",\n"
//                    + "  \"private_key\": \"-----BEGIN PRIVATE KEY-----\\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDR49YCGvfZL3LK\\ndoKynhxNJhwksl+jFIuE3B84dVbQ65XQCHHNmqX7zaTxSTCEgjkPavbFiFhZQg+I\\nExZdCzsHt1F6J/5vGlh4/whOlLzsDT+B9OyPy5SucBXxEw3u/9zK+znT808iSx5V\\n9JC4s4Jv+ClpsYjMIXMG465jGDkeRos2np85TPNB2vHNE4JcZsWqNndRJAzq3eGx\\n6JOd2QmmRL6jk8K0NQnTyA+5NuHm/YsvFZP2HY1pKmfqJkNnRys6UkDLvUgigeEM\\n46h7RKYDd4CxZQIL/9RgIt1G+RLJz4sZnQwOLEx6c1VbyB6M3lh8+hoArkA7mBQe\\nsyICXyXhAgMBAAECggEAI2lOJQLJyCHCOzhtapdUbQu9+c8CZbBErcC5n7vkTtFA\\ncF3MXYT29hnG91KC1ghmehxwz/jl9wE3P50Ay+fmKLIcFAEFY1dNj/RvQVrE2QqP\\nKWzaMJSHXDra6NZvJmCSrsheBE1rj3ye/J+Lfy4CFsQGsKdcThxinMnzFRL0KBAu\\njaTnbSmAfbsUEWST9Ot8HWfOKUNKO0g2BUyKftH2YjMJxAgJY7XYvjFVupaInXxV\\notWSJT0LmzODw4FhlOTw/Q+JbRRfrA15G5RZ3m+/URXB9ydQl4rsOLpxty40zTUm\\nqSt5dkir9ufJwc41y+RnHTU1syozvKIerIcIKQGwVQKBgQDwa8P1NpTF+ZZ7RfB8\\nmK+e/gCmEgPgcM76F8QBML771os/j1eu+r0bRAFHvAp4el/jYOqq7dYprt5WALqH\\n7kSsKFEbr4bBxwr6R5W/P//4+0baHGi9SXI5qxMQoBbjVudS+cnAqpBLPzqEM8du\\nT7P6bdFhui/I4bYJHPfjpRCXwwKBgQDffZshncB/Kw8CCRQI2v8znhyu+psyLqmg\\npnhjw9gz6sfIT0FwUXX5/4h0r+gbQphCEXfHJCCQ5J4Z2kx5XX3+8WSq2XHwx9bR\\n0PZz5fWRk6Mpvo+wJU+VY+VZo0AX5JaV7o2c/CjoHtG5whuxmkITYKBIZICTTN/c\\nCbnWqZNViwKBgCm3yW0HZ5Fi2cXSQQSdyfugv6QRhDKx4HhtH0nFl55DgC4rRV/L\\ninzss/wqmPaG5ZSjAJVgZ8Ub3uC1h6iGo8vrwwc20f9V9oWvXkCtblFZ6NV4EISn\\n9fYjxU8hOFeCgOlZBrUz443rDtBZ28U8d1KBM8/tatVEtT2nlSwfPF3ZAoGAHQYT\\n4m65NAqkfVAugOPn5o0vDm5PP1od/1X/Jn2lk0B3R4U7a1m454mO8BB0JS4l1das\\n5njDne2CtrrJ2a0Rks1IlIN+r5VUSZVInE6N8KTquJ4dzPNbfXwmqdhwl2nBQKFl\\nVLDOoy51cBlMPWlaEWgoCJ68r+R44fuFXeJR1vcCgYAxH6tOWRrsGP9ZIA9IqRO/\\niKB3MFSeNldJ9rflDyv5qD+bMCOKbHT4P7aM33Kx9PYH7/8ac+c5814fZyXEADBE\\nY9hJCYAiuJgzPuHXX18JK9oIfsIwpADBDRPbPCl8NePoB03Jccqe9593rF1wxx5i\\nSyF0TUhkjQ73Htg3jGyCTA==\\n-----END PRIVATE KEY-----\\n\",\n"
//                    + "  \"client_email\": \"firebase-adminsdk-ceegw@chohay-76cc5.iam.gserviceaccount.com\",\n"
//                    + "  \"client_id\": \"101768039509653355979\",\n"
//                    + "  \"auth_uri\": \"https://accounts.google.com/o/oauth2/auth\",\n"
//                    + "  \"token_uri\": \"https://oauth2.googleapis.com/token\",\n"
//                    + "  \"auth_provider_x509_cert_url\": \"https://www.googleapis.com/oauth2/v1/certs\",\n"
//                    + "  \"client_x509_cert_url\": \"https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-ceegw%40chohay-76cc5.iam.gserviceaccount.com\",\n"
//                    + "  \"universe_domain\": \"googleapis.com\"\n"
//                    + "}\n"; // Thay thế {...} bằng nội dung JSON thích hợp

            // Chuyển chuỗi JSON thành byte array
            byte[] jsonBytes = jsonContent.getBytes(StandardCharsets.UTF_8);

            // Khởi tạo FirebaseOptions từ byte array của chuỗi JSON
            GoogleCredentials credentials = GoogleCredentials.fromStream(new ByteArrayInputStream(jsonBytes));

            // Khởi tạo Firebase Storage
            Storage storage = StorageOptions.newBuilder().setCredentials(credentials).build().getService();

            // Tên bucket trong Firebase Storage của bạn
            
            Bucket bucket = storage.get(bucketName);

            // Nhận part là hình ảnh từ request
            InputStream fileContent = filePart.getInputStream();

            // Tạo đối tượng BlobInfo để chỉ định loại MIME là "image/png"
            BlobId blobId = BlobId.of(bucketName, folder + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
            BlobInfo blobInfo = BlobInfo.newBuilder(blobId)
                    .setContentType(filePart.getContentType())
                    .build();

            // Đọc dữ liệu từ InputStream của Part và tải lên Firebase Storage với thông tin MIME
            byte[] content = IOUtils.toByteArray(fileContent);
            Blob blob = storage.create(blobInfo, content);

            System.out.println("File uploaded to Firebase Storage.");

            // Lấy URL có chữ ký để xem trên trình duyệt
            URL signedUrl = blob.signUrl(365, TimeUnit.DAYS); // Tạo URL có thời hạn 365 ngày (có thể thay đổi)
            return signedUrl.toString();
    }
    
    public void deleteImageFromUrl(String imageUrl) throws IOException {
        // Khai báo thông tin xác thực từ file JSON của bạn
        byte[] jsonBytes = jsonContent.getBytes(StandardCharsets.UTF_8);

        // Khởi tạo GoogleCredentials từ byte array của chuỗi JSON
        GoogleCredentials credentials = GoogleCredentials.fromStream(new ByteArrayInputStream(jsonBytes));

        // Khởi tạo Firebase Storage
        Storage storage = StorageOptions.newBuilder().setCredentials(credentials).build().getService();

        // Lấy đường dẫn bucket và tên file từ URL đã cung cấp
        String[] parts = new URL(imageUrl).getPath().split("/", 4);
        String bucketName = parts[1];
        String fileName = parts[3];

        // Tạo đối tượng BlobId để xác định file cần xóa
        BlobId blobId = BlobId.of(bucketName, fileName);

        // Kiểm tra xem file tồn tại không trước khi xóa
        Blob blob = storage.get(blobId);
        if (blob != null) {
            // Xóa file từ Firebase Storage
            boolean deleted = storage.delete(blobId);
            if (deleted) {
                System.out.println("File deleted successfully from Firebase Storage.");
            } else {
                System.out.println("Failed to delete the file from Firebase Storage.");
            }
        } else {
            System.out.println("File does not exist in Firebase Storage.");
        }
    }
    
}
