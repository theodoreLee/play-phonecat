angular.module('phonecat', ["phonecat.filters", "phonecat.services", "phonecat.controllers"])
  .config ['$routeProvider', ($routeProvider)->
    template = "/assets/partials"

    $routeProvider
      .when('/phones', {templateUrl: "#{template}/phone-list.html", controller: 'PhoneListCtrl'})
      .when('/phones/:phoneId', {templateUrl: "#{template}/phone-detail.html", controller: 'PhoneDetailCtrl'})
      .otherwise({redirectTo: '/phones'})
  ]
