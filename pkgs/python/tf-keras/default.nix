{ lib, python311Packages, fetchurl, pkgs }:

python311Packages.buildPythonPackage rec {
  pname = "tf-keras";
  version = "2.16.0";
  format = "wheel";

  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/75/aa/cf09f8956d4f276f655b13674e15d8d6015fd832f9689aa9ff2a515781ab/tf_keras-2.16.0-py3-none-any.whl";
    hash = "sha256-sq0FQfp9npLEt6G5ZZM3evtYqv83QpmmymvhpC9R2Jk=";
  };

  propagatedBuildInputs = with pkgs.python311Packages; [
    tensorflow
  ];

  meta = with lib; {
    description = "TF-Keras is a deep learning API written in Python, running on top of the machine learning platform TensorFlow.";
    homepage = "https://keras.io/";
  };
}