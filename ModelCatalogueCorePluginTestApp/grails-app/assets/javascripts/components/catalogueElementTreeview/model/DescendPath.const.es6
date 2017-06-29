//= require _mc.core.ui.catalogueElementTreeview.model
(function (window, angular) {
  const symbols = {
    path: Symbol('path')
  };

  class DescendPath {

    constructor(seed) {
      if (!angular.isArray(seed)) {
        throw new Error(`${seed} is not an array!`);
      }
      this[symbols.path] = angular.copy(seed);
    }

    concat(last) {
      return new DescendPath(this[symbols.path].concat(last));
    }

    get urlPath() {
      return this[symbols.path].join('-')
    }

  }

  angular.module('mc.core.ui.catalogueElementTreeview.model')
    .constant('DescendPath', DescendPath)
})(window, angular);
