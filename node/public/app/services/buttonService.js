multiRoomApp.factory('buttonService',['$http',function($http){
        var fact = {};
        $http.get('/refreshSinks');
        $http.get('app/sinks.json').then(function(response){
                fact.responseData = response.data;
                console.log(fact.responseData);
                console.log(fact.responseData.volume);
        });

        return fact;
        }]);






