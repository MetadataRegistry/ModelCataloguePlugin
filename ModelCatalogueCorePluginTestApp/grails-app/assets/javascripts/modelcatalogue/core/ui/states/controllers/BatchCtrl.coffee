angular.module('modelcatalogue.core.ui.states.controllers.BatchCtrl', ['ui.router', 'mc.util.ui']).controller('modelcatalogue.core.ui.states.controllers.BatchCtrl', [
  '$scope', '$stateParams', '$state', 'element', 'applicationTitle',
  ($scope ,  $stateParams ,  $state ,  element ,  applicationTitle) ->
    $scope.element = element
    $scope.batch = element
    applicationTitle "Actions in batch #{element.name}"
])
