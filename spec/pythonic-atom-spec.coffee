 describe "when package activates", ->
    it "sets multiple editor settings", ->
    expect(atom.packages.isPackageLoaded('pythonic-atom')).toBe false
    atom.packages.activatePackage('pythonic-atom').then ->
      expect(atom.packages.isPackageLoaded('pythonic-atom')).toBe true
      expect(atom.packages.isPackageActive('pythonic-atom')).toBe true
      expect(atom.packages.isPackageActive('language-python')).toBe false      
