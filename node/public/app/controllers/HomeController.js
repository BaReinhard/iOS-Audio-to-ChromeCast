multiRoomApp.controller('HomeController',['$scope', 'buttonService','$http',function($scope,buttonService,$http){
        $scope.buttons = {};

        $scope.buttons = buttonService;
        
        $scope.moveSink = function(sink){
                       $http.post('/moveSinks', sink);
                
        }


}]);

