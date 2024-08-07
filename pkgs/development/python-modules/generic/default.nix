{
  lib,
  buildPythonPackage,
  pythonOlder,
  fetchPypi,
  exceptiongroup,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "generic";
  version = "1.1.3";
  disabled = pythonOlder "3.7";

  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-d4+CRv1uecIdS4t23cAI34s/PdIFYNQXfABuRWjzCUQ=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [ exceptiongroup ];

  pythonImportsCheck = [ "generic" ];

  meta = with lib; {
    description = "Generic programming (Multiple dispatch) library for Python";
    maintainers = [ ];
    homepage = "https://github.com/gaphor/generic";
    changelog = "https://github.com/gaphor/generic/releases/tag/${version}";
    license = licenses.bsd3;
  };
}
