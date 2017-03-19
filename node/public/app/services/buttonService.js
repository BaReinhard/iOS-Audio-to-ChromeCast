multiRoomApp.factory('buttonService',['$http',function($http){
        var fact = {};
        $http.get('app/sinks.json').then(function(response){
                fact.responseData = response.data;
                console.log(fact.responseData);

        });
        return fact;
        }]);

