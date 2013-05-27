describe "PhoneCat App", ->
  describe "Phone list view", ->
    beforeEach ->
      browser().navigateTo('/')

    it 'should redirect / to /#/phones', ->
      browser().navigateTo('/')
      expect(browser().location().url()).toBe '/phones'

    it 'should filter the phone list as user types into the search box', ->
      expect(repeater('.phones li').count()).toBe 20

      input('query').enter('nexus')
      expect(repeater('.phones li').count()).toBe 1

      input('query').enter('motorola')
      expect(repeater('.phones li').count()).toBe 8


    it 'should be possible to control phone order via the drop down select box', ->
      input('query').enter('tablet')
      expect(repeater('.phones li', 'Phone List').column('phone.name'))
        .toEqual([
          "Motorola XOOM\u2122 with Wi-Fi",
          "MOTOROLA XOOM\u2122"
        ])

      select('orderProp').option('Alphabetical')

      expect(repeater('.phones li', 'Phone List').column('phone.name'))
        .toEqual([
          "MOTOROLA XOOM\u2122",
          "Motorola XOOM\u2122 with Wi-Fi"
        ])

    it 'should render phone specific links', ()->
      input('query').enter('nexus')
      element('.phones li a').click()
      expect(browser().location().url()).toBe('/phones/nexus-s')


  describe 'Phone detail view', ->
    beforeEach ->
      browser().navigateTo('/#/phones/nexus-s')

    it 'should display placeholder page with phoneId', ->
      expect(binding('phoneId')).toBe 'nexus-s'
