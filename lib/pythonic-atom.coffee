meta = require '../package.json'
module.exports =
  activate: (state) ->
    disabledPackages = atom.config.get("core.disabledPackages")
    if disabledPackages
        disabledPackages.push('language-python')
        atom.config.set("core.disabledPackages", disabledPackages)
    else
        atom.config.set("core.disabledPackages", ["language-python"])
    atom.config.set("editor.showIndentGuide", true)
    atom.config.set("editor.tabLength", 4)
    atom.config.set("editor.tabType", "soft")
    require('atom-package-deps').install(meta.name)
    .then ()->
        if not atom.config.get("pythonic-atom")
            atom.notifications.addSuccess("Pythonic-Atom : Packages Installed.")
            atom.config.set("pythonic-atom", 1)
