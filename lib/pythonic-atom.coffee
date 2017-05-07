meta = require '../package.json'
spawn = require('child_process').spawn
path = require('path')
pythonPackages = path.join(path.resolve(__dirname, '..'), "requirements.txt")
module.exports =
  activate: (state) ->
    disabledPackages = atom.config.get("core.disabledPackages")
    if disabledPackages
        if 'language-python' not in disabledPackages
            disabledPackages.push('language-python')
        atom.config.set("core.disabledPackages", disabledPackages)
    else
        atom.config.set("core.disabledPackages", ["language-python"])
    atom.config.set("editor.showInvisibles", true)
    atom.config.set("editor.showIndentGuide", true)
    atom.config.set("editor.tabLength", 4)
    atom.config.set("editor.tabType", "soft")
    spawn('pip', ['install', '-r', pythonPackages])
    require('atom-package-deps').install(meta.name)
    .then ()->
        if not atom.config.get("pythonic-atom")
            atom.notifications.addSuccess("pythonic-atom : Packages Installed.")
            atom.config.set("pythonic-atom", 1)
