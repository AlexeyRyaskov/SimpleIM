'use strict';
var companiesData = [{"Employees":[],"SelectedCompany":0,
"Id":1,"Name":"Сател"},{"Employees":[],"SelectedCompany":0,
"Id":2,"Name":"Лоджиктел"},{"Employees":[],"SelectedCompany":0,
"Id":3,"Name":"Рентком"}];
angular.module('myApp.view1', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/view1', {
    templateUrl: 'view1/view1.html',
    controller: 'View1Ctrl'
  });
}])

.controller('View1Ctrl', ['$scope', '$http',
    function($scope, $http) {
        $http.jsonp('http://jsonplaceholder.typicode.com/posts/2/?callback=JSON_CALLBACK').success(function(data) {
          $scope.companies = data;
      });
  }
]);

// .controller('View1Ctrl',
//     function($scope) {
//         $scope.companies = companiesData;
// });
