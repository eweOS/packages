# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=setuptools-scm
pkgname=python-setuptools-scm
pkgver=10.2.1
pkgrel=1
pkgdesc="Handles managing your python package versions in scm metadata"
arch=('any')
url="https://github.com/pypa/setuptools-scm"
license=('MIT')
depends=('python-packaging' 'python-setuptools' 'python-typing_extensions' 'python-vcs-versioning')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('mercurial' 'python-pytest' 'python-pytest-timeout')
source=("git+$url.git#tag=$_name-v$pkgver")
sha256sums=('b7ef6ec8885b06ed15a2ddd4ca08298dd4f24b841d3decd960ec886e05812cd1')

build() {
  cd $_name/$_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name/$_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v \
    --deselect testing_scm/test_basic_api.py::test_get_version_blank_tag_regex
}

package() {
  cd $_name/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  _install_license_ LICENSE
}
