# Maintainer: Yukari Chiba <i@0x7f.cc>

_pypiname=wheel
pkgname=python-wheel
pkgver=0.44.0
pkgrel=1
pkgdesc="A built-package format for Python"
arch=(any)
url="https://pypi.python.org/pypi/wheel"
license=('MIT')
depends=('python-packaging')
optdepends=('python-keyring: for wheel.signatures'
            'python-xdg: for wheel.signatures')
makedepends=('python-build' 'python-flit-core' 'python-installer')
#checkdepends=('python-jsonschema' 'python-pytest' 'python-keyring' 'python-keyrings-alt'
#              'python-xdg' 'python-pytest-cov' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pypa/wheel/archive/$pkgver.tar.gz")
sha512sums=('1ffd45d988f713876f4856a947ad14736f590e4592797bbd5120b7751fc7e86043fbf9c75d405f410caaaf274f2c863bbef87ff0b663803651facd6acf50452b')

prepare() {
  cd wheel-$pkgver
  # https://github.com/pypa/wheel/pull/365 but why?
  rm -r src/wheel/vendored
  sed -i 's/from .vendored.packaging.requirements import Requirement/from packaging.requirements import Requirement/' src/wheel/metadata.py
  sed -i 's/from .vendored.packaging import tags/from packaging import tags/' src/wheel/bdist_wheel.py
  sed -i 's/from .vendored.packaging import version as _packaging_version/from packaging import version as _packaging_version/' src/wheel/bdist_wheel.py
  sed -i 's/from wheel.vendored.packaging import tags/from packaging import tags/' tests/test_bdist_wheel.py
}

build() {
  cd wheel-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  # Hack entry points by installing it
  # FIXME: missing dependency
  cd wheel-$pkgver
  #python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  #local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  #PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd wheel-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
