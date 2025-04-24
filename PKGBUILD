# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-calver
pkgver=2025.04.17
pkgrel=1
pkgdesc="Setuptools extension for CalVer package versions"
url="https://github.com/di/calver"
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pretend')
source=("https://github.com/di/calver/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9d15bfefd02be1d6449beaed4f9dc8b5662442ebb747153cea1ea246c484c9240f449126fef3f175a2e66d49ec75112aaf91cf28f966abf4109d22ef2932e022')

prepare() {
  cd calver-$pkgver
  echo "Version: $pkgver" > PKG-INFO
}

build() {
  cd calver-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd calver-$pkgver

  # Allowing calver to read version from PKG-INFO may break the test
  mv PKG-INFO PKG-INFO.bak

  # makepkg sets SOURCE_DATE_EPOCH, which is recognized by calver since
  # e1f9f3aaa5fc8f (Support SOURCE_DATE_EPOCH for reproducible builds (#15)
  # and breaks the test
  env -u SOURCE_DATE_EPOCH PYTHONPATH="$PWD"/build/lib pytest -vv

  mv PKG-INFO.bak PKG-INFO
}

package() {
  cd calver-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  _install_license_ LICENSE
}
