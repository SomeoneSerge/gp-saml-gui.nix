{ gp-saml-gui, description, lib, buildPythonPackage, requests, pygobject }:

buildPythonPackage rec {
    pname = "gp-saml-gui";
    version = "0.1";
    src = gp-saml-gui;
    doCheck = false;
    propagatedBuildInputs = [ requests pygobject ];
    meta = with lib; {
        inherit description;
        homepage = "https://github.com/dlenski/gp-saml-gui";
        license = licenses.gpl3Plus;
    };
}
