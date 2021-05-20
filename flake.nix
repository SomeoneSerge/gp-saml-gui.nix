{
  description =
    "gp-saml-gui: Interactively authenticate to GlobalProtect VPNs that require SAML";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.devshell.url = "github:numtide/devshell";
  inputs.gp-saml-gui = {
    url = "github:dlenski/gp-saml-gui";
    flake = false;
  };

  outputs = { self, nixpkgs, flake-utils, gp-saml-gui, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        devshell = import inputs.devshell { inherit system; };
        pkgs = import nixpkgs { inherit system; };
      in rec {
        devShell = import ./shell.nix { inherit devshell; };
        packages.gp-saml-gui = (pkgs.callPackage ./default.nix {
          inherit gp-saml-gui;
          inherit (self) description;
          inherit (pkgs.python3Packages) buildPythonPackage requests;
          pygobject = pkgs.python3Packages.pygobject3;
        });
        defaultPackage = packages.gp-saml-gui;
        apps.gp-saml-gui =
          flake-utils.lib.mkApp { drv = packages.gp-saml-gui; };
        defaultApp = apps.gp-saml-gui;
      });
}
