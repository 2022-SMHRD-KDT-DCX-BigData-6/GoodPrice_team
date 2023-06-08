<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.tb_memberDTO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.smhrd.model.tb_storeDAO"%>
<%@page import="com.smhrd.model.tb_storeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="overflow: hidden;"><head>
   <script type="text/javascript" src="js/jquery-3.6.4.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>혜자특공대</title>
    <!-- Google Font -->
    <link href="http://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

    <!-- Font Awesome -->


    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

     <!-- Preloader -->
    <link rel="stylesheet" href="css/preloader.css" type="text/css" media="screen, print">

    <!-- Icon Font-->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.default.css">
    <!-- Animate CSS-->
    <link rel="stylesheet" href="css/animate.css">

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">



    <!-- Style -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/mainpage.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="css/responsive.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/lte-ie7.js"></script>
     <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
     <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
   <![endif]-->
   
   <!-- 06.05  수정 -->
<script type="text/javascript" src="js/jquery-3.6.4.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c21e04ab9896f84f77e9ff0564735da3&amp;libraries=services"></script><script charset="UTF-8" src="http://t1.daumcdn.net/mapjsapi/js/main/4.4.8/kakao.js"></script><script charset="UTF-8" src="http://t1.daumcdn.net/mapjsapi/js/libs/services/1.0.2/services.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0"></script><style>.swal2-popup.swal2-toast{flex-direction:row;align-items:center;width:auto;padding:.625em;overflow-y:hidden;background:#fff;box-shadow:0 0 .625em #d9d9d9}.swal2-popup.swal2-toast .swal2-header{flex-direction:row;padding:0}.swal2-popup.swal2-toast .swal2-title{flex-grow:1;justify-content:flex-start;margin:0 .6em;font-size:1em}.swal2-popup.swal2-toast .swal2-footer{margin:.5em 0 0;padding:.5em 0 0;font-size:.8em}.swal2-popup.swal2-toast .swal2-close{position:static;width:.8em;height:.8em;line-height:.8}.swal2-popup.swal2-toast .swal2-content{justify-content:flex-start;padding:0;font-size:1em}.swal2-popup.swal2-toast .swal2-icon{width:2em;min-width:2em;height:2em;margin:0}.swal2-popup.swal2-toast .swal2-icon .swal2-icon-content{display:flex;align-items:center;font-size:1.8em;font-weight:700}@media all and (-ms-high-contrast:none),(-ms-high-contrast:active){.swal2-popup.swal2-toast .swal2-icon .swal2-icon-content{font-size:.25em}}.swal2-popup.swal2-toast .swal2-icon.swal2-success .swal2-success-ring{width:2em;height:2em}.swal2-popup.swal2-toast .swal2-icon.swal2-error [class^=swal2-x-mark-line]{top:.875em;width:1.375em}.swal2-popup.swal2-toast .swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=left]{left:.3125em}.swal2-popup.swal2-toast .swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=right]{right:.3125em}.swal2-popup.swal2-toast .swal2-actions{flex-basis:auto!important;width:auto;height:auto;margin:0 .3125em;padding:0}.swal2-popup.swal2-toast .swal2-styled{margin:.125em .3125em;padding:.3125em .625em;font-size:1em}.swal2-popup.swal2-toast .swal2-styled:focus{box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(100,150,200,.5)}.swal2-popup.swal2-toast .swal2-success{border-color:#a5dc86}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-circular-line]{position:absolute;width:1.6em;height:3em;transform:rotate(45deg);border-radius:50%}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-circular-line][class$=left]{top:-.8em;left:-.5em;transform:rotate(-45deg);transform-origin:2em 2em;border-radius:4em 0 0 4em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-circular-line][class$=right]{top:-.25em;left:.9375em;transform-origin:0 1.5em;border-radius:0 4em 4em 0}.swal2-popup.swal2-toast .swal2-success .swal2-success-ring{width:2em;height:2em}.swal2-popup.swal2-toast .swal2-success .swal2-success-fix{top:0;left:.4375em;width:.4375em;height:2.6875em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-line]{height:.3125em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-line][class$=tip]{top:1.125em;left:.1875em;width:.75em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-line][class$=long]{top:.9375em;right:.1875em;width:1.375em}.swal2-popup.swal2-toast .swal2-success.swal2-icon-show .swal2-success-line-tip{-webkit-animation:swal2-toast-animate-success-line-tip .75s;animation:swal2-toast-animate-success-line-tip .75s}.swal2-popup.swal2-toast .swal2-success.swal2-icon-show .swal2-success-line-long{-webkit-animation:swal2-toast-animate-success-line-long .75s;animation:swal2-toast-animate-success-line-long .75s}.swal2-popup.swal2-toast.swal2-show{-webkit-animation:swal2-toast-show .5s;animation:swal2-toast-show .5s}.swal2-popup.swal2-toast.swal2-hide{-webkit-animation:swal2-toast-hide .1s forwards;animation:swal2-toast-hide .1s forwards}.swal2-container{display:flex;position:fixed;z-index:1060;top:0;right:0;bottom:0;left:0;flex-direction:row;align-items:center;justify-content:center;padding:.625em;overflow-x:hidden;transition:background-color .1s;-webkit-overflow-scrolling:touch}.swal2-container.swal2-backdrop-show,.swal2-container.swal2-noanimation{background:rgba(0,0,0,.4)}.swal2-container.swal2-backdrop-hide{background:0 0!important}.swal2-container.swal2-top{align-items:flex-start}.swal2-container.swal2-top-left,.swal2-container.swal2-top-start{align-items:flex-start;justify-content:flex-start}.swal2-container.swal2-top-end,.swal2-container.swal2-top-right{align-items:flex-start;justify-content:flex-end}.swal2-container.swal2-center{align-items:center}.swal2-container.swal2-center-left,.swal2-container.swal2-center-start{align-items:center;justify-content:flex-start}.swal2-container.swal2-center-end,.swal2-container.swal2-center-right{align-items:center;justify-content:flex-end}.swal2-container.swal2-bottom{align-items:flex-end}.swal2-container.swal2-bottom-left,.swal2-container.swal2-bottom-start{align-items:flex-end;justify-content:flex-start}.swal2-container.swal2-bottom-end,.swal2-container.swal2-bottom-right{align-items:flex-end;justify-content:flex-end}.swal2-container.swal2-bottom-end>:first-child,.swal2-container.swal2-bottom-left>:first-child,.swal2-container.swal2-bottom-right>:first-child,.swal2-container.swal2-bottom-start>:first-child,.swal2-container.swal2-bottom>:first-child{margin-top:auto}.swal2-container.swal2-grow-fullscreen>.swal2-modal{display:flex!important;flex:1;align-self:stretch;justify-content:center}.swal2-container.swal2-grow-row>.swal2-modal{display:flex!important;flex:1;align-content:center;justify-content:center}.swal2-container.swal2-grow-column{flex:1;flex-direction:column}.swal2-container.swal2-grow-column.swal2-bottom,.swal2-container.swal2-grow-column.swal2-center,.swal2-container.swal2-grow-column.swal2-top{align-items:center}.swal2-container.swal2-grow-column.swal2-bottom-left,.swal2-container.swal2-grow-column.swal2-bottom-start,.swal2-container.swal2-grow-column.swal2-center-left,.swal2-container.swal2-grow-column.swal2-center-start,.swal2-container.swal2-grow-column.swal2-top-left,.swal2-container.swal2-grow-column.swal2-top-start{align-items:flex-start}.swal2-container.swal2-grow-column.swal2-bottom-end,.swal2-container.swal2-grow-column.swal2-bottom-right,.swal2-container.swal2-grow-column.swal2-center-end,.swal2-container.swal2-grow-column.swal2-center-right,.swal2-container.swal2-grow-column.swal2-top-end,.swal2-container.swal2-grow-column.swal2-top-right{align-items:flex-end}.swal2-container.swal2-grow-column>.swal2-modal{display:flex!important;flex:1;align-content:center;justify-content:center}.swal2-container.swal2-no-transition{transition:none!important}.swal2-container:not(.swal2-top):not(.swal2-top-start):not(.swal2-top-end):not(.swal2-top-left):not(.swal2-top-right):not(.swal2-center-start):not(.swal2-center-end):not(.swal2-center-left):not(.swal2-center-right):not(.swal2-bottom):not(.swal2-bottom-start):not(.swal2-bottom-end):not(.swal2-bottom-left):not(.swal2-bottom-right):not(.swal2-grow-fullscreen)>.swal2-modal{margin:auto}@media all and (-ms-high-contrast:none),(-ms-high-contrast:active){.swal2-container .swal2-modal{margin:0!important}}.swal2-popup{display:none;position:relative;box-sizing:border-box;flex-direction:column;justify-content:center;width:32em;max-width:100%;padding:1.25em;border:none;border-radius:5px;background:#fff;font-family:inherit;font-size:1rem}.swal2-popup:focus{outline:0}.swal2-popup.swal2-loading{overflow-y:hidden}.swal2-header{display:flex;flex-direction:column;align-items:center;padding:0 1.8em}.swal2-title{position:relative;max-width:100%;margin:0 0 .4em;padding:0;color:#595959;font-size:1.875em;font-weight:600;text-align:center;text-transform:none;word-wrap:break-word}.swal2-actions{display:flex;z-index:1;box-sizing:border-box;flex-wrap:wrap;align-items:center;justify-content:center;width:100%;margin:1.25em auto 0;padding:0 1.6em}.swal2-actions:not(.swal2-loading) .swal2-styled[disabled]{opacity:.4}.swal2-actions:not(.swal2-loading) .swal2-styled:hover{background-image:linear-gradient(rgba(0,0,0,.1),rgba(0,0,0,.1))}.swal2-actions:not(.swal2-loading) .swal2-styled:active{background-image:linear-gradient(rgba(0,0,0,.2),rgba(0,0,0,.2))}.swal2-loader{display:none;align-items:center;justify-content:center;width:2.2em;height:2.2em;margin:0 1.875em;-webkit-animation:swal2-rotate-loading 1.5s linear 0s infinite normal;animation:swal2-rotate-loading 1.5s linear 0s infinite normal;border-width:.25em;border-style:solid;border-radius:100%;border-color:#2778c4 transparent #2778c4 transparent}.swal2-styled{margin:.3125em;padding:.625em 1.1em;box-shadow:none;font-weight:500}.swal2-styled:not([disabled]){cursor:pointer}.swal2-styled.swal2-confirm{border:0;border-radius:.25em;background:initial;background-color:#2778c4;color:#fff;font-size:1.0625em}.swal2-styled.swal2-deny{border:0;border-radius:.25em;background:initial;background-color:#d14529;color:#fff;font-size:1.0625em}.swal2-styled.swal2-cancel{border:0;border-radius:.25em;background:initial;background-color:#757575;color:#fff;font-size:1.0625em}.swal2-styled:focus{outline:0;box-shadow:0 0 0 3px rgba(100,150,200,.5)}.swal2-styled::-moz-focus-inner{border:0}.swal2-footer{justify-content:center;margin:1.25em 0 0;padding:1em 0 0;border-top:1px solid #eee;color:#545454;font-size:1em}.swal2-timer-progress-bar-container{position:absolute;right:0;bottom:0;left:0;height:.25em;overflow:hidden;border-bottom-right-radius:5px;border-bottom-left-radius:5px}.swal2-timer-progress-bar{width:100%;height:.25em;background:rgba(0,0,0,.2)}.swal2-image{max-width:100%;margin:1.25em auto}.swal2-close{position:absolute;z-index:2;top:0;right:0;align-items:center;justify-content:center;width:1.2em;height:1.2em;padding:0;overflow:hidden;transition:color .1s ease-out;border:none;border-radius:5px;background:0 0;color:#ccc;font-family:serif;font-size:2.5em;line-height:1.2;cursor:pointer}.swal2-close:hover{transform:none;background:0 0;color:#f27474}.swal2-close:focus{outline:0;box-shadow:inset 0 0 0 3px rgba(100,150,200,.5)}.swal2-close::-moz-focus-inner{border:0}.swal2-content{z-index:1;justify-content:center;margin:0;padding:0 1.6em;color:#545454;font-size:1.125em;font-weight:400;line-height:normal;text-align:center;word-wrap:break-word}.swal2-checkbox,.swal2-file,.swal2-input,.swal2-radio,.swal2-select,.swal2-textarea{margin:1em auto}.swal2-file,.swal2-input,.swal2-textarea{box-sizing:border-box;width:100%;transition:border-color .3s,box-shadow .3s;border:1px solid #d9d9d9;border-radius:.1875em;background:inherit;box-shadow:inset 0 1px 1px rgba(0,0,0,.06);color:inherit;font-size:1.125em}.swal2-file.swal2-inputerror,.swal2-input.swal2-inputerror,.swal2-textarea.swal2-inputerror{border-color:#f27474!important;box-shadow:0 0 2px #f27474!important}.swal2-file:focus,.swal2-input:focus,.swal2-textarea:focus{border:1px solid #b4dbed;outline:0;box-shadow:0 0 0 3px rgba(100,150,200,.5)}.swal2-file::-moz-placeholder,.swal2-input::-moz-placeholder,.swal2-textarea::-moz-placeholder{color:#ccc}.swal2-file:-ms-input-placeholder,.swal2-input:-ms-input-placeholder,.swal2-textarea:-ms-input-placeholder{color:#ccc}.swal2-file::placeholder,.swal2-input::placeholder,.swal2-textarea::placeholder{color:#ccc}.swal2-range{margin:1em auto;background:#fff}.swal2-range input{width:80%}.swal2-range output{width:20%;color:inherit;font-weight:600;text-align:center}.swal2-range input,.swal2-range output{height:2.625em;padding:0;font-size:1.125em;line-height:2.625em}.swal2-input{height:2.625em;padding:0 .75em}.swal2-input[type=number]{max-width:10em}.swal2-file{background:inherit;font-size:1.125em}.swal2-textarea{height:6.75em;padding:.75em}.swal2-select{min-width:50%;max-width:100%;padding:.375em .625em;background:inherit;color:inherit;font-size:1.125em}.swal2-checkbox,.swal2-radio{align-items:center;justify-content:center;background:#fff;color:inherit}.swal2-checkbox label,.swal2-radio label{margin:0 .6em;font-size:1.125em}.swal2-checkbox input,.swal2-radio input{margin:0 .4em}.swal2-input-label{display:flex;justify-content:center;margin:1em auto}.swal2-validation-message{align-items:center;justify-content:center;margin:0 -2.7em;padding:.625em;overflow:hidden;background:#f0f0f0;color:#666;font-size:1em;font-weight:300}.swal2-validation-message::before{content:"!";display:inline-block;width:1.5em;min-width:1.5em;height:1.5em;margin:0 .625em;border-radius:50%;background-color:#f27474;color:#fff;font-weight:600;line-height:1.5em;text-align:center}.swal2-icon{position:relative;box-sizing:content-box;justify-content:center;width:5em;height:5em;margin:1.25em auto 1.875em;border:.25em solid transparent;border-radius:50%;border-color:#000;font-family:inherit;line-height:5em;cursor:default;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.swal2-icon .swal2-icon-content{display:flex;align-items:center;font-size:3.75em}.swal2-icon.swal2-error{border-color:#f27474;color:#f27474}.swal2-icon.swal2-error .swal2-x-mark{position:relative;flex-grow:1}.swal2-icon.swal2-error [class^=swal2-x-mark-line]{display:block;position:absolute;top:2.3125em;width:2.9375em;height:.3125em;border-radius:.125em;background-color:#f27474}.swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=left]{left:1.0625em;transform:rotate(45deg)}.swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=right]{right:1em;transform:rotate(-45deg)}.swal2-icon.swal2-error.swal2-icon-show{-webkit-animation:swal2-animate-error-icon .5s;animation:swal2-animate-error-icon .5s}.swal2-icon.swal2-error.swal2-icon-show .swal2-x-mark{-webkit-animation:swal2-animate-error-x-mark .5s;animation:swal2-animate-error-x-mark .5s}.swal2-icon.swal2-warning{border-color:#facea8;color:#f8bb86}.swal2-icon.swal2-info{border-color:#9de0f6;color:#3fc3ee}.swal2-icon.swal2-question{border-color:#c9dae1;color:#87adbd}.swal2-icon.swal2-success{border-color:#a5dc86;color:#a5dc86}.swal2-icon.swal2-success [class^=swal2-success-circular-line]{position:absolute;width:3.75em;height:7.5em;transform:rotate(45deg);border-radius:50%}.swal2-icon.swal2-success [class^=swal2-success-circular-line][class$=left]{top:-.4375em;left:-2.0635em;transform:rotate(-45deg);transform-origin:3.75em 3.75em;border-radius:7.5em 0 0 7.5em}.swal2-icon.swal2-success [class^=swal2-success-circular-line][class$=right]{top:-.6875em;left:1.875em;transform:rotate(-45deg);transform-origin:0 3.75em;border-radius:0 7.5em 7.5em 0}.swal2-icon.swal2-success .swal2-success-ring{position:absolute;z-index:2;top:-.25em;left:-.25em;box-sizing:content-box;width:100%;height:100%;border:.25em solid rgba(165,220,134,.3);border-radius:50%}.swal2-icon.swal2-success .swal2-success-fix{position:absolute;z-index:1;top:.5em;left:1.625em;width:.4375em;height:5.625em;transform:rotate(-45deg)}.swal2-icon.swal2-success [class^=swal2-success-line]{display:block;position:absolute;z-index:2;height:.3125em;border-radius:.125em;background-color:#a5dc86}.swal2-icon.swal2-success [class^=swal2-success-line][class$=tip]{top:2.875em;left:.8125em;width:1.5625em;transform:rotate(45deg)}.swal2-icon.swal2-success [class^=swal2-success-line][class$=long]{top:2.375em;right:.5em;width:2.9375em;transform:rotate(-45deg)}.swal2-icon.swal2-success.swal2-icon-show .swal2-success-line-tip{-webkit-animation:swal2-animate-success-line-tip .75s;animation:swal2-animate-success-line-tip .75s}.swal2-icon.swal2-success.swal2-icon-show .swal2-success-line-long{-webkit-animation:swal2-animate-success-line-long .75s;animation:swal2-animate-success-line-long .75s}.swal2-icon.swal2-success.swal2-icon-show .swal2-success-circular-line-right{-webkit-animation:swal2-rotate-success-circular-line 4.25s ease-in;animation:swal2-rotate-success-circular-line 4.25s ease-in}.swal2-progress-steps{flex-wrap:wrap;align-items:center;max-width:100%;margin:0 0 1.25em;padding:0;background:inherit;font-weight:600}.swal2-progress-steps li{display:inline-block;position:relative}.swal2-progress-steps .swal2-progress-step{z-index:20;flex-shrink:0;width:2em;height:2em;border-radius:2em;background:#2778c4;color:#fff;line-height:2em;text-align:center}.swal2-progress-steps .swal2-progress-step.swal2-active-progress-step{background:#2778c4}.swal2-progress-steps .swal2-progress-step.swal2-active-progress-step~.swal2-progress-step{background:#add8e6;color:#fff}.swal2-progress-steps .swal2-progress-step.swal2-active-progress-step~.swal2-progress-step-line{background:#add8e6}.swal2-progress-steps .swal2-progress-step-line{z-index:10;flex-shrink:0;width:2.5em;height:.4em;margin:0 -1px;background:#2778c4}[class^=swal2]{-webkit-tap-highlight-color:transparent}.swal2-show{-webkit-animation:swal2-show .3s;animation:swal2-show .3s}.swal2-hide{-webkit-animation:swal2-hide .15s forwards;animation:swal2-hide .15s forwards}.swal2-noanimation{transition:none}.swal2-scrollbar-measure{position:absolute;top:-9999px;width:50px;height:50px;overflow:scroll}.swal2-rtl .swal2-close{right:auto;left:0}.swal2-rtl .swal2-timer-progress-bar{right:0;left:auto}@supports (-ms-accelerator:true){.swal2-range input{width:100%!important}.swal2-range output{display:none}}@media all and (-ms-high-contrast:none),(-ms-high-contrast:active){.swal2-range input{width:100%!important}.swal2-range output{display:none}}@-webkit-keyframes swal2-toast-show{0%{transform:translateY(-.625em) rotateZ(2deg)}33%{transform:translateY(0) rotateZ(-2deg)}66%{transform:translateY(.3125em) rotateZ(2deg)}100%{transform:translateY(0) rotateZ(0)}}@keyframes swal2-toast-show{0%{transform:translateY(-.625em) rotateZ(2deg)}33%{transform:translateY(0) rotateZ(-2deg)}66%{transform:translateY(.3125em) rotateZ(2deg)}100%{transform:translateY(0) rotateZ(0)}}@-webkit-keyframes swal2-toast-hide{100%{transform:rotateZ(1deg);opacity:0}}@keyframes swal2-toast-hide{100%{transform:rotateZ(1deg);opacity:0}}@-webkit-keyframes swal2-toast-animate-success-line-tip{0%{top:.5625em;left:.0625em;width:0}54%{top:.125em;left:.125em;width:0}70%{top:.625em;left:-.25em;width:1.625em}84%{top:1.0625em;left:.75em;width:.5em}100%{top:1.125em;left:.1875em;width:.75em}}@keyframes swal2-toast-animate-success-line-tip{0%{top:.5625em;left:.0625em;width:0}54%{top:.125em;left:.125em;width:0}70%{top:.625em;left:-.25em;width:1.625em}84%{top:1.0625em;left:.75em;width:.5em}100%{top:1.125em;left:.1875em;width:.75em}}@-webkit-keyframes swal2-toast-animate-success-line-long{0%{top:1.625em;right:1.375em;width:0}65%{top:1.25em;right:.9375em;width:0}84%{top:.9375em;right:0;width:1.125em}100%{top:.9375em;right:.1875em;width:1.375em}}@keyframes swal2-toast-animate-success-line-long{0%{top:1.625em;right:1.375em;width:0}65%{top:1.25em;right:.9375em;width:0}84%{top:.9375em;right:0;width:1.125em}100%{top:.9375em;right:.1875em;width:1.375em}}@-webkit-keyframes swal2-show{0%{transform:scale(.7)}45%{transform:scale(1.05)}80%{transform:scale(.95)}100%{transform:scale(1)}}@keyframes swal2-show{0%{transform:scale(.7)}45%{transform:scale(1.05)}80%{transform:scale(.95)}100%{transform:scale(1)}}@-webkit-keyframes swal2-hide{0%{transform:scale(1);opacity:1}100%{transform:scale(.5);opacity:0}}@keyframes swal2-hide{0%{transform:scale(1);opacity:1}100%{transform:scale(.5);opacity:0}}@-webkit-keyframes swal2-animate-success-line-tip{0%{top:1.1875em;left:.0625em;width:0}54%{top:1.0625em;left:.125em;width:0}70%{top:2.1875em;left:-.375em;width:3.125em}84%{top:3em;left:1.3125em;width:1.0625em}100%{top:2.8125em;left:.8125em;width:1.5625em}}@keyframes swal2-animate-success-line-tip{0%{top:1.1875em;left:.0625em;width:0}54%{top:1.0625em;left:.125em;width:0}70%{top:2.1875em;left:-.375em;width:3.125em}84%{top:3em;left:1.3125em;width:1.0625em}100%{top:2.8125em;left:.8125em;width:1.5625em}}@-webkit-keyframes swal2-animate-success-line-long{0%{top:3.375em;right:2.875em;width:0}65%{top:3.375em;right:2.875em;width:0}84%{top:2.1875em;right:0;width:3.4375em}100%{top:2.375em;right:.5em;width:2.9375em}}@keyframes swal2-animate-success-line-long{0%{top:3.375em;right:2.875em;width:0}65%{top:3.375em;right:2.875em;width:0}84%{top:2.1875em;right:0;width:3.4375em}100%{top:2.375em;right:.5em;width:2.9375em}}@-webkit-keyframes swal2-rotate-success-circular-line{0%{transform:rotate(-45deg)}5%{transform:rotate(-45deg)}12%{transform:rotate(-405deg)}100%{transform:rotate(-405deg)}}@keyframes swal2-rotate-success-circular-line{0%{transform:rotate(-45deg)}5%{transform:rotate(-45deg)}12%{transform:rotate(-405deg)}100%{transform:rotate(-405deg)}}@-webkit-keyframes swal2-animate-error-x-mark{0%{margin-top:1.625em;transform:scale(.4);opacity:0}50%{margin-top:1.625em;transform:scale(.4);opacity:0}80%{margin-top:-.375em;transform:scale(1.15)}100%{margin-top:0;transform:scale(1);opacity:1}}@keyframes swal2-animate-error-x-mark{0%{margin-top:1.625em;transform:scale(.4);opacity:0}50%{margin-top:1.625em;transform:scale(.4);opacity:0}80%{margin-top:-.375em;transform:scale(1.15)}100%{margin-top:0;transform:scale(1);opacity:1}}@-webkit-keyframes swal2-animate-error-icon{0%{transform:rotateX(100deg);opacity:0}100%{transform:rotateX(0);opacity:1}}@keyframes swal2-animate-error-icon{0%{transform:rotateX(100deg);opacity:0}100%{transform:rotateX(0);opacity:1}}@-webkit-keyframes swal2-rotate-loading{0%{transform:rotate(0)}100%{transform:rotate(360deg)}}@keyframes swal2-rotate-loading{0%{transform:rotate(0)}100%{transform:rotate(360deg)}}body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown){overflow:hidden}body.swal2-height-auto{height:auto!important}body.swal2-no-backdrop .swal2-container{top:auto;right:auto;bottom:auto;left:auto;max-width:calc(100% - .625em * 2);background-color:transparent!important}body.swal2-no-backdrop .swal2-container>.swal2-modal{box-shadow:0 0 10px rgba(0,0,0,.4)}body.swal2-no-backdrop .swal2-container.swal2-top{top:0;left:50%;transform:translateX(-50%)}body.swal2-no-backdrop .swal2-container.swal2-top-left,body.swal2-no-backdrop .swal2-container.swal2-top-start{top:0;left:0}body.swal2-no-backdrop .swal2-container.swal2-top-end,body.swal2-no-backdrop .swal2-container.swal2-top-right{top:0;right:0}body.swal2-no-backdrop .swal2-container.swal2-center{top:50%;left:50%;transform:translate(-50%,-50%)}body.swal2-no-backdrop .swal2-container.swal2-center-left,body.swal2-no-backdrop .swal2-container.swal2-center-start{top:50%;left:0;transform:translateY(-50%)}body.swal2-no-backdrop .swal2-container.swal2-center-end,body.swal2-no-backdrop .swal2-container.swal2-center-right{top:50%;right:0;transform:translateY(-50%)}body.swal2-no-backdrop .swal2-container.swal2-bottom{bottom:0;left:50%;transform:translateX(-50%)}body.swal2-no-backdrop .swal2-container.swal2-bottom-left,body.swal2-no-backdrop .swal2-container.swal2-bottom-start{bottom:0;left:0}body.swal2-no-backdrop .swal2-container.swal2-bottom-end,body.swal2-no-backdrop .swal2-container.swal2-bottom-right{right:0;bottom:0}@media print{body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown){overflow-y:scroll!important}body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown)>[aria-hidden=true]{display:none}body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown) .swal2-container{position:static!important}}body.swal2-toast-shown .swal2-container{background-color:transparent}body.swal2-toast-shown .swal2-container.swal2-top{top:0;right:auto;bottom:auto;left:50%;transform:translateX(-50%)}body.swal2-toast-shown .swal2-container.swal2-top-end,body.swal2-toast-shown .swal2-container.swal2-top-right{top:0;right:0;bottom:auto;left:auto}body.swal2-toast-shown .swal2-container.swal2-top-left,body.swal2-toast-shown .swal2-container.swal2-top-start{top:0;right:auto;bottom:auto;left:0}body.swal2-toast-shown .swal2-container.swal2-center-left,body.swal2-toast-shown .swal2-container.swal2-center-start{top:50%;right:auto;bottom:auto;left:0;transform:translateY(-50%)}body.swal2-toast-shown .swal2-container.swal2-center{top:50%;right:auto;bottom:auto;left:50%;transform:translate(-50%,-50%)}body.swal2-toast-shown .swal2-container.swal2-center-end,body.swal2-toast-shown .swal2-container.swal2-center-right{top:50%;right:0;bottom:auto;left:auto;transform:translateY(-50%)}body.swal2-toast-shown .swal2-container.swal2-bottom-left,body.swal2-toast-shown .swal2-container.swal2-bottom-start{top:auto;right:auto;bottom:0;left:0}body.swal2-toast-shown .swal2-container.swal2-bottom{top:auto;right:auto;bottom:0;left:50%;transform:translateX(-50%)}body.swal2-toast-shown .swal2-container.swal2-bottom-end,body.swal2-toast-shown .swal2-container.swal2-bottom-right{top:auto;right:0;bottom:0;left:auto}body.swal2-toast-column .swal2-toast{flex-direction:column;align-items:stretch}body.swal2-toast-column .swal2-toast .swal2-actions{flex:1;align-self:stretch;height:2.2em;margin-top:.3125em}body.swal2-toast-column .swal2-toast .swal2-loading{justify-content:center}body.swal2-toast-column .swal2-toast .swal2-input{height:2em;margin:.3125em auto;font-size:1em}body.swal2-toast-column .swal2-toast .swal2-validation-message{font-size:1em}</style>

<style type="text/css">

.textAliMain{

   margin-top: -325px;

}
#LoginMargin{
   margin-right: -10px;
}
.scroll_down{
   margin-top:  -350px;
   margin-right: -1200px;
}
.col-md-12.text-center{
   height: 250px;
}
#ascrail2000, #ascrail2000-hr {
    display: none !important;
}
</style>
</head>

