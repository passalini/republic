var republicApp = angular.module('republicApp', []);

republicApp.controller('billsController', function ($scope, $http) {
  var _init = function () {
    _getBills();
    _initNewGroup();
  };

  var _getBills = function () {
    var responsePromise = $http.get('/group_bills.json');
    responsePromise.success(function(data, status, headers, config) {
        $scope.groups = data;
    });
  };

  var _initNewGroup = function () {
    $scope.newGroup = {
      month: null,
      observations: null,
      value: 0
    };
  };

  var _handle = function (response) {
    console.log(response.errors);
  }

  $scope.save = function (group) {
    var id = group.id;

    $http.put('/group_bills/'+id+'.json', group).
      success(function(data, status, headers, config) {
        alert('Success!');
      }).
      error(function(data, status, headers, config) {
        alert('Error!');
        _handle(data);
      });
  };

  $scope.delete = function (group) {
    var id = group.id;

    $http.delete('/group_bills/'+id+'.json', group).
      success(function(data, status, headers, config) {
        alert('Success!');
        _.remove($scope.groups, function(g) { return g == group; });
      }).
      error(function(data, status, headers, config) {
        alert('Error!');
        _handle(data);
      });
  };

  $scope.create = function (group) {
    $http.post('/group_bills.json', group).
      success(function(data, status, headers, config) {
        $scope.groups.push(data);
        _initNewGroup();
        $('#republic-month-modal').modal("hide");
      }).
      error(function(data, status, headers, config) {
        alert('Error!');
        _handle(data);
      });
  };

  _init();
});