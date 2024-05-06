{ lib, python311Packages, fetchurl, tf-keras, tensorflow-decision-forests, pkgs }:

python311Packages.buildPythonPackage rec {
  pname = "tensorflowjs";
  version = "4.19.0";
  format = "wheel";

  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/b5/be/6ec8b5383c47872c2e2ab5b6ed95d8e84860078816254d0279242a212353/tensorflowjs-4.19.0-py3-none-any.whl";
    hash = "sha256-3wpbxRMj/jzIGUNjhbpgn7vkV9oD/0gGPZkWN0nSADE=";
  };

  propagatedBuildInputs = with pkgs.python311Packages; [
    h5py
    keras
    tensorflow
    tf-keras
    tensorflow-decision-forests
  ];

  meta = with lib; {
    description = "The Python Package for TensorFlow.js";
    homepage = "https://www.tensorflow.org/js/";
  };
}