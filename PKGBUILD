# Maintainer: Yukari Chiba <i@0x7f.cc>

_pypiname=wheel
pkgname=python-wheel
pkgver=0.46.1
pkgrel=1
pkgdesc="A built-package format for Python"
arch=(any)
url="https://pypi.python.org/pypi/wheel"
license=('MIT')
depends=('python-packaging')
optdepends=('python-keyring: for wheel.signatures'
            'python-xdg: for wheel.signatures')
makedepends=('python-build' 'python-flit-core' 'python-installer')
# Missing python-flit (soft dependency)
checkdepends=('python-jsonschema' 'python-pytest' 'python-xdg'
	      'python-pytest-cov' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pypa/wheel/archive/$pkgver.tar.gz")
sha512sums=('b5785455ae2adb755921964b5c4f912496df27b2a3398ba5fe83af865b7990a0d90d3c777210912febb475b6e1cd7a7793133aaa0928ee46d3bcb08319234518')

build() {
  cd wheel-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  # Hack entry points by installing it
  cd wheel-$pkgver
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest -v
}

package() {
  cd wheel-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  _install_license_ LICENSE.txt
}
