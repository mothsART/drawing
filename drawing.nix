{ stdenv
, pkgconfig
, meson
, ninja
, python3
, gtk3
, gettext
}:

stdenv.mkDerivation rec {
  pname = "drawing";
  version = "0.4.10";
  src = stdenv.lib.cleanSource ./.;
  
  nativeBuildInputs = [ 
    meson
    ninja
    pkgconfig
    gettext
  ];

  meta = with stdenv.lib; {
    description = "drawing";
    homepage = "https://github.com/maoschanz/drawing";
    maintainers = with maintainers; [ mothsart ];
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
