multiRoomApp.controller('HomeController',['$scope', 'buttonService', '$http' ,'$timeout', function($scope,buttonService,$http,$timeout){

        var vm = this;

        $scope.buttons = {};

        $scope.buttons = buttonService;

        $scope.currentVolume = 100;
        $scope.currentSink = 0;
        vm.val = 100;
        $scope.sliderChange= function(sliderId,sliderVal){
                volume = {volume: sliderVal};
                $http.post('/changeVolume',volume);
};

        $scope.moveSink = function(sink){
                console.log(vm.val);
                console.log($scope.currentVolume);
                console.log($scope.currentSink);
                console.log(sink.volume);
                sink.volume =  vm.val;
                console.log(sink.volume);
                $scope.currentSink = sink.sink;
                $http.post('/moveSink', sink);


        }

}]);
