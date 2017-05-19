var multiRoomApp = angular.module('multiRoomApp',['ngRoute','rzModule']);

// configure out routes
multiRoomApp.config(function($routeProvider){
        $routeProvider

                .when('/', {
                        templateUrl : 'app/views/home/home.html',
                        controller : 'HomeController'
                })

                //route for the about page
                .when('/about', {
                        templateUrl : 'app/views/about/about.html',
                        controller : 'AboutController'
                })
                .otherwise({ redirectTo: '/' });

           });
