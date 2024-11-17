{ pkgs, ... }:
let
  modules = [
    ./main
    ./appearance
  ];

  wrapLua = p: "lua <<EOF\n${builtins.readFile p}\nEOF";

in
map
  (m: pkgs.callPackage m {
    inherit wrapLua;
  })
  modules

