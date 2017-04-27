meta = require '../package.json'
module.exports =
  activate: (state) ->
    atom.config.set("core.disabledPackages", ["language-python"])
    atom.config.set("editor.tabLength", 4)
    atom.config.set("editor.tabType", "soft")
    require('atom-package-deps').install(meta.name)
