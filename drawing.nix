{ stdenv
, desktop-file-utils
, file
, gobject-introspection
, pkgconfig
, appstream-glib
, meson
, ninja
, python3
, gtk3
, wrapGAppsHook
, gettext
, glib
}:

stdenv.mkDerivation rec {
  pname = "drawing";
  version = "0.4.10";
  src = stdenv.lib.cleanSource ./.;
  
  nativeBuildInputs = [
    wrapGAppsHook
    gobject-introspection
    pkgconfig
    appstream-glib
    meson
    ninja
    python3
    gtk3
    gettext
    glib
  ];

  buildInputs = [
    file
    desktop-file-utils
    gtk3
  ];

  postPatch = ''
    chmod +x build-aux/meson/postinstall.py # patchShebangs requires executable file
    patchShebangs build-aux/meson/postinstall.py
  '';

  propagatedBuildInputs = with python3.pkgs; [
    pygobject3
  ];

  meta = with stdenv.lib; {
    description = "drawing";
    homepage = "https://github.com/maoschanz/drawing";
    maintainers = with maintainers; [ mothsart ];
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
