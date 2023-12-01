<%-- 
    Document   : apartment-details
    Created on : Nov 22, 2023, 1:15:05 PM
    Author     : caomi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="row justify-content-around" style="width: 100%;margin: 2px;padding: 0;">
    <div class="col-sm-12 col-md-8 col-lg-6 col-xxl-8" style="transform: scale(1);width: 100%;">
        <div class="mb-3" style="width: 100%;">
            <label class="form-label form-label" for="service_name"><strong>Loại hình căn hộ *</strong></label>
            <select name="type" class="form-select form-select" required="" style="color:rgb(0,0,0);">
                <option value="Chung cư">Chung cư</option>
                <option value="Duplex">Duplex</option>
                <option value="Penthouse">Penthouse</option>
                <option value="Officetel">Officetel</option>
                <option value="Serviced apartment, mini">Căn hộ dịch vụ, mini</option>
            </select>
        </div>
    </div>
    <div class="col-sm-12 col-md-8 col-lg-6 col-xxl-8" style="transform: scale(1);width: 50%;">
        <div class="mb-3">
            <label class="form-label form-label" for="service_name" style="font-weight: bold;">Số phòng ngủ *</label>
            <input name="bedroom" class="form-control" type="number" required="" placeholder="Số phòng ngủ" min="0" step="1" style="color: rgb(0,0,0);width: 100%;">
        </div>
    </div>
    <div class="col-sm-12 col-md-8 col-lg-6 col-xxl-8" style="transform: scale(1);width: 50%;">
        <div class="mb-3">
            <label class="form-label form-label" for="service_name"><strong>Số phòng vệ sinh *</strong></label>
            <input name="bathroom" class="form-control" type="number" required="" placeholder="Số phòng vệ sinh" min="0" step="1" style="color: rgb(0,0,0);width: 100%;">
        </div>
    </div>
    <div class="col-sm-12 col-md-8 col-lg-6 col-xxl-8" style="transform: scale(1);width: 50%;">
        <div class="mb-3" style="width: 100%;">
            <label class="form-label form-label" for="service_name"><strong>Giấy tờ pháp lý *</strong></label>
            <select name="legalDocuments"class="form-select form-select" required="" style="color:rgb(0,0,0);" style="color: rgb(0,0,0);width: 100%;">
                <option value="Đã có sổ">Đã có sổ</option>
                <option value="Đang có sổ">Đang có sổ</option>
                <option value="Giấy tờ khác">Giấy tờ khác</option>
            </select>
        </div>
    </div>
    <div class="col-sm-12 col-md-8 col-lg-6 col-xxl-8" style="transform: scale(1);width: 50%;">
        <div class="mb-3" style="width: 100%;">
            <label class="form-label form-label" for="service_name"><strong>Tình trạng nội thất *</strong></label>
            <select name="funiture" class="form-select form-select" required="" style="color:rgb(0,0,0);" style="color: rgb(0,0,0);width: 100%;">
                <option value="Nội thất cao cấp">Nội thất cao cấp</option>
                <option value="Nội thất đây đủ">Nội thất đây đủ</option>
                <option value="Nhà trống">Nhà trống</option>
            </select>
        </div>
    </div>
</div>
<div class="row justify-content-around">
    <div class="col">
        <div class="mb-3" style="width: 100%;">
            <label class="form-label form-label" for="service_name"><strong>Diện tích *</strong></label>
            <input name="area" class="form-control" type="number" required="" placeholder="m2" style="width: 100%;" min="0" style="color: rgb(0,0,0);width: 100%;">
        </div>
    </div>
</div>
