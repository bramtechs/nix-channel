{ stdenv
, lib
, fetchFromGitHub
, cmake
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "ada-url";
  version = "2.9.0";

  src = fetchFromGitHub {
    owner = "ada-url";
    repo = "ada";
    rev = "4358bcc6156e730eaff0681330ac74d187e881c1";
    hash = "sha256-1p9qe7n9dAzJ2opxfBsGXv9IeRdXraHVm7MBXr+QVbQ=";
  };

  nativeBuildInputs = [ cmake ];

  cmakeFlags = [
    "-DADA_TESTING=OFF"
    "-DADA_BENCHMARKS=OFF"
    "-DADA_TOOLS=OFF"
  ];

  enableParallelBuilding = true;

  meta = with lib; {
    description = "WHATWG-compliant and fast URL parser written in modern C++";
    homepage = "https://github.com/ada-url/ada";
    license = licenses.asl20;
    maintainers = with maintainers; [ brambasiel ];
    platforms = platforms.all;
    changelog = "https://github.com/ada-url/ada/releases";
  };
})
