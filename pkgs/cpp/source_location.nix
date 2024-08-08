{ stdenv
, lib
, fetchFromGitHub
, cmake
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "source_location";
  version = "0.4";

  src = fetchFromGitHub {
    owner = "paweldac";
    repo = "source_location";
    rev = "43f21f764f1c0e707684ebea123224134161839c";
    hash = "sha256-NZzJW52hLUPmFkkNO1sP3LvlEEyJviyoH8hASBITRps=";
  };

  nativeBuildInputs = [ cmake ];
  enableParallelBuilding = true;

  meta = with lib; {
    description = "pre-C++20 source_location implementation for enhanced logging and debugging capabilities.";
    homepage = "https://github.com/paweldac/source_location";
    license = licenses.mit;
    maintainers = with maintainers; [ brambasiel ];
    platforms = platforms.all;
    changelog = "https://github.com/paweldac/source_location/releases";
  };
})