<body class="sb-nav-fixed" style="overflow: visible;">

   <!-- --------------------------로그인 유저 세션(모든 컬럼)-------------------------------- -->
   <script>
            var userId;
            console.log(userId);
          </script>
      <% tb_memberDTO loginResult = (tb_memberDTO)session.getAttribute("loginResult"); 
         if(loginResult != null){
            System.out.print("로그인 회원 아이디 : " + loginResult.getM_id());
            String userId = loginResult.getM_id();
      %>
         <script>
              // JavaScript 코드 내에서 JSP 변수를 사용
              userId = '<%= userId %>';
              console.log(userId);
          </script>

       <% 
         }
      %>    
   
                <!-- Preloader -->
                <div id="preloader" style="display: none;">
                    <div id="status" style="display: none;">&nbsp;</div>
                </div>



   
    <header id="HOME" style="background-position: 50% -125px;">
	        <div class="section_overlay">
	            <nav class="navbar navbar-default">
	              <div class="container">
	                <!-- Brand and toggle get grouped for better mobile display -->
	                <div class="navbar-header">
	                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	                    <span class="sr-only">Toggle navigation</span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                  </button>
	                  <a  href="main.jsp"><img  src="images/Light Gray and Blue Modern Grocery Store Logo (1).png" style="width: 150px; height: 150px;"></a>
	                </div>
                   <!-- Collect the nav links, forms, and other content for toggling -->
                   <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                     <ul class="nav navbar-nav navbar-right">
                       <li><a href="main.jsp">Home</a></li>
                       <li><a href="#">|</a></li>
                       
                       <!-- 로그인 했을 때 바뀌는 메뉴 -->
                       <% if(loginResult != null){ %>
                       <li><a href="Board_List.jsp">COMMUNITY</a></li>
                       <li><a href="#">|</a></li>
                       <li><a href="LogoutService.do" id="LoginMargin">Logout</a></li>
                       <li><a href="#">|</a></li>
                       <li><a href="myPage.jsp" >mypage</a></li>
                       <!-- 로그인 안했을 때 바뀌는 메뉴 -->
                       <% }else{ %>
                        <li><a href="Board_List.jsp">COMMUNITY</a></li>
                       <li><a href="#">|</a></li>
                       <li><a href="login.jsp" id="LoginMargin">Login</a></li>
                       <% } %>
                     </ul>
                   </div><!-- /.navbar-collapse -->
                  </div><!-- /.container -->
               </nav> 
               <div class="container">
                   <div class="row">
                           <div class="home_text wow fadeInUp animated animated" style="visibility: visible; animation-name: fadeInUp;">
                           </div>
                   </div>
               </div>
               
               <div class="container">
                   <div class="row">
                   </div>
               </div> 
               
           </div> 
    </header>
    
     
   <section>
      <form name="form" method="post" action="$PHP_SELF" id="formMapper" style="margin-top: 15px;margin-bottom: 10px;">
                   <span style="font-weight: bold;font-size: 14px;color: #333;margin-left: 100px;">시/도:</span> 
                   <select name="city" id="city" onchange="change(this.selectedIndex);" class="bo_w_select">
                       <option value="전체">전체</option>
                       <option value="서울">서울특별시</option>
                       <option value="부산">부산광역시</option>
                       <option value="대구">대구광역시</option>
                       <option value="인천">인천광역시</option>
                       <option value="광주">광주광역시</option>
                       <option value="대전">대전광역시</option>
                       <option value="울산">울산광역시</option>
                       <option value="경기">경기도</option>
                       <option value="강원">강원도</option>
                       <option value="충북">충청북도</option>
                       <option value="충남">충청남도</option>
                       <option value="전북">전라북도</option>
                       <option value="전남">전라남도</option>
                       <option value="경북">경상북도</option>
                       <option value="경남">경상남도</option>
                       <option value="제주">제주도</option>
                   </select>                                                  
                   <span style="font-weight: bold; font-size: 14px; color: #333;">구/군:</span> 
                   <select name="county" id="country" class="bo_w_select">
                       <option value="">전체</option>
                   </select>
            </form> 
      </section>
      
          <!-- 카카오 지도 생성 -->
                <div style="width: 40%; float: left;" >
                 <div style="border: 5px solid #009688; border-radius: 8px; overflow: hidden; margin-left: 100px;">
                   <div id="map" style="width: 100%; height: 450px;"></div>
                 </div>
            </div>      
            
             <!-- 가게 정보 테이블 -->
                  <div id=store_table>
                     <table>
                           <tbody>
                                 <tr>
                                    <th colspan="2">가게 이미지</th>
                                    <th colspan="3">가게 정보</th>
                                 </tr>
                            <tr>
                                <td rowspan="8" colspan="2">
                                    <img id="shop_img" alt="가게 이미지" src="" style="width: 300px; height: 300px;">
                                </td>
                                <td>📋가게명</td>
                                <td colspan="2" id="shop_name"></td>
                            </tr>
                            <tr>
                                <td>🚩주소</td>
                                <td colspan="2" id="shop_addr"></td>
                            </tr>
                            <tr>
                                <td>📞전화번호</td>
                                <td colspan="2" id="shop_tel"></td>
                            </tr>
                            <tr>
                                <td>🛎업종</td>
                                <td colspan="2" id="shop_business"></td>
                            </tr>
                            <tr>
                                <td style= "width: 120px;">✅주요품목</td>
                                <td colspan="2" id="shop_items"></td>
                            </tr>
                            <tr>
                                <td>🚘주차여부</td>
                                <td id="shop_parking"></td>
                                <td >
                                   <button class="review" onclick="makeChart()">🔍 평점조회</button>
                                </td>
                            </tr>
                            <tr>
                                <td>✏리뷰 건수</td>
                                <td id="shop_review" class="review-count">0건</td>
                                <td colspan="2">
                                   <button class="review" id="modal_btn">🖊 리뷰작성</button>
                                   <button id="alertLogin" style="display: none;"></button>
                                </td>
                            </tr>
                            <tr>
                                <td>💕찜 수</td>
                                <td id="shop_like">0</td>
                                <td colspan="2">
                                   <button class="like_poeple" onclick="saveWish()">💛 찜하기</button>
                                   <button id="WishSuccess" style="display: none;"></button>
                                   <button id="alertWish" style="display: none;"></button>
                                </td>
                            </tr>
                         </tbody>
                     </table>
                  </div>
               </div>
             <!-- 가게 정보 테이블 -->
               
               <!-- 평점 통계 바 차트 -->
               <div style="display: flex; margin-top: 120px; margin-left: 110px">
                <div>
               <!--차트가 그려질 부분-->
               <canvas id="myChart" width="400px" height="300px"></canvas>
            </div>
               <!-- 평점 통계 바 차트 -->
            
            
            <!-- 간격을 위한 추가 요소 -->
              <div style="width: 70px;"></div>
            
            
            <!-- 성별 통계 파이 차트 -->
             <div class="pie_chart flex-shrink: 0;">
                  <canvas id="pieChartCanvas" width="300px" height="300px"></canvas>
              </div>
            <!-- 성별 통계 파이 차트 -->


            <!-- 간격을 위한 추가 요소 -->
              <div style="width: 70px;"></div>


            <!-- 연령대 히스토그램 -->
             <div class="histogram_chart flex-shrink: 0;">
                  <canvas id="histogramChartCanvas" width="400px" height="300px"></canvas>
              </div>
            </div>

            <!-- 리뷰 작성 팝업창 -->
            <div class="black_bg"></div>
            <div class="modal_wrap">
                <div class="modal_close"><a onclick="resetForm();">❎</a></div>
                <div>
                <table class="review-write">
                
                   <tr>
                   <th colspan="2" id="review_store" style="text-align: center">가게이름</th>
                   </tr>
                   
                   <tr>
                   <td height="50">서비스 or 맛 점수는 ?</td>
                  <td>
                  <div>
                     <div class="star-rating space-x-4 mx-auto">
                     <input type="radio" id="5-stars-service" name="service" value="5" v-model="ratings"/>
                     <label for="5-stars-service" class="star pr-4">★</label>
                     <input type="radio" id="4-stars-service" name="service" value="4" v-model="ratings"/>
                     <label for="4-stars-service" class="star">★</label>
                     <input type="radio" id="3-stars-service" name="service" value="3" v-model="ratings"/>
                     <label for="3-stars-service" class="star">★</label>
                     <input type="radio" id="2-stars-service" name="service" value="2" v-model="ratings"/>
                     <label for="2-stars-service" class="star">★</label>
                     <input type="radio" id="1-star-service" name="service" value="1" v-model="ratings" />
                     <label for="1-star-service" class="star">★</label>
                       </div>
                   </div>
                  </td>
                   </tr>
                   
                   <tr>
                   <td height="50">가성비 점수는 ?</td>
                  <td>
                  <div>
                     <div class="star-rating space-x-4 mx-auto">
                     <input type="radio" id="5-stars-effective" name="effective" value="5" v-model="ratings"/>
                     <label for="5-stars-effective" class="star pr-4">★</label>
                     <input type="radio" id="4-stars-effective" name="effective" value="4" v-model="ratings"/>
                     <label for="4-stars-effective" class="star">★</label>
                     <input type="radio" id="3-stars-effective" name="effective" value="3" v-model="ratings"/>
                     <label for="3-stars-effective" class="star">★</label>
                     <input type="radio" id="2-stars-effective" name="effective" value="2" v-model="ratings"/>
                     <label for="2-stars-effective" class="star">★</label>
                     <input type="radio" id="1-star-effective" name="effective" value="1" v-model="ratings" />
                     <label for="1-star-effective" class="star">★</label>
                 </div>
                   </div>
                  </td>
                   </tr>
                   
                   <tr>
                   <td height="50">청결도 점수는 ?</td>
                  <td>
                  <div>
                     <div class="star-rating space-x-4 mx-auto">
                     <input type="radio" id="5-stars-clean" name="clean" value="5" v-model="ratings"/>
                     <label for="5-stars-clean" class="star pr-4">★</label>
                     <input type="radio" id="4-stars-clean" name="clean" value="4" v-model="ratings"/>
                     <label for="4-stars-clean" class="star">★</label>
                     <input type="radio" id="3-stars-clean" name="clean" value="3" v-model="ratings"/>
                     <label for="3-stars-clean" class="star">★</label>
                     <input type="radio" id="2-stars-clean" name="clean" value="2" v-model="ratings"/>
                     <label for="2-stars-clean" class="star">★</label>
                     <input type="radio" id="1-star-clean" name="clean" value="1" v-model="ratings" />
                     <label for="1-star-clean" class="star">★</label>
                 </div>
                   </div>
                  </td>
                   </tr>
                   
                   <tr>
                      <td colspan="2">
                     <textarea name="content" placeholder="리뷰를 작성해주세요" rows="10" style="width:100%;"></textarea>
                   </td>
                   </tr>
                   
                   <tr>
                      <td colspan="2">
                     <div class="filebox">
                         <input class="upload-name" placeholder="영수증 파일을 첨부해주세요">
                         <label for="file">파일첨부</label> 
                         <input type="file" id="file" accept="image/png, image/jpeg">
                     </div>
                   </td>
                   </tr>
                   
                   <tr>
                      <td colspan="2">
                      <button class="register" onclick="saveReview()" type="button">등록</button>
                 
                   <!-- 리뷰등록 성공시 알림창 -->
                  <button id="ReviewSuccess" style="display: none;"></button>
                  <button id="alertReceipt" style="display: none;"></button>
                   </td>
                   </tr>
               
                  </table>
                </div>
             </div>


