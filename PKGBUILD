# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=setuptools-scm
pkgname=python-setuptools-scm
pkgver=10.3.4
pkgrel=1
pkgdesc="Handles managing your python package versions in scm metadata"
arch=('any')
url="https://github.com/pypa/setuptools-scm"
license=('MIT')
depends=('python-packaging' 'python-setuptools' 'python-typing_extensions' 'python-vcs-versioning>=2.5.0')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('mercurial' 'python-pytest' 'python-pytest-timeout')
source=("git+$url.git#tag=$_name-v$pkgver")
sha256sums=('56bbd637c8ef687af7377e42bb3710575ab145701c88c074952a588d52ed9289')

build() {
  cd $_name/$_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name
  python -m venv --system-site-packages "$_name/test-env"
  "$_name/test-env/bin/python" -m installer "$_name"/dist/*.whl
  # Run from the repository root so get_version() finds the git checkout and
  # Distribution creation does not infer a version from the package pyproject.
  "$_name/test-env/bin/python" -m pytest -v "$_name/testing_scm"
}

package() {
  cd $_name/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  _install_license_ LICENSE
}
