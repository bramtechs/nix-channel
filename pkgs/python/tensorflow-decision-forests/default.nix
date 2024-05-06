{ lib, python311Packages, fetchurl }:

let 
  pkgs = import <nixpkgs> { config.allowUnfree = true; };
in python311Packages.buildPythonPackage rec {
  pname = "tensorflow-decision-forests";
  version = "1.9.0";
  format = "wheel";

  # TODO: architecture
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/60/78/a83ef523f65b69854ff73e507608782cd56200ca57e30787860e7e0ffd1b/tensorflow_decision_forests-1.9.0-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
    hash = "sha256-8kqDDp0MMoNXnOhAYAlYCrkpU3GgFAAVEZY758Gfiwc=";
  };

  meta = with lib; {
    description = "TensorFlow Decision Forests (TF-DF) is a library to train, run and interpret decision forest models (e.g., Random Forests, Gradient Boosted Trees) in TensorFlow. TF-DF supports classification, regression and ranking.";
    homepage = "https://github.com/tensorflow/decision-forests";
  };
}