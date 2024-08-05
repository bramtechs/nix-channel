{ stdenv
, lib
, fetchFromGitHub
, cmake
, mesa
, libGLU
, glfw
, libX11
, libXi
, libXcursor
, libXrandr
, libXinerama
, wayland-scanner
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
    rev = "a0aa9e3b879458291912363838b3997976a4cb3d";
    hash = "sha256-WgH2G0G9s+omQQ4Q1vcRYzpypRLy1YsnXhIxj1YAPk4=";
  };

  nativeBuildInputs = [ cmake ];

  buildInputs = [ glfw ]
    ++ lib.optionals stdenv.isLinux [ mesa libXi libXcursor libXrandr libXinerama wayland-scanner ]
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
    "-DUSE_EXTERNAL_GLFW=ON"
    
  ] ++ lib.optional includeEverything "-DINCLUDE_EVERYTHING=ON"
  ++ lib.optional sharedLib "-DBUILD_SHARED_LIBS=ON";

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
