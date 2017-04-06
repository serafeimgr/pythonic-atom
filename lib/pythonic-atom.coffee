meta = require '../package.json'

module.exports =
  activate: (state) ->
    require('atom-package-deps').install(meta.name)
