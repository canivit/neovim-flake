{ pkgs, lib, ... }:
let
  modules = pkgs.callPackage ./modules { };
  moduleDefaults = { plugins = [ ]; rc = ""; };
  lstToString = lib.lists.foldr (a: b: a + "\n" + b) "";
  getModulePlugins = module: (moduleDefaults // module).plugins;
  getModuleRC = module: (moduleDefaults // module).rc;
  modulesPlugins = lib.lists.concatMap getModulePlugins modules;
  modulesRC = lstToString (map getModuleRC modules);
in
pkgs.neovim.override {
  vimAlias = true;
  viAlias = true;
  configure = {
    customRC = modulesRC;
    packages.pluginPackage.start = modulesPlugins;
  };
}
