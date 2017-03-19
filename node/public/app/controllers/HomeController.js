multiRoomApp.controller('HomeController',['$scope', 'buttonService',function($scope,buttonService){
        $scope.buttons = {};

        $scope.buttons = buttonService;
        console.log($scope.buttons);


}]);

