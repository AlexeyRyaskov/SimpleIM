'use strict';
var companiesData = [{"Employees":[],"SelectedCompany":0,
"Id":1,"Name":"Рога и копыта"},{"Employees":[],"SelectedCompany":0,
"Id":2,"Name":"Comp1"},{"Employees":[],"SelectedCompany":0,
"Id":3,"Name":"MS"}];
var app = angular.module('myApp.view1', ['ngRoute'])

app.config(['$routeProvider', function($routeProvider) {
  $routeProvider
  .when('/view1', {
    templateUrl: 'view1/view1.html',
    controller: 'View1Ctrl'
  });
}])

// app.controller('View1Ctrl',['$scope', '$http', function($scope,$http){
//   // $scope.data = "unknown";
//   $http.get('http://localhost:8080/api/tickets/').success(function(data){
//     $scope.companies = data;
//     $scope.newCompany = '';
//     $scope.addCompany = function() {
//       if ($scope.newCompany != '') {
//           companiesData.push({country: $scope.newCompany});
//           $scope.newCompany = '';
//       }
//     }
//     $scope.removeCompany = function(name) {
//       var i = $scope.companies.indexOf(name);
//       $scope.companies.splice(i ,1);
//     }
//   });
// }]);

app.controller('View1Ctrl',function($scope) {
  $scope.companies = companiesData;
  $scope.newCompany = '';
  $scope.addCompany = function() {
    if ($scope.newCompany != '') {
        companiesData.push({Name: $scope.newCompany});
        $scope.newCompany = '';
    }
  }
  $scope.removeCompany = function(name) {
    var i = $scope.companies.indexOf(name);
    $scope.companies.splice(i ,1);
  }
  $scope.editCompany = function(name) {
  }
});

// http://jsonplaceholder.typicode.com/posts/2
// http://simpleim.satel.local/api/Company/
// https://s3.amazonaws.com/codecademy-content/courses/ltp4/forecast-api/forecast.json
