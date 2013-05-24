describe "PhoneCat App", ->
  describe "Phone list view", ->
    beforeEach ->
      browser().navigateTo('/')

    it 'should filter the phone list as user types into the search box', ->
      expect(repeater('.phones li').count()).toBe 3

      input('query').enter('nexus')
      expect(repeater('.phones li').count()).toBe 1

      input('query').enter('motorola')
      expect(repeater('.phones li').count()).toBe 2


    it 'should be possible to control phone order via the drop down select box', ->
      input('query').enter('tablet')
      expect(repeater('.phones li', 'Phone List').column('phone.name'))
        .toEqual([
          "Motorola XOOM\u2122 with Wi-Fi",
          "MOTOROLA XOOM\u2122"
        ])

      select('orderProp').option('Alphabetical');

      expect(repeater('.phones li', 'Phone List').column('phone.name'))
        .toEqual([
          "MOTOROLA XOOM\u2122",
          "Motorola XOOM\u2122 with Wi-Fi"
        ])