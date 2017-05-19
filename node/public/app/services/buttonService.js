multiRoomApp.service('buttonService',['$http',function($http){
    return {
        get : function(){
            
            return  $http.get('app/sinks.json');
        }
        

            

    }
}]);
