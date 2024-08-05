{ stdenv
, lib
, fetchFromGitHub
, cmake
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "inifile-cpp";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "Rookfighter";
    repo = "inifile-cpp";
    rev = "7bb1ec3534768e0d1fd9893d01027468b72af5ec";
    hash = "sha256-i5L6O468qB0OJR3IAmqOyNCYP/tOMv0rIr5xoGXGvJY=";
  };

  outputs = [ "out" ];

  nativeBuildInputs = [ cmake ];
  enableParallelBuilding = true;

  meta = with lib; {
    description = "A header-only and easy to use Ini file parser for C++.";
    homepage = "https://github.com/Rookfighter/inifile-cpp";
    license = licenses.mit;
    maintainers = with maintainers; [ brambasiel ];
    platforms = platforms.all;
    changelog = "https://github.com/Rookfighter/inifile-cpp";
  };
})
