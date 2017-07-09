multiRoomApp.controller('HomeController',['$scope','buttonService', '$http' ,'$timeout', function($scope,buttonService,$http,$timeout){
    $scope.getButtons = function () {
        buttonService.get().then(function (buttons) {
            $scope.buttons = buttons.data;
            $scope.val = parseInt($scope.buttons[0].volume);
        });
    }
    // Get Buttons/Sinks
    $scope.getButtons();
   $scope.currentVolume = 100;
            $scope.currentSink = 0;
            $scope.sliderEnd = function () {
                $scope.buttons[$scope.currentSink].volume = $scope.val;
                $http.post('/changeVolume', {volume: $scope.val});
            }

    // Called on to Refresh Buttons
    $scope.refreshSinks = function(){
        $http.get('/refreshSinks').then(function () {
            $scope.getButtons();
        });        
    }

    $scope.moveSink = function (index) {
        $scope.val = parseInt($scope.buttons[index].volume);
        $scope.currentSink = $scope.buttons[index].sink;
        $http.post('/moveSink', {sink: $scope.currentSink});
	for(var i = 0;i<$scope.buttons.length;i++){
		if(i==index){
			$('i').eq(i).addClass('on');
			$('i').eq(i).removeClass('off');
		}else{
			$('i').eq(i).addClass('off');
			$('i').eq(i).removeClass('on');
		}
	}

    }


}]);
