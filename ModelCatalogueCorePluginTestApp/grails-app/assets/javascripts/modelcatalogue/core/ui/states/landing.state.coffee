angular.module('mc.core.ui.states.landing', ['modelcatalogue.core.ui.states.controllers.DashboardCtrl']).config(($stateProvider) ->
  'ngInject'

  $stateProvider.state 'landing', {
    url: '/'
    templateUrl: '/mc/core/ui/states/dashboard.html',
    controller: 'modelcatalogue.core.ui.states.controllers.DashboardCtrl'
    resolve:
      user: ['security', (security) ->
        if security.getCurrentUser() then return security.getCurrentUser() else return {displayName: ''}
      ]
  }
)
