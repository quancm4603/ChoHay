<%-- 
    Document   : dog_details
    Created on : Nov 22, 2023, 1:23:08 PM
    Author     : caomi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="row justify-content-around" style="width: 100%;margin: 2px;padding: 0;">
    <div class="col-sm-12 col-md-8 col-lg-6 col-xxl-8" style="transform: scale(1);width: 60%;">
        <div class="mb-3">
            <label class="form-label form-label" for="service_name"><strong>Giống chó *</strong></label>
            <select name="breed" class="form-select form-select" required="" style="color:rgb(0,0,0);">
                <option value="Alaskan dog">Chó Alaska</option>
                <option value="Beijin dog">Chó Bắc Kinh</option>
                <option value="Becgie dog">Chó Becgie</option>
                <option value="Bull dog">Chó Bull</option>
                <option value="Chihuahua dog">Chó Chihuahua</option>
                <option value="Chow Chow  dog">Chó Chow Chow</option>
                <option value="Corgi dog">Chó Corgi</option>
                <option value="Shiba dog">Chó Shiba</option>
                <option value="Poodle dog">Chó Poodle</option>
                <option value="Husky dog">Chó Husky</option>
                <option value="Other">Giống khác</option>
            </select>
        </div>
    </div>
    <div class="col-sm-12 col-md-4 col-lg-4" style="width: 40%;">
        <div class="mb-3">
            <label class="form-label form-label" for="service_price"><strong>Độ tuổi *</strong></label>
            <select name="age" class="form-select form-select" required="" style="color:rgb(0,0,0);">
                <option value="0">Chó con (dưới 3 tháng tuổi)</option>
                <option value="1">Chó nhỏ (dưới 1 năm tuổi)</option>
                <option value="2">Chó lớn (hơn 1 tuổi)</option>
                <option value="-1">Không xác định được</option>
            </select>
        </div>
    </div>
    <div class="col-sm-12 col-md-4 col-lg-4" style="width: 100%;">
        <div class="mb-3">
            <label class="form-label form-label" for="service_price"><strong>Size *</strong></label>
            <select name="size" class="form-select form-select" required="" style="color:rgb(0,0,0);">
                <option value="1">Siêu nhỏ</option>
                <option value="2">Nhỏ</option>
                <option value="3">Trung bình</option>
                <option value="4">Lớn</option>
            </select>
        </div>
    </div>
</div>