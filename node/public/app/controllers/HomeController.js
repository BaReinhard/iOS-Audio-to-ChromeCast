multiRoomApp.controller('HomeController',['$scope','buttonService', '$http' ,'$timeout', function($scope,buttonService,$http,$timeout){

        // Self Executing Anonymous Function
    (function () {
        $scope.getButtons(); 
    })();
    
    // Gets All Buttons/Sinks
    $scope.getButtons = function () {
        buttonService.get().then(function (buttons) {
            $scope.buttons = buttons.data;
            $scope.currentVolume = 100;
            $scope.currentSink = 0;
            $scope.val = parseInt($scope.buttons[0].volume);
            $scope.sliderEnd = function () {
                $scope.buttons[$scope.currentSink].volume = $scope.val;
                $http.post('/changeVolume', $scope.volume);
            }
        });
    }

    // Called on Refresh Buttons
    $scope.refreshSinks = function(){
        $http.get('/refreshSinks').then(function () {
            $scope.getButtons();
        });        
    }

    $scope.moveSink = function (index) {
        $scope.val = parseInt($scope.buttons[index].volume);
        $scope.currentSink = $scope.buttons[index].sink;
        $http.post('/moveSink', $scope.currentSink);
    }

}]);
