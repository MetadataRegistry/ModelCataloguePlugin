angular.module('mc.core.ui.infiniteListCtrl', ['mc.core.listEnhancer']).controller 'infiniteListCtrl', ($scope, columns, $timeout, $element, modelCatalogueApiRoot, actions, $controller, names, security, enhance, catalogue) ->
  'ngInject'

  angular.extend(this, $controller('columnsSupportCtrl', {$scope: $scope}))

  columnsDefined = $scope.columns?

  getEnumerations = (enumeratedType) ->
    return '' if not enumeratedType
    return enumeratedType.description if not enumeratedType.enumerations
    return enumeratedType.description if not enumeratedType.enumerations.values
    enumerations = []
    for enumeration, i in enumeratedType.enumerations.values
      enumerations.push "#{enumeration.key}: #{enumeration.value}"
    enumerations.join('\n')

  getCellForColumn = (element, column) ->
    cell =
      value:        $scope.evaluateValue(column.value, element)
      href:         $scope.evaluateValue(column.href, element)
      classes:      $scope.evaluateClasses(column.classes, element)
      textEllipsis: column.textEllipsis
    cell.type = 'link'  if cell.href and cell.value
    cell.type = 'html'  if not cell.type and cell.value and cell.value.indexOf('<') < cell.value.indexOf('>')
    if not cell.type and cell.value
      cell.type = 'plain'
      if cell.value
        cell.value = cell.value.toString()
        if cell.value.indexOf(columns.LONG_TEXT_BREAK) >= 0
          cell.shorten = true
          cell.fullValue = cell.value.replace("\n#{columns.LONG_TEXT_BREAK}\n", '\n')
          cell.value = cell.value.substring(0, cell.value.indexOf(columns.LONG_TEXT_BREAK))

    cell

  getPropertiesForElement = (element) ->
    properties = []
    if element and angular.isFunction(element.isInstanceOf)
      if element.isInstanceOf('catalogueElement')
        properties.push(label: 'Model Catalogue ID', value: -> element.modelCatalogueId)
        properties.push(label: 'Data Model', value: -> element.dataModel) if element.dataModel
      if element.isInstanceOf('dataElement')
        properties.push label: 'Data Type', value: -> element.dataType
      if element.isInstanceOf('dataType')
        properties.push label: 'Rule', value: -> element.rule
      if element.isInstanceOf('primitiveType')
        properties.push label: 'Measurement Unit', value: -> element.measurementUnit
      if element.isInstanceOf('referenceType')
        properties.push label: 'Data Class', value: -> element.dataClass
      if element.isInstanceOf('enumeratedType')
        properties.push label: 'Enumerations', value: getEnumerations

      if element and element.ext
        properties.push label: ''
        properties.push label: "#{element.getElementTypeName()} Metadata"

        if enhance.isEnhancedBy(element.ext, 'orderedMap')
          angular.forEach element.ext.values, (value) ->
            properties.push label: names.getNaturalName(value.key), value: -> value.value
        else
          angular.forEach element.ext, (value, key) ->
            properties.push label: names.getNaturalName(key), value: -> value
      if element and element.changed and element.latestVersion
        properties.push label: 'Type', value: -> element.type
        properties.push label: 'Changed Element', value: -> element.changed
        properties.push label: 'Root Element', value: -> element.latestVersion
        properties.push label: 'Author', value: -> element.author
        properties.push label: 'Property', value: -> element.property
        properties.push label: 'Old Value', value: -> if element.oldValue?.value then element.oldValue.value else element.oldValue
        properties.push label: 'New Value', value: -> if element.newValue?.value then element.newValue.value else element.newValue
        if element.difference
          properties.push label: 'Difference', value: -> element.difference
    properties

  getRowForElement = (element, oldRow) ->
    row = {element: element, properties: getPropertiesForElement(if element.relation then element.relation else element), sortable: $scope.isSortable, classesForStatus: $scope.classesForStatus(element), tail: [], $$expanded: $scope.$$expandAll ? false}

    if $scope.columns
      row.head = getCellForColumn(element, $scope.columns[0])
      if $scope.columns.length > 1
        for column in $scope.columns.slice(1)
          row.tail.push getCellForColumn(element, column)

    if element.relation and element.ext
      row.properties.push label: ''
      row.properties.push label: 'Relationship Metadata'

      if enhance.isEnhancedBy(element.ext, 'orderedMap')
        angular.forEach element.ext.values, (value) ->
          row.properties.push label: names.getNaturalName(value.key), value: -> value.value
      else
        angular.forEach element.ext, (value, key) ->
          row.properties.push label: names.getNaturalName(key), value: -> value

    if oldRow and oldRow.$$expanded
      row.$$expanded = true

    row

  addElements = (elements) ->
    return if not elements?.length
    $scope.elements ?= []
    $scope.rows     ?= []

    for element in elements
      $scope.elements.push element
      $scope.rows.push getRowForElement($scope.transform $element: element)

  replaceElements = (list) ->
    $scope.elements = []
    $scope.rows = []
    $scope.selected = -1
    addElements(list)

  onListUpdate = (newList) ->
    if newList
      if !columnsDefined
        $scope.columns = columns(newList.itemType)
      $scope.loading  = newList.empty and newList.total > 0
      $scope.rows     = []
      $scope.elements = []
      addElements(newList.list)
      $scope.next     = newList.next
      $scope.previous = newList.previous
      $scope.total    = newList.total
      $scope.reports  = newList.availableReportDescriptors
    else
      $scope.rows     = []
      $scope.elements = []
      $scope.next     = undefined
      $scope.previous = undefined
      $scope.total    = 0
      $scope.reports  = []
      $scope.loading  = false

  onListUpdate($scope.list)


  footerActions = actions.getActions($scope, actions.ROLE_LIST_FOOTER_ACTION)

  $scope.footerAction = if footerActions then footerActions[0]

  $scope.getFooterCentralIconClass = ->
    return "#{$scope.footerAction.icon} text-success"   if $scope.footerAction
    return 'fa-times-circle'                            if $scope.total == 0

  $scope.timeBetweenLoading = 1000

  $scope.lastLoadTime = new Date().getTime()

  $scope.isVisible = -> $element.is(':visible')

  $scope.loadMore = (max) ->
    if $scope.total > $scope.elements.length
      $scope.loading = true
      currentTime = new Date().getTime()
      if $scope.next
        if max
          $scope.next.url = URI($scope.next.url).removeSearch('max').addSearch('max', max).toString()
        $timeout($scope.next, Math.max(1, $scope.lastLoadTime + $scope.timeBetweenLoading - currentTime)).then (result) ->
          $scope.lastLoadTime = new Date().getTime()
          $scope.loading = false
          if not result?.list?
            $scope.next = undefined
            $scope.previous = undefined
          else
            addElements(result.list)
            $scope.next = result.next
            $scope.previous = result.previous
            $scope.page = result.page
    else
      $scope.loading = false

  $scope.incSize = (increment) ->
    if $scope.total > $scope.elements.length && $scope.next && $scope.next.url
      url = URI.parse($scope.next.url)
      next = URI.parseQuery(url.query)
      newMax = parseInt(next.max, 10)
      $scope.next.url = URI($scope.next.url).removeSearch('offset').addSearch('offset', parseInt(next.offset, 10) - newMax).removeSearch('max').addSearch('max', newMax + increment).toString()
      $scope.loading = true
      currentTime = new Date().getTime()
      $timeout($scope.next, Math.max(1, $scope.lastLoadTime + $scope.timeBetweenLoading - currentTime)).then (result) ->
        $scope.lastLoadTime = new Date().getTime()
        $scope.loading = false
        if not result?.list?
          $scope.next = undefined
          $scope.previous = undefined
        else
          replaceElements(result.list)  # addElements(result.list)
          $scope.next = result.next
          $scope.previous = result.previous
          $scope.page = result.page
    else
      $scope.loading = false

  $scope.loadNext = (max) ->
    if $scope.total > $scope.elements.length
      $scope.loading = true
      currentTime = new Date().getTime()
      if $scope.next
        if max
          $scope.next.url = URI($scope.next.url).removeSearch('max').addSearch('max', max).toString()
        $timeout($scope.next, Math.max(1, $scope.lastLoadTime + $scope.timeBetweenLoading - currentTime)).then (result) ->
          $scope.lastLoadTime = new Date().getTime()
          $scope.loading = false
          if not result?.list?
            $scope.next = undefined
            $scope.previous = undefined
          else
            replaceElements(result.list)  # addElements(result.list)
            $scope.next = result.next
            $scope.previous = result.previous
            $scope.page = result.page
    else
      $scope.loading = false

  $scope.loadPrevious = (max) ->
    if $scope.total > $scope.elements.length
      $scope.loading = true
      currentTime = new Date().getTime()
      if $scope.previous
        if max
          $scope.previous.url = URI($scope.previous.url).removeSearch('max').addSearch('max', max).toString()
        $timeout($scope.previous, Math.max(1, $scope.lastLoadTime + $scope.timeBetweenLoading - currentTime)).then (result) ->
          $scope.lastLoadTime = new Date().getTime()
          $scope.loading = false
          if not result?.list?
            $scope.next = undefined
            $scope.previous = undefined
          else
            replaceElements(result.list)  # addElements(result.list)
            $scope.next = result.next
            $scope.previous = result.previous
            $scope.page = result.page
    else
      $scope.loading = false

  $scope.$watch 'list', onListUpdate

  $scope.$on 'catalogueElementCreated', (ignored, newElement, url) ->
    return unless $scope.list
    return unless $scope.list.itemType
    return unless newElement
    return unless newElement.isInstanceOf and newElement.isInstanceOf($scope.list.itemType)
    return unless url
    return unless $scope.list.base
    return unless url.indexOf("#{modelCatalogueApiRoot}#{$scope.list.base}") >= 0 \
      or "#{modelCatalogueApiRoot}#{$scope.list.base}".indexOf(url) >= 0 \
      or url.indexOf("#{modelCatalogueApiRoot}#{$scope.list.base.replace('/relationships/', '/outgoing/')}") >= 0 \
      or "#{modelCatalogueApiRoot}#{$scope.list.base.replace('/relationships/', '/outgoing/')}".indexOf(url) >= 0 \
      or "#{modelCatalogueApiRoot}#{$scope.list.base.replace('/dataType/', '/enumeratedType/')}".indexOf(url) >= 0 \
      or "#{modelCatalogueApiRoot}#{$scope.list.base.replace('/dataType/', '/primitiveType/')}".indexOf(url) >= 0 \
      or "#{modelCatalogueApiRoot}#{$scope.list.base.replace('/dataType/', '/referenceType/')}".indexOf(url) >= 0

    $scope.total++
    $scope.elements.unshift newElement
    $scope.rows.unshift getRowForElement($scope.transform $element: newElement)
    $scope.list.total = $scope.total if $scope.list


  $scope.$on 'catalogueElementDeleted', (ignored, deleted, result, url) ->
    return unless deleted
    console.log url, $scope.list
    return if url and catalogue.isContentCandidate($scope.list, deleted, url: url) <= 0
    indexOfDeleted = -1
    if deleted.link
      for element, i in $scope.elements
        if $scope.transform($element: element).link == deleted.link
          indexOfDeleted = i
          break

    if indexOfDeleted >= 0
      $scope.total--
      $scope.elements.splice indexOfDeleted, 1
      $scope.rows.splice indexOfDeleted, 1
      $scope.list.total = $scope.total if $scope.list
      return

  DEBOUNCE_TIME = 500

  $scope.$eventToObservable('catalogueElementUpdated').debounce(DEBOUNCE_TIME).subscribe (data) ->
    element = data[1]
    angular.forEach $scope.elements, (item, index) ->
      if item.link == element.link
        if angular.isFunction(item.updateFrom)
          item.updateFrom(element)
          $scope.rows[index] = getRowForElement(item, $scope.rows[index])
