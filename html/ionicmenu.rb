
    '<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Ionic Wheel</title>



      <style>

      .background-peach {
        background-color: #FF9C73;
      }


      </style>


</head>

<body>
  <html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">

  <title>Ionic Wheel</title>

    <link href="https://code.ionicframework.com/nightly/css/ionic.css" rel="stylesheet">
    <style>

    ion-wheel {
      position: absolute;
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
      margin: auto;
      width: 300px;
      height: 300px;
      border-radius: 50%;
    }

    #ionic-wheel {
      position: relative;
      height: 300px;
      width: 300px;
      border-radius: 50%;
    }

    #ionic-wheel .circle.active {
      top: calc(50% - 25px) !important;
      left: calc(50% - 25px) !important;
      opacity: 0;
      transition-property: opacity, left, top;
      transition-duration: 0.2s;
      transition-timing-function: ease-out;
      z-index: 9;
    }

    #ionic-wheel .circle {
      position: absolute;
      width: 50px;
      height: 50px;
      border-radius: 50%;
      background-color: #B2542D;
      box-shadow: 0px 2px 0px #69311A;
      box-sizing: border-box;
      border-radius: 50%;
      opacity: 1;
      transition-property: opacity, left, top;
      transition-duration: 0.1s;
      transition-timing-function: ease-out;
    }

    #ionic-wheel #activate {
      height: 50px;
      width: 50px;
      position: absolute;
      margin: 0 auto;
      transform: translate(-50%, -50%);
      top: 50%;
      left: 50%;
      background-color: #B2542D;
      border-radius: 50%;
      z-index: 10;
    }

    #ionic-wheel .circle i, #ionic-wheel #activate i {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      color: #fff;
      font-size: 20px;
    }

    .background-peach {
      background-color: #FF9C73;
    }

    </style>
    <script src="https://code.ionicframework.com/nightly/js/ionic.bundle.js"></script>

    <script>
    angular.module(\'ionic.wheel\', [])
      .directive(\'ionWheel\', function($ionicGesture) {

        return {
          restrict: \'E\',
          template: \'<div id="ionic-wheel" ng-transclude></div>\',
          transclude: true,
          link: function($scope, $element, $attr) {

            /**
             * Get elements
             */
            var circle = $element[0],
                circles = document.getElementsByClassName(\'circle\'),
                circleDimensions = circle.getBoundingClientRect(),
                transcludeDiv = document.getElementById(\'ionic-wheel\'),
                centerCircle = document.getElementById(\'activate\');

            /**
             * Position circles around parent circle
             */

            var theta = [];

            var n = circles.length;

            var r = (window.getComputedStyle(transcludeDiv).height.slice(0, -2) / 2) - (window.getComputedStyle(circles[0]).height.slice(0, -2) / 2);

            var frags = 360 / n;
            for (var i = 0; i <= n; i++) {
                theta.push((frags / 180) * i * Math.PI);
            }

            var mainHeight = parseInt(window.getComputedStyle(transcludeDiv).height.slice(0, -2)) / 1.2;

            var circleArray = [];

            for (var i = 0; i < circles.length; i++) {
              circles[i].posx = Math.round(r * (Math.cos(theta[i]))) + \'px\';
              circles[i].posy = Math.round(r * (Math.sin(theta[i]))) + \'px\';
              circles[i].style.top = ((mainHeight / 2) - parseInt(circles[i].posy.slice(0, -2))) + \'px\';
              circles[i].style.left = ((mainHeight/ 2 ) + parseInt(circles[i].posx.slice(0, -2))) + \'px\';
            }

            /**
             * Rotate circle on drag
             */

            var center = {
              x: circleDimensions.left + circleDimensions.width / 2,
              y: circleDimensions.top + circleDimensions.height / 2
            };

            var getAngle = function(x, y){
              var deltaX = x - center.x,
                  deltaY = y - center.y,
                  angle = Math.atan2(deltaY, deltaX) * 180 / Math.PI;

              if(angle < 0) {
                angle = angle + 360;
              }

              return angle;
            };

            var updatedAngle = 0,
                originalAngle = 0,
                currentAngle = 0;

            $ionicGesture.on(\'dragstart\', function(e){
              var pageX = e.gesture.touches[0].pageX;
              var pageY = e.gesture.touches[0].pageY;
              updatedAngle = getAngle(pageX, pageY);
            }, angular.element(circle));

            $ionicGesture.on(\'drag\', function(e){

              e.gesture.srcEvent.preventDefault();

              var pageX = e.gesture.touches[0].pageX;
              var pageY = e.gesture.touches[0].pageY;

              currentAngle = getAngle(pageX, pageY) - updatedAngle + originalAngle;

              circle.style.transform = circle.style.webkitTransform  = \'rotate(\' + currentAngle + \'deg)\';

              for (var i = 0; i < circles.length; i++) {
                circles[i].style.transform = circles[i].style.webkitTransform = \'rotate(\' + -currentAngle + \'deg)\';
              }

            }, angular.element(circle));

            $ionicGesture.on(\'dragend\', function(e){
              originalAngle = currentAngle;
            }, angular.element(circle));

          }
        }

      });


    </script>

</head>

  <body ng-app="starter">

    <ion-pane ng-controller="MainCtrl" class="background-peach">
      <ion-content scroll="false">

        <ion-header-bar class="bar-default">
          <h1 class="title">Ionic Wheel</h1>
        </ion-header-bar>

                <ion-wheel>
          <div id="activate" ng-click="showCircles()"><i ng-class="circlesHidden ? \'ion-arrow-expand\' : \'ion-arrow-shrink\'"></i></div>
          <div class="circle"><i class="icon ion-home"></i></div>
          <div class="circle"><i class="icon ion-alert-circled"></i></div>
          <div class="circle"><i class="icon ion-heart-broken"></i></div>
          <div class="circle"><i class="icon ion-trash-a"></i></div>
          <div class="circle"><i class="icon ion-email"></i></div>
          <div class="circle"><i class="icon ion-at"></i></div>
          <div class="circle"><i class="icon ion-pin"></i></div>
          <div class="circle"><i class="icon ion-lock-combination"></i></div>
        </ion-wheel>

      </ion-content>
    </ion-pane>
  </body>

</html>

    <script>

    angular.module(\'starter\', [\'ionic\', \'ionic.wheel\'])

    .controller(\'MainCtrl\', function($scope, $timeout) {

      var circles = document.getElementsByClassName(\'circle\');

      $scope.circlesHidden = true;

      $scope.showCircles= function() {
        var $circles = angular.element(circles);
        if ($scope.circlesHidden) {
          $circles.addClass(\'active\');
        } else {
          $circles.removeClass(\'active\');
        }
        $scope.toggleCirclesHidden();
      };

      $scope.toggleCirclesHidden = function() {
        return $scope.circlesHidden = !$scope.circlesHidden;
      };

    });

    </script>

</body>
</html>
'
   
