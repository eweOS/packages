# Maintainer: Yukari Chiba <i@0x7f.cc>

_pypiname=wheel
pkgname=python-wheel
pkgver=0.46.3
pkgrel=2
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
sha512sums=('8f92313cc26b55dd5d9720b95a7dce81493ac26f988c261c7eb2591bc0ac204df1c2ec5a58ab3c069bbdb59b13b27f807be29edec996c02d0b09e3ac2ad4aebc')

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
