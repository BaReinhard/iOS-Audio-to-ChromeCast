multiRoomApp.controller('HomeController',['$scope', 'buttonService', '$http' ,'$timeout', function($scope,buttonService,$http,$timeout){

        var vm = this;

        $scope.buttons = {};

        $scope.buttons = buttonService;
        $scope.volume = $scope.buttons[0].volume;
        $scope.currentVolume = 100;
        $scope.currentSink = 0;
        vm.val = 100;
        $scope.val = $scope.volume;
        $scope.sliderChange= function(){
                $scope.volume = {volume: $scope.val};
                $http.post('/changeVolume',$scope.volume);
};
        $scope.refreshSinks = function(){
                $http.get('/refreshSinks').then(function(){
                        $scope.buttons = buttonService;       
                        
                }
                
        }

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
