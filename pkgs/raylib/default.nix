{ stdenv
, lib
, fetchFromGitHub
, cmake
, fetchpatch
, mesa
, libGLU
, glfw
, libX11
, libXi
, libXcursor
, libXrandr
, libXinerama
, alsaSupport ? stdenv.hostPlatform.isLinux
, alsa-lib
, pulseSupport ? stdenv.hostPlatform.isLinux
, libpulseaudio
, sharedLib ? true
, includeEverything ? true
, raylib-games
, darwin
}:
let
  inherit (darwin.apple_sdk.frameworks) Carbon Cocoa OpenGL;
in
stdenv.mkDerivation (finalAttrs: {
  pname = "raylib";
  version = "5.0";

  src = fetchFromGitHub {
    owner = "bramtechs";
    repo = "raylib";
    rev = "22ae3cb32fc0339b3a8df8260f43c75e40ee79b9";
    hash = "sha256-lzX+f56srrQeIlE1Xc/IaTyB2hgWkrqR2OSCMSdcfjQ=";
  };

  nativeBuildInputs = [ cmake ];

  buildInputs = [ glfw ]
    ++ lib.optionals stdenv.isLinux [ mesa libXi libXcursor libXrandr libXinerama ]
    ++ lib.optionals stdenv.isDarwin [ Carbon Cocoa ]
    ++ lib.optional alsaSupport alsa-lib
    ++ lib.optional pulseSupport libpulseaudio;

  propagatedBuildInputs = lib.optionals stdenv.isLinux [ libGLU libX11 ]
    ++ lib.optionals stdenv.isDarwin [ OpenGL ];

  # https://github.com/raysan5/raylib/wiki/CMake-Build-Options
  cmakeFlags = [
    "-DBUILD_EXAMPLES=OFF"
    "-DBUILD_GAMES=OFF"
    "-DCUSTOMIZE_BUILD=1"

    # add custom raylib flags
    "-DSUPPORT_FILEFORMAT_SVG=1"
    "-DSUPPORT_FILEFORMAT_JPG=1"
    "-DGLFW_BUILD_WAYLAND=0"
    
  ] ++ lib.optional includeEverything "-DINCLUDE_EVERYTHING=ON"
  ++ lib.optional sharedLib "-DBUILD_SHARED_LIBS=ON"
  ++ lib.optionals stdenv.isDarwin ["-DUSE_EXTERNAL_GLFW=ON"];

  passthru.tests = [ raylib-games ];

  meta = with lib; {
    description = "A simple and easy-to-use library to enjoy videogames programming";
    homepage = "https://www.raylib.com/";
    license = licenses.zlib;
    maintainers = with maintainers; [ adamlwgriffiths ];
    platforms = platforms.all;
    changelog = "https://github.com/raysan5/raylib/blob/${finalAttrs.version}/CHANGELOG";
  };
})
