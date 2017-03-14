
    '<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Ionic- Login page</title>



      <style>

      body {
        cursor: url(\'http://ionicframework.com/img/finger.png\'), auto;
      }

      .login-page {
          background: url(\'https://snap-photos.s3.amazonaws.com/img-thumbs/960w/QDHZ5ZR33F.jpg\');
          background-size: cover;
          background-attachment: fixed;
          background-position: center center;
      }

      .no-background {
        background: none !important;
      }

      .button-calm {
        background: #4789c1 !important;
        border-color:  #4789c1 !important;
      }

      .input-line {
        border-width: 0 0 2px 0 !important;
        border-color: #fff !important;
      }

      ::-webkit-input-placeholder { /* WebKit, Blink, Edge */
          color:    #fff !important;
          opacity:  0.7;
      }

      ::-moz-placeholder { /* Mozilla Firefox 19+ */
         color:    #fff !important;
         opacity:  0.7;
      }

      .input-text {
        color: #fff !important;
      }

      .logo {
        margin-top: 10vh;
      }

      .logo h1 {
        font-size: 60px;
        text-align: center;
        color: #fff;
      }

      .login-form {
        position: absolute;
        width: 100%;
        bottom: 10px;
      }

      </style>

</head>

<body>
  <html ng-app="ionicApp">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">

    <title>Ionic Login</title>

    <link href="https://code.ionicframework.com/nightly/css/ionic.css" rel="stylesheet">
    <script src="https://code.ionicframework.com/nightly/js/ionic.bundle.js"></script>

  </head>
  <body ng-controller="MyCtrl">


    <ion-view view-title="Login" class="login-page">
  <ion-content class="padding">

    <div class="logo">
      <h1>Welcome</h1>
    </div>




  </ion-content>

       <div class="login-form">
 <div class="list list-inset no-background">
  <label class="item item-input no-background input-line">
    <input class="input-text" type="text" placeholder="Email">
  </label>
  <label class="item item-input no-background input-line">
    <input class="input-text" type="password" placeholder="Password">
  </label>
  <button class="button button-calm button-block">
    Sign In
  </button>
</div>
 </div>


</ion-view>



    <ion-header-bar class="bar-stable">
      <h1 class="title">Log in</h1>
    </ion-header-bar>

    <ion-content>

    </ion-content>

  </body>
</html>

    <script>

    angular.module(\'ionicApp\', [\'ionic\'])

    .controller(\'MyCtrl\', function($scope) {


    });

    </script>

</body>
</html>
'
   
