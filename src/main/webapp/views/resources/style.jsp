<%-- 
    Document   : style
    Created on : Nov 18, 2023, 2:29:10 PM
    Author     : caomi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.2/dist/lux/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200;300;400;500;600;700&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Averia+Serif+Libre&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

<style>
    .product-list{
        overflow:hidden;
        -webkit-perspective:1000px;
        -moz-perspective:1000px;
        -ms-perspective:1000px;
        perspective:1000px;
        -webkit-transform-style:preserve-3d;
        -moz-transform-style:preserve-3d;
        -ms-transform-style:preserve-3d;
        transform-style:preserve-3d
    }
    .product-item{
        padding:10px
    }
    .product-item .product-container{
        text-align:left;
        font:14px sans-serif;
        background-color:#fff;
        border:1px solid #dbe3e7;
        border-radius:3px;
        box-shadow:1px 3px 1px rgba(0,0,0,.08);
        padding:25px
    }
    .product-item a.product-image{
        display:block;
        text-align:center;
        box-shadow:0 0 20px 8px #f3f3f3 inset;
        width:100%;
        margin-bottom:25px;
        padding:20px 0;
        box-sizing:border-box
    }
    .product-item a.product-image img{
        height:130px
    }
    .product-item h2{
        font-size:18px;
        white-space:nowrap;
        overflow:hidden;
        text-overflow:ellipsis;
        max-width:200px;
        font-weight:800
    }
    .product-item h2 a{
        text-decoration:none;
        color:#2b2b2b
    }
    .product-item a.small-text{
        color:grey;
        text-decoration:none;
        margin-top:20px;
        margin-bottom:10px;
        display:block;
        text-align:right;
        font-size:12px
    }
    .product-item .product-rating{
        color:#f09911;
        font-size:14px
    }
    .product-item .product-rating a.small-text{
        text-align:left;
        margin:0 0 0 10px;
        display:inline-block
    }
    .product-item p.product-description{
        margin-top:20px;
        color:#5d5d5d;
        line-height:1.45;
        white-space:normal;
        margin-bottom:20px
    }
    .product-item button{
        border-radius:2px;
        background:#87bae1;
        box-shadow:0 1px 1px rgba(0,0,0,.12);
        border:0;
        color:#fff;
        font-weight:700;
        font-size:13px;
        padding:8px 20px
    }
    .product-item button:active{
        background:#87bae1;
        color:#fff;
        border:0
    }
    .product-item button:focus,.product-item button:focus:active{
        background:#87bae1;
        outline:0;
        color:#fff
    }
    .product-item button:hover{
        background:#66abe0;
        color:#fff
    }
    .product-item .product-price{
        color:#4e4e4e;
        font-weight:700;
        font-size:20px;
        padding-top:5px;
        text-align:right
    }
    .animation-element{
        opacity:0;
        position:relative;
        -webkit-transform-style:preserve-3d;
        -moz-transform-style:preserve-3d;
        -ms-transform-style:preserve-3d;
        transform-style:preserve-3d
    }
    .animation-element.slide-left{
        opacity:0;
        -moz-transition:.5s linear;
        -webkit-transition:.5s linear;
        -o-transition:.5s linear;
        transition:.5s linear;
        -moz-transform:translate3d(-100px,0,0);
        -webkit-transform:translate3d(-100px,0,0);
        -o-transform:translate(-100px,0);
        -ms-transform:translate(-100px,0);
        transform:translate3d(-100px,0,0)
    }
    .animation-element.slide-right{
        opacity:0;
        -moz-transition:.5s linear;
        -webkit-transition:.5s linear;
        -o-transition:.5s linear;
        transition:.5s linear;
        -moz-transform:translate3d(100px,0,0);
        -webkit-transform:translate3d(100px,0,0);
        -o-transform:translate(100px,0);
        -ms-transform:translate(100px,0);
        transform:translate3d(100px,0,0)
    }
    .animation-element.slide-top{
        opacity:0;
        -moz-transition:.5s linear;
        -webkit-transition:.5s linear;
        -o-transition:.5s linear;
        transition:.5s linear;
        -moz-transform:translate3d(0,-100px,0);
        -webkit-transform:translate3d(0,-100px,0);
        -o-transform:translate(0,-100px);
        -ms-transform:translate(0,-100px);
        transform:translate3d(0,-100px,0)
    }
    .animation-element.slide-top-left{
        opacity:0;
        -moz-transition:.5s linear;
        -webkit-transition:.5s linear;
        -o-transition:.5s linear;
        transition:.5s linear;
        -moz-transform:translate3d(-100px,-100px,0);
        -webkit-transform:translate3d(-100px,-100px,0);
        -o-transform:translate(-100px,-100px);
        -ms-transform:translate(-100px,-100px);
        transform:translate3d(-100px,-100px,0)
    }
    .animation-element.slide-top-right{
        opacity:0;
        -moz-transition:.5s linear;
        -webkit-transition:.5s linear;
        -o-transition:.5s linear;
        transition:.5s linear;
        -moz-transform:translate3d(100px,-100px,0);
        -webkit-transform:translate3d(100px,-100px,0);
        -o-transform:translate(100px,-100px);
        -ms-transform:translate(100px,-100px);
        transform:translate3d(100px,-100px,0)
    }
    .animation-element.slide-bottom{
        opacity:0;
        -moz-transition:.5s linear;
        -webkit-transition:.5s linear;
        -o-transition:.5s linear;
        transition:.5s linear;
        -moz-transform:translate3d(0,100px,0);
        -webkit-transform:translate3d(0,100px,0);
        -o-transform:translate(0,100px);
        -ms-transform:translate(0,100px);
        transform:translate3d(0,100px,0)
    }
    .animation-element.slide-bottom-left{
        opacity:0;
        -moz-transition:.5s linear;
        -webkit-transition:.5s linear;
        -o-transition:.5s linear;
        transition:.5s linear;
        -moz-transform:translate3d(-100px,100px,0);
        -webkit-transform:translate3d(-100px,100px,0);
        -o-transform:translate(-100px,100px);
        -ms-transform:translate(-100px,100px);
        transform:translate3d(-100px,100px,0)
    }
    .animation-element.slide-bottom-right{
        opacity:0;
        -moz-transition:.5s linear;
        -webkit-transition:.5s linear;
        -o-transition:.5s linear;
        transition:.5s linear;
        -moz-transform:translate3d(100px,100px,0);
        -webkit-transform:translate3d(100px,100px,0);
        -o-transform:translate(100px,100px);
        -ms-transform:translate(100px,100px);
        transform:translate3d(100px,100px,0)
    }
    .animation-element.slide-rotate-clockwise{
        opacity:0;
        -moz-transition:.5s linear;
        -webkit-transition:.5s linear;
        -o-transition:.5s linear;
        transition:.5s linear;
        -moz-transform:rotate(0);
        -webkit-transform:rotate(0);
        -o-transform:rotate(0);
        -ms-transform:rotate(0);
        transform:rotate(0)
    }
    .animation-element.slide-left-rotate-clockwise{
        opacity:0;
        -moz-transition:1s linear;
        -webkit-transition:1s linear;
        -o-transition:1s linear;
        transition:1s linear;
        -moz-transform:translate3d(-300px,0,0) rotate(0);
        -webkit-transform:translate3d(-300px,0,0) rotate(0);
        -o-transform:translate(-300px,0) rotate(0);
        -ms-transform:translate(-300px,0) rotate(0);
        transform:translate3d(-300px,0,0) rotate(0)
    }
    .animation-element.slide-rotate-counterclockwise{
        opacity:0;
        -moz-transition:.5s linear;
        -webkit-transition:.5s linear;
        -o-transition:.5s linear;
        transition:.5s linear;
        -moz-transform:rotate(360deg);
        -webkit-transform:rotate(360deg);
        -o-transform:rotate(360deg);
        -ms-transform:rotate(360deg);
        transform:rotate(360deg)
    }
    .animation-element.slide-right-rotate-counterclockwise{
        opacity:0;
        -moz-transition:1s linear;
        -webkit-transition:1s linear;
        -o-transition:1s linear;
        transition:1s linear;
        -moz-transform:translate3d(300px,0,0) rotate(360deg);
        -webkit-transform:translate3d(300px,0,0) rotate(360deg);
        -o-transform:translate(300px,0) rotate(360deg);
        -ms-transform:translate(300px,0) rotate(360deg);
        transform:translate3d(300px,0,0) rotate(360deg)
    }
    .animation-element.slide-rotate-clockwise-180,.animation-element.slide-rotate-counterclockwise-180{
        opacity:0;
        -moz-transition:.5s linear;
        -webkit-transition:.5s linear;
        -o-transition:.5s linear;
        transition:.5s linear;
        -moz-transform:rotate(180deg);
        -webkit-transform:rotate(180deg);
        -o-transform:rotate(180deg);
        -ms-transform:rotate(180deg);
        transform:rotate(180deg)
    }
    .animation-element.slide-fade{
        opacity:0;
        -moz-transition:1s linear;
        -webkit-transition:1s linear;
        -o-transition:1s linear;
        transition:1s linear
    }
    .animation-element.slide-fade-slow{
        opacity:0;
        -moz-transition:2s linear;
        -webkit-transition:2s linear;
        -o-transition:2s linear;
        transition:2s linear
    }
    .animation-element.slide-fade-xslow{
        opacity:0;
        -moz-transition:3s linear;
        -webkit-transition:3s linear;
        -o-transition:3s linear;
        transition:3s linear
    }
    .animation-element.slide-flip-x{
        opacity:0;
        -moz-transition:.5s linear;
        -webkit-transition:.5s linear;
        -o-transition:.5s linear;
        transition:.5s linear;
        -moz-transform:rotateY(360deg);
        -webkit-transform:rotateY(360deg);
        -o-transform:rotateY(360deg);
        -ms-transform:rotateY(360deg);
        transform:rotateY(360deg)
    }
    .animation-element.slide-flip-y{
        opacity:0;
        -moz-transition:.5s linear;
        -webkit-transition:.5s linear;
        -o-transition:.5s linear;
        transition:.5s linear;
        -moz-transform:rotateX(360deg);
        -webkit-transform:rotateX(360deg);
        -o-transform:rotateX(360deg);
        -ms-transform:rotateX(360deg);
        transform:rotateX(360deg)
    }
    .animation-element.slide-left-flip-x-y{
        opacity:0;
        -moz-transition:1s linear;
        -webkit-transition:1s linear;
        -o-transition:1s linear;
        transition:1s linear;
        -moz-transform:translate3d(-200px,0,0) rotateX(360deg) rotateY(360deg);
        -webkit-transform:translate3d(-200px,0,0) rotateX(360deg) rotateY(360deg);
        -o-transform:translate(-200px,0) rotateX(360deg) rotateY(360deg);
        -ms-transform:translate(-200px,0) rotateX(360deg) rotateY(360deg);
        transform:translate3d(-200px,0,0) rotateX(360deg) rotateY(360deg)
    }
    .animation-element.slide-right-flip-x-y{
        opacity:0;
        -moz-transition:1s linear;
        -webkit-transition:1s linear;
        -o-transition:1s linear;
        transition:1s linear;
        -moz-transform:translate3d(200px,0,0) rotateX(360deg) rotateY(360deg);
        -webkit-transform:translate3d(200px,0,0) rotateX(360deg) rotateY(360deg);
        -o-transform:translate(200px,0) rotateX(360deg) rotateY(360deg);
        -ms-transform:translate(200px,0) rotateX(360deg) rotateY(360deg);
        transform:translate3d(200px,0,0) rotateX(360deg) rotateY(360deg)
    }
    .animation-element.in-view{
        opacity:1;
        -moz-transform:translate3d(0,0,0);
        -webkit-transform:translate3d(0,0,0);
        -o-transform:translate(0,0);
        -ms-transform:translate(0,0);
        transform:translate3d(0,0,0)
    }
    .animation-element.slide-rotate-clockwise.in-view,.animation-element.slide-rotate-counterclockwise-180.in-view{
        opacity:1;
        -moz-transform:rotate(360deg);
        -webkit-transform:rotate(360deg);
        -o-transform:rotate(360deg);
        -ms-transform:rotate(360deg);
        transform:rotate(360deg)
    }
    .animation-element.slide-rotate-clockwise-180.in-view,.animation-element.slide-rotate-counterclockwise.in-view{
        opacity:1;
        -moz-transform:rotate(0);
        -webkit-transform:rotate(0);
        -o-transform:rotate(0);
        -ms-transform:rotate(0);
        transform:rotate(0)
    }
    .animation-element.slide-left-rotate-clockwise.in-view{
        opacity:1;
        -moz-transform:translate3d(0,0,0) rotate(360deg);
        -webkit-transform:translate3d(0,0,0) rotate(360deg);
        -o-transform:translate(0,0) rotate(360deg);
        -ms-transform:translate(0,0) rotate(360deg);
        transform:translate3d(0,0,0) rotate(360deg)
    }
    .animation-element.slide-right-rotate-counterclockwise.in-view{
        opacity:1;
        -moz-transform:translate3d(0,0,0) rotate(0);
        -webkit-transform:translate3d(0,0,0) rotate(0);
        -o-transform:translate(0,0) rotate(0);
        -ms-transform:translate(0,0) rotate(0);
        transform:translate3d(0,0,0) rotate(0)
    }
    .animation-element.slide-flip-x.in-view{
        opacity:1;
        -moz-transform:rotateY(0);
        -webkit-transform:rotateY(0);
        -o-transform:rotateY(0);
        -ms-transform:rotateY(0);
        transform:rotateY(0)
    }
    .animation-element.slide-flip-y.in-view{
        opacity:1;
        -moz-transform:rotateX(0);
        -webkit-transform:rotateX(0);
        -o-transform:rotateX(0);
        -ms-transform:rotateX(0);
        transform:rotateX(0)
    }
    .animation-element.slide-left-flip-x-y.in-view,.animation-element.slide-right-flip-x-y.in-view{
        opacity:1;
        -moz-transform:translate3d(0,0,0) rotateX(0) rotateY(0);
        -webkit-transform:translate3d(0,0,0) rotateX(0) rotateY(0);
        -o-transform:translate(0,0) rotateX(0) rotateY(0);
        -ms-transform:translate(0,0) rotateX(0) rotateY(0);
        transform:translate3d(0,0,0) rotateX(0) rotateY(0)
    }
    .dev.product-list .product-item{
        opacity:1;
        -moz-transform:none!important;
        -webkit-transform:none!important;
        -o-transform:none!important;
        -ms-transform:none!important;
        transform:none!important
    }
    .bs-icon{
        --bs-icon-size:.75rem;
        display:flex;
        flex-shrink:0;
        justify-content:center;
        align-items:center;
        font-size:var(--bs-icon-size);
        width:calc(var(--bs-icon-size) * 2);
        height:calc(var(--bs-icon-size) * 2);
        color:var(--bs-primary)
    }
    .bs-icon-xs{
        --bs-icon-size:1rem;
        width:calc(var(--bs-icon-size) * 1.5);
        height:calc(var(--bs-icon-size) * 1.5)
    }
    .bs-icon-sm{
        --bs-icon-size:1rem
    }
    .bs-icon-md{
        --bs-icon-size:1.5rem
    }
    .bs-icon-lg{
        --bs-icon-size:2rem
    }
    .bs-icon-xl{
        --bs-icon-size:2.5rem
    }
    .bs-icon.bs-icon-primary{
        color:var(--bs-white);
        background:var(--bs-primary)
    }
    .bs-icon.bs-icon-primary-light{
        color:var(--bs-primary);
        background:rgba(var(--bs-primary-rgb),.2)
    }
    .bs-icon.bs-icon-semi-white{
        color:var(--bs-primary);
        background:rgba(255,255,255,.5)
    }
    .bs-icon.bs-icon-rounded{
        border-radius:.5rem
    }
    .bs-icon.bs-icon-circle{
        border-radius:50%
    }
    .col-item{
        border:1px solid #e1e1e1;
        border-radius:5px;
        background:#fff
    }
    .col-item .photo img{
        margin:0 auto;
        width:100%
    }
    .col-item .info{
        padding:10px;
        border-radius:0 0 5px 5px;
        margin-top:1px
    }
    .col-item:hover .info{
        background-color:beige
    }
    .col-item .price{
        float:left;
        margin-top:5px
    }
    .col-item .price h5{
        line-height:20px;
        margin:0
    }
    .price-text-color{
        color:#219fd1
    }
    .col-item .info .rating{
        color:#777
    }
    .col-item .rating{
        float:left;
        font-size:17px;
        text-align:right;
        line-height:52px;
        margin-bottom:10px;
        height:52px
    }
    .col-item .separator{
        border-top:1px solid #e1e1e1
    }
    .clear-left{
        clear:left
    }
    .col-item .separator p{
        line-height:20px;
        margin-bottom:0;
        margin-top:10px;
        text-align:center
    }
    .col-item .separator p i{
        margin-right:5px
    }
    .col-item .btn-add{
        width:50%;
        float:left;
        border-right:1px solid #e1e1e1
    }
    .col-item .btn-details{
        width:50%;
        float:left;
        padding-left:10px
    }
    .controls{
        margin-top:20px
    }
    [data-slide=prev]{
        margin-right:10px
    }
    .search-form{
        margin:40px 5px;
        font:12px sans-serif;
        box-shadow:1px 2px 4px 0 rgba(0,0,0,.08)
    }
    .search-form div.input-group-addon{
        background:#fff;
        color:#80a3bd;
        border-bottom-left-radius:2px;
        border-top-left-radius:2px;
        border:1px solid #b6c3cd;
        border-right:0
    }
    .search-form .input-group input{
        background-color:#fff;
        box-shadow:none;
        color:#4e565c;
        outline:0;
        border:1px solid #b6c3cd;
        border-right:0;
        border-left:0
    }
    .search-form div.input-group-btn button{
        border-bottom-right-radius:2px;
        border-top-right-radius:2px;
        background:#6caee0;
        box-shadow:1px 2px 4px 0 rgba(0,0,0,.08);
        color:#fff;
        border-color:#6caee0;
        outline:0;
        opacity:.9
    }
    .search-form div.input-group-btn button:hover{
        opacity:1
    }
    .search-form div.input-group-btn button:focus:active{
        background-color:#6caee0;
        color:#fff;
        outline:0
    }
    .row{
        padding:7px
    }
    .form-control-borderless{
        border:none
    }
    .form-control-borderless:active,.form-control-borderless:focus,.form-control-borderless:hover{
        border:none;
        outline:0;
        box-shadow:none
    }
    @container (min-width:1200px){
        .form-control{
            display:block;
            width:40rem;
            padding:.75rem 1.5rem;
            font-size:1rem;
            font-weight:300;
            line-height:1.5;
            color:var(--bs-body-color);
            -webkit-appearance:none;
            -moz-appearance:none;
            appearance:none;
            background-color:#f7f7f9;
            background-clip:padding-box;
            transition:border-color .15s ease-in-out,box-shadow .15s ease-in-out
        }
    }
    .nav-item{
        margin-right:1vw
    }
    .btn-primary:hover{
        color:#fff;
        background-color:#a4a4a4;
        border-color:#000
    }
    .card .mb-5{
        margin-bottom:3rem!important
    }
    .card.mb-5{
        margin-bottom:0!important
    }
    @media (min-width:768px){
        .form-register{
            width:85%
        }
    }
    @media (min-width:300px){
        .headinglog{
            font-weight:700;
            font-size:21px
        }
        .form-register{
            width:100%
        }
        .ctk-login{
            font-size:13px
        }
    }
    @media (min-width:768px){
        .form-register{
            width:90%
        }
        .containerhome{
            width:100%
        }
    }
    a{
        text-decoration:none
    }
    @media (min-width:300px){
        .containerhome{
            width:100%
        }
    }
    @media (min-width:576px){
        .headinglog{
            font-weight:700;
            font-size:30px
        }
        .ctk-login{
            font-size:16px
        }
        .containerhome{
            width:100%
        }
    }
    @media (min-width:992px){
        .navbar-expand-lg .navbar-nav .nav-link{
            padding-right:var(--bs-navbar-nav-link-padding-x);
            padding-left:var(--bs-navbar-nav-link-padding-x)
        }
        .taosanpham{
            width:50rem
        }
        .containerhome{
            width:55rem
        }
    }
    @media (min-width:1200px){
        .form-register{
            width:85%
        }
        .containerhome{
            width:60rem
        }
    }
    @media (min-width:1400px){
        .containerhome{
            width:60rem
        }
    }
    .list-group-item-action{
        color:var(--bs-list-group-action-color);
        text-align:inherit;
        background-size:cover;
        display:flex;
        -webkit-box-align:center;
        align-items:center;
        text-decoration:none;
        flex-direction:column;
        max-width:100%
    }
    .titlemucluc{
        color:#222;
        text-shadow:#fff 0 0;
        line-height:1.29;
        font-size:14px;
        text-align:center;
        width:110px;
        height:35px;
        margin-top:8px;
        margin-left:0;
        font-weight:400;
        font-stretch:normal;
        font-style:normal;
        display:-webkit-box;
        -webkit-line-clamp:2;
        -webkit-box-orient:vertical;
        overflow:hidden;
        text-overflow:ellipsis
    }
    .img-fluid{
        max-width:70%;
        height:auto;
        border-radius:25%;
        box-shadow:0 0 3px
    }
    .list-group,.s1vhbdc8>textarea{
        overflow:auto
    }
    .danhsanh{
        display:flex;
        flex-wrap:wrap;
        border-top:1px solid #f4f4f4
    }
    .titlehome{
        display:block;
        height:100%;
        position:relative
    }
    .imghome{
        background-size:cover!important;
        border-radius:5px;
        display:inline-block;
        overflow:hidden;
        position:relative;
        width:100%
    }
    .texthome{
        color:#222;
        display:block;
        font-size:14px!important;
        height:40px!important;
        line-height:1.43!important;
        margin-top:8px;
        overflow-wrap:anywhere;
        text-decoration:none;
        text-overflow:unset;
        white-space:unset
    }
    .pricehome{
        color:#d0021b;
        display:inline-block;
        font-size:15px;
        font-weight:700;
        line-height:1.33;
        margin:2px 4px 0 0
    }
    .adthumnail{
        display:flex;
        justify-content:center;
        position:relative
    }
    .AdBody_footer__78mtV{
        bottom:-6px;
        color:#9b9b9b;
        left:0;
        width:100%
    }
    .AdBody_footer__78mtV .AdBody_adItemPostedTime__Oj7pr{
        display:inline-block;
        font-size:11px;
        margin-top:2px;
        overflow:hidden;
        text-overflow:ellipsis;
        text-transform:capitalize;
        vertical-align:middle;
        white-space:nowrap
    }
    .commonStyle_deviderWrapper__3FHXZ,.r1ttq5qi,.s1xi7pki{
        display:inline-block
    }
    .AdBody_footer__78mtV .AdBody_adItemPostedTime__Oj7pr.AdBody_location__ujScT{
        max-width:56px
    }
    .formhome:hover{
        box-shadow:inset 0 0 5px
    }
    .texthome:hover{
        color:#0085ff;
        font-weight:700;
        transition:.2s
    }
    #navbarSupportedContent{
        justify-content:space-around;
        white-space:nowrap
    }
    .mx-auto{
        margin-right:1vw!important;
        margin-left:auto!important
    }
    .bi-bagfocus,.bi-baghover{
        color:rgba(0,0,0,.4)
    }
    .form-control:focus{
        color:var(--bs-body-color);
        background-color:#f7f7f9;
        border-color:#8d8d8d;
        outline:0;
        box-shadow:0 0 0 1px #000
    }
    .navbar-toggler:focus{
        text-decoration:none;
        outline:0;
        box-shadow:0 0 0 1px #000
    }
    .bi-bag{
        color:#000
    }
    @media (max-width:768px){
        .navbar-item{
            margin-top:10px!important
        }
    }
    .icoquanly{
        color:#000;
        font-size:23px
    }
    .spanquanly{
        color:#000;
        margin-left:0;
        padding-left:10px
    }
    .bag:hover,.quanlytin:hover{
        background-color:#f8f9fa;
        transition:150ms
    }
    @media (max-width:990px){
        .btn-primary{
            --bs-btn-color:#fff;
            --bs-btn-bg:#1a1a1a;
            --bs-btn-border-color:#1a1a1a;
            --bs-btn-hover-color:#fff;
            --bs-btn-hover-bg:#161616;
            --bs-btn-hover-border-color:#151515;
            --bs-btn-focus-shadow-rgb:60,60,60;
            --bs-btn-active-color:#fff;
            --bs-btn-active-bg:#151515;
            --bs-btn-active-border-color:#141414;
            --bs-btn-active-shadow:inset 0 3px 5px rgba(0, 0, 0, 0.125);
            --bs-btn-disabled-color:#fff;
            --bs-btn-disabled-bg:#1a1a1a;
            --bs-btn-disabled-border-color:#1a1a1a;
            margin-top:5px
        }
        .btn-outline-primary{
            --bs-btn-color:#1a1a1a;
            --bs-btn-border-color:#1a1a1a;
            --bs-btn-hover-color:#fff;
            --bs-btn-hover-bg:#1a1a1a;
            --bs-btn-hover-border-color:#1a1a1a;
            --bs-btn-focus-shadow-rgb:26,26,26;
            --bs-btn-active-color:#fff;
            --bs-btn-active-bg:#1a1a1a;
            --bs-btn-active-border-color:#1a1a1a;
            --bs-btn-active-shadow:inset 0 3px 5px rgba(0, 0, 0, 0.125);
            --bs-btn-disabled-color:#1a1a1a;
            --bs-btn-disabled-bg:transparent;
            --bs-btn-disabled-border-color:#1a1a1a;
            --bs-gradient:none;
            margin-top:5px
        }
        .form-control{
            display:block;
            width:100%;
            padding:.75rem 1.5rem;
            font-size:1rem;
            font-weight:300;
            line-height:1.5;
            color:var(--bs-body-color);
            -webkit-appearance:none;
            -moz-appearance:none;
            appearance:none;
            background-color:#f7f7f9;
            background-clip:padding-box;
            border:0 solid var(--bs-border-color);
            border-radius:0;
            transition:border-color .15s ease-in-out,box-shadow .15s ease-in-out;
            margin-top:5px
        }
        .nav-item{
            margin-right:0;
            margin-top:5px
        }
    }
    .icon.ion-bag.bi-bag{
        font-size:27px
    }
    .dropdown-item:focus,.dropdown-item:hover{
        color:#000;
        background-color:var(--bs-dropdown-link-hover-bg)
    }
    .orderconfirm{
        max-width:100%
    }
    @media (min-width:768px){
        .orderconfirm{
            max-width:50rem
        }
    }
    .BuyNow_depositBlock__2Du5S{
        background-color:#fff;
        padding:16px;
        margin-bottom:12px;
        border-radius:0
    }
    .xacnhan{
        margin-top:0;
        margin-bottom:0;
        font-size:1.125rem;
        font-weight:700
    }
    .BuyNow_announcementBox__SA5_X{
        display:flex;
        align-items:center;
        padding:14px 16px;
        background-color:#f1f8ee;
        margin:10px -16px -8px;
        box-shadow:inset 0 0 10px #f4f4ff
    }
    .CheckoutDescription_blockHeading__Je1tp,.DeliveryAddress_blockHeading__A4Mez,.DeliveryMethod_blockHeading__j8mDT,.OrderType_blockHeading__zhddD,.PaymentMethod_blockHeading__W_Sru{
        display:flex;
        align-items:center;
        position:relative;
        margin-bottom:12px
    }
    .popup{
        display:none;
        position:fixed;
        top:50%;
        left:50%;
        transform:translate(-50%,-50%);
        border:1px solid #ccc;
        padding:20px;
        background-color:#fff;
        z-index:1
    }
    .popup-content{
        max-height:200px;
        overflow-y:auto
    }
    .close{
        position:absolute;
        top:10px;
        right:10px;
        font-size:20px;
        cursor:pointer
    }
    .AdDetail_adInfo___BEZX{
        background-color:#fff;
        height:auto
    }
    .AdDetail_adInfo___BEZX .AdDetail_adInfoHeader__UIEP3{
        display:flex;
        align-items:center;
        justify-content:space-between;
        margin-bottom:8px
    }
    .AdDetail_adInfo___BEZX .AdDetail_adInfoAuthor__wmfQc,.Policy_policyWrapper__TwZLN{
        display:flex;
        align-items:center
    }
    .AdDetail_adInfo___BEZX .AdDetail_adInfoAuthor__wmfQc img,.AdDetail_adInfo___BEZX .AdDetail_adInfoAuthor__wmfQc object{
        width:24px;
        height:24px;
        -o-object-fit:cover;
        object-fit:cover;
        border-radius:100%
    }
    .AdDetail_adInfo___BEZX .AdDetail_adInfoAuthor__wmfQc>span{
        margin-left:8px;
        display:-webkit-box;
        -webkit-line-clamp:1;
        -webkit-box-orient:vertical;
        overflow:hidden;
        text-overflow:ellipsis;
        max-width:230px;
        font-weight:700
    }
    .chat:hover{
        background-color:#ebebeb
    }
    .chat{
        border:1px solid #e8e8e8;
        padding:4px 8px;
        border-radius:4px;
        cursor:pointer;
        transition:150ms
    }
    .AdDetail_adInfo___BEZX .AdDetail_adInfoBody__7JodI,.OrderType_checkboxWrapper__5OYiC{
        display:flex
    }
    .AdDetail_adInfo___BEZX .AdDetail_adInfoBody__7JodI img,.AdDetail_adInfo___BEZX .AdDetail_adInfoBody__7JodI object{
        width:64px;
        height:64px;
        -o-object-fit:cover;
        object-fit:cover;
        border-radius:2px
    }
    .AdDetail_adInfo___BEZX .AdDetail_adInfoBody__7JodI>section{
        display:flex;
        flex-direction:column;
        margin-left:8px
    }
    .AdDetail_adInfo___BEZX .AdDetail_adInfoBody__7JodI>section>p{
        margin-bottom:2px
    }
    .OrderType_checkboxWrapper__5OYiC .OrderType_orderType__2mv_D{
        flex:1;
        display:flex;
        flex-direction:column;
        align-items:flex-start;
        grid-gap:8px;
        gap:8px;
        border-radius:4px;
        border:1px solid #d9d9d9;
        padding:14px;
        margin-bottom:16px;
        background:0 0;
        outline:0;
        line-height:1.15
    }
    .OrderType_checkboxWrapper__5OYiC .OrderType_orderType__2mv_D:not(:last-child){
        margin-right:10px
    }
    .OrderType_checkboxWrapper__5OYiC .OrderType_orderType__2mv_D .OrderType_orderTypeLabel__PkaYS{
        display:flex;
        width:100%;
        font-size:16px
    }
    @media (max-width:300px){
        .OrderType_checkboxWrapper__5OYiC .OrderType_orderType__2mv_D .OrderType_orderTypeLabel__PkaYS{
            font-size:14px
        }
    }
    .OrderType_checkboxWrapper__5OYiC .OrderType_orderType__2mv_D .OrderType_orderTypeLabel__PkaYS>b{
        color:#cc7a00;
        text-transform:uppercase
    }
    .r1ttq5qi{
        width:var(--r1ttq5qi-0)
    }
    .OrderType_checkboxWrapper__5OYiC .OrderType_orderType__2mv_D>small{
        font-size:12px;
        color:#777;
        text-align:left
    }
    .OrderType_protectedBuy__pSeNM{
        padding:16px;
        border-radius:4px;
        display:flex;
        align-items:center;
        background-color:#f1f8ee
    }
    .OrderType_protectedBuy__pSeNM>p{
        margin:0 0 0 5px
    }
    .DeliveryMethod_deliveryMethod__H7U35{
        display:flex;
        align-items:center;
        padding:12px 0
    }
    .DeliveryMethod_deliveryMethod__H7U35>section{
        display:flex;
        flex-direction:column
    }
    .DeliveryMethod_deliveryMethod__H7U35>section>p{
        margin-bottom:0;
        margin-left:5px;
        color:#000
    }
    .PaymentMethod_paymentMethod__H_S1g{
        display:flex;
        align-items:center;
        position:relative;
        padding:16px 0
    }
    .PaymentMethod_paymentMethod__H_S1g>p{
        margin:0
    }
    .BuyNow_sawTooth__o0iec{
        background-image:linear-gradient(135deg,transparent 50%,transparent 0),linear-gradient(225deg,transparent 50%,transparent 0),linear-gradient(45deg,#f4f4f4 50%,transparent 0),linear-gradient(-45deg,#f4f4f4 50%,transparent 0);
        background-position:0 0,0 0,0 100%,0 100%;
        background-size:12px 12px;
        background-repeat:repeat-x;
        margin-bottom:0
    }
    .CheckoutDescription_blockCalculate__PacGy{
        display:flex;
        align-items:center;
        justify-content:space-between;
        margin-bottom:12px
    }
    .CheckoutDescription_blockCalculate__PacGy p{
        margin:0
    }
    .CheckoutDescription_blockCalculateTotal__K7__h{
        font-size:16px
    }
    .c1tydqxk{
        display:table;
        position:relative;
        width:var(--c1tydqxk-0)
    }
    .t1dkrvxv{
        width:100%;
        border-radius:4px;
        border:1px solid silver;
        height:var(--t1dkrvxv-5);
        min-height:48px;
        background-color:#fff
    }
    .p1caxrzq{
        color:#8c8c8c;
        font-size:.625rem;
        min-height:16px;
        margin-left:12px;
        line-height:1.5;
        text-align:left
    }
    .t1dkrvxv>.focus-capture{
        cursor:text;
        height:30px
    }
    .s1vhbdc8{
        border-radius:4px;
        width:100%;
        padding:0 12px 4px;
        outline:0;
        border:none;
        line-height:20px;
        height:calc(100% - 30px);
        resize:none;
        background-color:#fff
    }
    .s1vhbdc8:not(:focus):not(.hasValue):not(:-webkit-autofill){
        padding-top:7px
    }
    .t1dkrvxv>label{
        position:absolute;
        top:11px;
        left:13px;
        cursor:text;
        -webkit-user-select:none;
        -moz-user-select:none;
        user-select:none;
        transform-origin:top left;
        transition:transform .1s;
        color:#8c8c8c;
        font-size:.875rem;
        margin-bottom:8px
    }
    .t1dkrvxv:hover{
        border-color:#f09911
    }
    .TotalAmount_totalAmountWrapper__dbGTZ{
        display:flex;
        align-items:center;
        justify-content:space-between
    }
    .TotalAmount_totalAmountWrapper__dbGTZ>p{
        color:#9b9b9b;
        font-size:10px;
        font-weight:700
    }
    .TotalAmount_totalAmountWrapper__dbGTZ>p>b{
        font-size:18px;
        color:#000
    }
    .TotalAmount_button__q6X_0,.btnorder{
        width:70%
    }
    .TotalAmount_button__q6X_0>button{
        font-size:14px!important
    }
    .eJpLJe.disabled{
        color:#fff!important;
        background-color:#cacaca!important;
        border:1px solid #cacaca!important
    }
    .eJpLJe.item-button{
        font-size:16px;
        font-weight:700;
        text-transform:uppercase;
        font-stretch:normal;
        font-style:normal;
        line-height:16px;
        letter-spacing:normal;
        width:100%;
        text-align:center;
        color:#fff;
        background-color:#fe9900;
        border:1px solid #fe9900;
        margin:0 auto;
        display:flex;
        -webkit-box-align:center;
        align-items:center;
        -webkit-box-pack:center;
        justify-content:center;
        padding-bottom:12px
    }
    .btnorder{
        width:90%;
        border-radius:4px
    }
</style>
