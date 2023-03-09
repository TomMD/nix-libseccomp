{ pkgs ? import <nixos-21.11> {} }:

let scomp = pkgs.callPackage (./libseccomp.nix) { };
in pkgs.stdenv.mkDerivation {
  pname = "sandboxify";
  version = "0.5";

  rev = "cbe903e7f8839794fbe572ea4c811e2c802a4038";
  src = builtins.fetchGit {
    url = "https://github.com/TomMD/sandbox.git";
    rev = "42c9eab3eb7c2dc04637ba096c5ccf725d38c177";
    # rev = "cfde911802eb0fb1a4dbaa4812a4113aa18523fd";
  };

  buildInputs = [
    pkgs.git
    pkgs.gnumake
    pkgs.glibc.static
    pkgs.cacert
    scomp
    (pkgs.lib.getLib scomp)
  ];

  installPhase = ''
    mkdir -p "$out/bin"
    mv sandboxify "$out/bin"
  '';
}
