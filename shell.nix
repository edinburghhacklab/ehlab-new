{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    soupault
    just
    watchexec
    gawk
    lua
  ];
}
