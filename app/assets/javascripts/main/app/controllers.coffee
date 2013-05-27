window.PhoneListCtrl = ['$scope', '$http', ($scope, $http)->
  #$http makes an HTTP GET request to our web server, asking for phone/phones.json
  # (the url is relative to our index.html file)
  $http.get("phones/phones.json").success(
    (data) ->
      $scope.phones = data
  )


  $scope.orderProp = 'age'
]