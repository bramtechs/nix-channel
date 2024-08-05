{ stdenv
, lib
, fetchFromGitHub
, cmake
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "touch-scroll-physics";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "SemaiCZE";
    repo = "inicpp";
    rev = "ba6a56ab5537262ed72ec41a4047023f9a42e1a4";
    hash = "sha256-7jRlUytxPRZW9hUHOOV6T3Vp0v62m6rQhiRdOF0ojXk=";
  };

  outputs = [ "out" ];

  nativeBuildInputs = [ cmake ];
  enableParallelBuilding = true;

  meta = with lib; {
    description = "Quick port of a JavaScript scroll library to C.";
    homepage = "https://github.com/bramtechs/touch-scroll-physics-c";
    license = licenses.mit;
    maintainers = with maintainers; [ brambasiel ];
    platforms = platforms.all;
    changelog = "https://github.com/bramtechs/touch-scroll-physics-c";
  };
})
