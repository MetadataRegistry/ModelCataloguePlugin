describe "mc.core.ui.catalogueElementView", ->

  beforeEach module 'mc.core.ui.states.bs'
  beforeEach module 'mc.core.ui.bs.catalogueElementView'
  beforeEach module 'mc.core.ui.bs.catalogueElementTreeview'
  beforeEach module 'mc.core.ui.bs.catalogueElementProperties'
  beforeEach module 'mc.core.ui.bs.catalogueElementTreeviewItem'
  beforeEach module 'mc.core.ui.bs.infiniteTable'
  beforeEach module 'mc.core.ui.bs.propertiesPane'
  beforeEach module 'mc.core.ui.bs.simpleObjectEditor'
  beforeEach module 'mc.core.ui.bs.messagesPanel'

  it "element get compiled",  inject ($compile, $rootScope, enhance, $httpBackend) ->
    $httpBackend.when('GET', '/api/modelCatalogue/core/dashboard').respond(fixtures.dashboard.index)

    catEl = enhance angular.copy(fixtures.dataType.showOne)
    catEl.description = "Hello World!"

    numberOfTabs = 0

    for _, value of catEl
      if enhance.isEnhancedBy(value, 'listReference')
        numberOfTabs++

    $rootScope.element = catEl

    element = $compile('''
      <catalogue-element-view element="element"></catalogue-element-view>
    ''')($rootScope)

    $rootScope.$digest()

    expect(element.prop('tagName').toLowerCase()).toBe('div')
    expect(element.find('h3.ce-name').text().trim()).toBe("#{catEl.name} None 0.0.0".trim())
    expect(element.find('blockquote.ce-description').text()).toBe(catEl.description)

    element.find('ul.nav.nav-tabs li').each (index, element) ->
      console.log $(element).data('tab-name')

    expect(element.find('ul.nav.nav-tabs li').length).toBe(numberOfTabs - 1)
    expect(element.find('div.tab-pane').length).toBe(numberOfTabs - 1)

    expect(element.find('.dl-table-item-row').length).toBe(0)

    $rootScope.$digest()


    expect(element.find('.dl-table-item-row').length).toBe(0)