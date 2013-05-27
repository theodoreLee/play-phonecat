describe "phoneCat controllers", ->
  beforeEach ->
    @addMatchers(
      toEqualData: (expected)->
        angular.equals(@actual, expected)
    )

  beforeEach module('phonecat.services')


  describe "PhoneListCtrl", ->
    scope = undefined
    ctrl = undefined
    $httpBackend = undefined

    beforeEach inject (_$httpBackend_, $rootScope, $controller) ->
      $httpBackend = _$httpBackend_
      $httpBackend.expectGET('phones/phones.json')
        .respond([
          {name: 'Nexus S'},
          {name: 'Motorola DROID'}
        ])
      scope = $rootScope.$new()
      ctrl = $controller(PhoneListCtrl, {$scope: scope})


    it 'should create "phones" model with 2 phones fetched from xhr', ->
      expect(scope.phones).toEqual []
      $httpBackend.flush()

      expect(scope.phones).toEqualData([
        {name: 'Nexus S'},
        {name: 'Motorola DROID'}
      ])


    it 'should set the default value of orderProp model', ->
      expect(scope.orderProp).toBe "age"


  describe 'PhoneDetailCtrl', ->
    scope = undefined
    $httpBackend = undefined
    ctrl = undefined
    xyzPhoneData = ->
      name: 'phone xyz'
      images: ['images/url1.png', 'images/url2.png']


    beforeEach inject (_$httpBackend_, $rootScope, $routeParams, $controller)->
      $httpBackend = _$httpBackend_
      $httpBackend.expectGET('phones/xyz.json').respond(xyzPhoneData())

      $routeParams.phoneId = 'xyz'
      scope = $rootScope.$new()
      ctrl = $controller(PhoneDetailCtrl, {$scope: scope})


    it 'should fetch phone detail', ->
      expect(scope.phone).toEqualData {}
      $httpBackend.flush()

      expect(scope.phone).toEqualData xyzPhoneData()
