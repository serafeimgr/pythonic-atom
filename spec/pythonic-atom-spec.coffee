 describe "when package activates", ->
    it "sets multiple editor settings", ->
    expect(atom.packages.isPackageLoaded('pythonic-atom')).toBe false
    atom.packages.activatePackage('pythonic-atom').then ->
      expect(atom.packages.isPackageLoaded('pythonic-atom')).toBe true
      expect(atom.packages.isPackageActive('pythonic-atom')).toBe true
      invisibles = atom.config.get("editor.showInvisibles")
      indentGuide = atom.config.get("editor.showIndentGuide")
      result = invisibles && indentGuide

      length = atom.config.get("editor.editor.tabLength")
      tabs = atom.config.get("editor.tabType")

      expect(result).toBe true
      expect(length).toBe 4
      expect(tabs).toBe "soft"


 describe "package validation", ->
    it "installs/disables packages?", ->
    expect(atom.packages.isPackageLoaded('pythonic-atom')).toBe false
    atom.packages.activatePackage('language-python')
    atom.packages.activatePackage('pythonic-atom').then ->
      expect(atom.packages.isPackageLoaded('pythonic-atom')).toBe true
      expect(atom.packages.isPackageActive('pythonic-atom')).toBe true
      expect(atom.packages.isPackageActive('language-python')).toBe false
      expect(atom.config.get("pythonic-atom")).toBe 1
