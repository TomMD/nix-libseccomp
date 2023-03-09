{ pkgs ? import <nixos-21.11> {} }:

pkgs.stdenv.mkDerivation {
  pname = "libseccomp-static";
  version = "2.5.3";

  src = builtins.fetchTarball {
    url = "https://github.com/seccomp/libseccomp/releases/download/v2.5.3/libseccomp-2.5.3.tar.gz";
    sha256 = "1fqg0pv52s3g57ycahr547hdqqjlklzriv52ny3awhxd5avrrw42";
  };

  buildInputs = [
    pkgs.gnumake
    pkgs.gperf
  ];

  configureFlags = [ "--enable-static" ];
}