<footer style="margin-top: 5%;">
    	<div class="container" style="margin-right: 168px; margin-left: 140px;">
        <div class="container">
            <div class="row">
            </div>
        </div>
        <div class="container">
			<section class="services" id="SERVICE" style="padding: 50px 0; text-align: center;">
			    <div class="container">
			        <div class="row">
			            <div class="col-md-4">
			                <div class="single_service wow fadeInUp animated" data-wow-delay="1s" style="visibility: visible; animation-delay: 1s; animation-name: fadeInUp;">
			                    <i class="icon-pencil"></i>
			                    <img alt="" src="images/footer1.png" style="max-width: 350px; height: auto; display: block; margin: 0 auto;">
			                </div>
			            </div>
			            <div class="col-md-4">
			                <div class="single_service wow fadeInUp animated" data-wow-delay="2s" style="visibility: visible; animation-delay: 2s; animation-name: fadeInUp;">
			                    <i class="icon-gears"></i>
			                    <img alt="" src="images/footer2.png" style="max-width: 350px; height: auto; display: block; margin: 0 auto; margin-top: 0px;">
			                </div>
			            </div>
			            <div class="col-md-4">
			                <div class="single_service wow fadeInUp animated" data-wow-delay="3s" style="visibility: visible; animation-delay: 3s; animation-name: fadeInUp;">
			                    <i class="icon-camera"></i>
			                    <img alt="" src="images/footer3.png" style="max-width: 350px; height: auto; display: block; margin: 0 auto; margin-top: 0px;">
			                </div>
			            </div>
			        </div>            
			    </div>
			</section>
            <div class="row">
                <div class="col-md-12 text-center   wow fadeInUp animated" style="visibility: hidden; animation-name: none;">
                    <div class="social">
                        <h2>Follow Me on Here</h2>
                        <ul class="icon_list">
                            <li><a href="http://www.facebook.com/abdullah.noman99" target="_blank"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="http://www.twitter.com/absconderm" target="_blank"><i class="fa fa-twitter"></i></a></li>
                            <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                            <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="http://www.dribbble.com/abdullahnoman" target="_blank"><i class="fa fa-dribbble"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
            </div>
        </div>
    </div>
</footer>

<!-- =========================
     SCRIPTS 
============================== -->


    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nicescroll.js"></script>
    <script src="js/owl.carousel.js"></script>
    <script src="js/wow.js"></script>
    <script src="js/script.js"></script>
    <script src="js/main.js"></script>
