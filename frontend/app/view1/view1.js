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

// .controller('View1Ctrl', ['$scope', '$http',
//     function($scope, $http) {
//         $http.jsonp('https://s3.amazonaws.com/codecademy-content/courses/ltp4/forecast-api/forecast.json?callback=JSON_CALLBACK').success(function(data) {
//           $scope.companies = data;
//           console.log(data)
//       });
//
//   }
// ]);

// .controller('View1Ctrl',['$scope', '$http', function($scope,$http){
//   // $scope.data = "unknown";
//   $http.get('http://simpleim.satel.local/api/Company/').success(function(data){
//       $scope.companies = data;
//     });
//
// }]);

.controller('View1Ctrl',
    function($scope) {
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
});
// http://jsonplaceholder.typicode.com/posts/2
// http://simpleim.satel.local/api/Company/
// https://s3.amazonaws.com/codecademy-content/courses/ltp4/forecast-api/forecast.json
