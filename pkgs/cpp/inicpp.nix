{ stdenv
, lib
, fetchFromGitHub
, cmake
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "inicpp";
  version = "1.2.2";

  src = fetchFromGitHub {
    owner = "SemaiCZE";
    repo = "inicpp";
    rev = "0f7bd53380ad88cb26b7b78d1296f9cad9fc3177";
    hash = "sha256-7jRlUytxPRZW9hUHOOV6T3Vp0v62m6rQhiRdOF0ojXk=";
  };

  outputs = [ "out" ];

  nativeBuildInputs = [ cmake ];
  enableParallelBuilding = true;

  meta = with lib; {
    description = "C++ parser of INI files with schema validation.";
    homepage = "https://github.com/SemaiCZE/inicpp";
    license = licenses.mit;
    maintainers = with maintainers; [ brambasiel ];
    platforms = platforms.all;
    changelog = "https://github.com/SemaiCZE/inicpp/releases";
  };
})
