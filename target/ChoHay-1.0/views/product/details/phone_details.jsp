<%-- 
    Document   : phone_details
    Created on : Nov 22, 2023, 1:23:40 PM
    Author     : caomi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="row justify-content-around" style="width: 100%;margin: 2px;padding: 0;">
    <div class="col-sm-12 col-md-8 col-lg-6 col-xxl-8" style="transform: scale(1);width: 100%;">
        <div class="mb-3"><label class="form-label form-label" for="service_name"><strong>Tình trạng *</strong></label><select class="form-select form-select" required="" style="color:rgb(0,0,0);">
                <option value="New">Mới</option>
                <option value="Used (not repaired)">Đã sử dụng (chưa sửa chữa)</option>
                <option value="Used (repaired)">Đã sử dụng (đã sửa chữa)</option>
            </select></div>
        <div class="mb-3"><label class="form-label form-label" for="service_name"><strong>Hãng *</strong></label><select class="form-select form-select" required="" style="color:rgb(0,0,0);">
                <option value="Apple">Apple</option>
                <option value="Samsung">Samsung</option>
                <option value="Huawei">Huawei</option>
                <option value="Oppo">Oppo</option>
                <option value="Vivo">Vivo</option>
                <option value="Xiaomi">Xiaomi</option>
                <option value="Other">Hãng khác</option>
            </select></div>
        <div class="mb-3"><label class="form-label form-label" for="service_name"><strong>Màu sắc *</strong></label><select class="form-select form-select" required="" style="color:rgb(0,0,0);">
                <option value="Silver">Bạc</option>
                <option value="Black">Đen</option>
                <option value="Red">Đỏ</option>
                <option value="White">Trắng</option>
                <option value="Golden">Vàng</option>
                <option value="Pink">Hồng</option>
                <option value="Other">Màu khác</option>
            </select></div>
        <div class="mb-3"><label class="form-label form-label" for="service_name"><strong>Dung lượng *</strong></label><select class="form-select form-select" required="" style="color:rgb(0,0,0);">
                <option value="8">8 GB</option>
                <option value="16">16 GB</option>
                <option value="32">32 GB</option>
                <option value="64">64 GB</option>
                <option value="128">128 GB</option>
                <option value="256">256 GB</option>
                <option value="512">512 GB</option>
            </select></div>
        <div class="mb-3"><label class="form-label form-label" for="service_name"><strong>Chính sách bảo hành *</strong></label><select class="form-select form-select" required="" style="color:rgb(0,0,0);">
                <option value="Out of warranty">Hết bảo hành</option>
                <option value="1 month">1 tháng</option>
                <option value="2 months">2 tháng</option>
                <option value="3 months">3 tháng</option>
                <option value="4 - 6 months">4 - 6 tháng</option>
                <option value="7 - 12 months">7 - 12 tháng</option>
                <option value="> 12 month">&gt; 12 tháng</option>
                <option value="Still under warranty">Còn bảo hành</option>
            </select></div>
        <div class="mb-3"><label class="form-label form-label" for="service_name"><strong>Xuất xứ *</strong></label><select class="form-select form-select" required="" style="color:rgb(0,0,0);">
                <option value="Vietnam">Việt Nam</option>
                <option value="China">Trung Quốc</option>
                <option value="Korea">Hàn Quốc</option>
                <option value="India">Ấn Độ</option>
                <option value="Japan">Nhật Bản</option>
                <option value="USA">Mỹ</option>
                <option value="Other">Nước khác</option>
            </select></div>
    </div>
</div>