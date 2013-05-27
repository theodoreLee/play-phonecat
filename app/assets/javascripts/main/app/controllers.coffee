module = angular.module('phonecat.controllers',[])
module.controller 'PhoneListCtrl', ['$scope', 'Phone', ($scope, Phone)->
  $scope.phones = Phone.query()

  $scope.orderProp = 'age'
]

module.controller 'PhoneDetailCtrl', ['$scope', '$routeParams', 'Phone', ($scope, $routeParams, Phone) ->
  $scope.phone = Phone.get {phoneId:$routeParams.phoneId}, (phone)->
    $scope.mainImageUrl = phone.images[0]

  $scope.setImage = (imageUrl) ->
    $scope.mainImageUrl = imageUrl
]