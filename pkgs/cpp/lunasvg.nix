{ stdenv
, lib
, fetchFromGitHub
, sharedLib ? true
, cmake
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "lunasvg";
  version = "2.4.0";

  src = fetchFromGitHub {
    owner = "sammycage";
    repo = "lunasvg";
    rev = "73da3ef408b934e0fe001c7b163df2e28d4713e7";
    hash = "sha256-sIqUBA9uNvu58yt0EYy+FyMBbD65tqckEnkNyZRcqkM=";
  };

  nativeBuildInputs = [ cmake ];

  cmakeFlags = [
    "-DLUNASVG_BUILD_EXAMPLES=OFF"
  ] ++ lib.optional sharedLib "-DBUILD_SHARED_LIBS=ON";

  outputs = [ "out" ];

  enableParallelBuilding = true;

  meta = with lib; {
    description = "Lunasvg c++ library";
    homepage = "https://github.com/sammycage/lunasvg";
    license = licenses.mit;
    maintainers = with maintainers; [ brambasiel ];
    platforms = platforms.all;
    changelog = "https://github.com/sammycage/lunasvg/releases/";
  };
})
