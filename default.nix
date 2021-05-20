{ gp-saml-gui, description, lib, buildPythonPackage, requests, pygobject
, gobject-introspection, glib }:

buildPythonPackage rec {
  pname = "gp-saml-gui";
  version = "0.1";
  src = gp-saml-gui;
  doCheck = false;
  nativeBuildInputs = [ gobject-introspection ];
  propagatedBuildInputs = [ requests pygobject glib ];
  meta = with lib; {
    inherit description;
    homepage = "https://github.com/dlenski/gp-saml-gui";
    license = licenses.gpl3Plus;
  };
}
