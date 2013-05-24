describe "phoneCat controllers", ->
  describe "PhoneListCtrl", ->
    scope = undefined
    ctrl = undefined

    beforeEach ->
      scope = {}
      ctrl = new PhoneListCtrl(scope)

    it 'should create "phones" model with 3 phones', ->
      expect(scope.phones.length).toBe 3

    it 'should set the default value of orderProp model', ->
      expect(scope.orderProp).toBe "age"

